/*
 * Copyright (C) 2010-2014 Daniel Richter <danielrichter2007@web.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
 */

#ifndef SRC_LIB_PROCESS_HPP_
#define SRC_LIB_PROCESS_HPP_

#include <string>
#include <memory>
#include <map>
#include <vector>

#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>

#include <iostream>

#include "Pipe.hpp"

class Process : public std::enable_shared_from_this<Process>
{
	public: enum StdChannels {
		STDIN  = 0,
		STDOUT = 1,
		STDERR = 2
	};

	public: enum ForkPids {
		CHILD = 0,
		ERROR = -1
	};

	public: enum ChildAction {
		READ = 'r',
		WRITE = 'w'
	};

	public: enum FileWriteMode {
		REPLACE,
		APPEND
	};

	public: class PipeConnection
	{
		public: unsigned int channel;
		public: std::shared_ptr<Pipe> pipe;
		public: Process::ChildAction childAction;

		public: PipeConnection() : childAction(ChildAction::READ), channel(0) {}

		public: PipeConnection(unsigned int fileDescriptorToMap, Process::ChildAction childAction, std::shared_ptr<Pipe> pipe) :
			channel(fileDescriptorToMap),
			childAction(childAction),
			pipe(pipe)
		{}
	};

	private: std::map<unsigned int, PipeConnection> pipeConnections;
	private: std::string cmd;
	private: std::vector<std::string> args;
	private: std::shared_ptr<Process> pipeDest;
	private: std::map<unsigned int, std::string> inputFiles;
	private: std::map<unsigned int, std::string> outputFiles;
	private: std::map<unsigned int, FileWriteMode> outputFilesAppendFlags;

	private: pid_t processId;

	protected: Process() : processId(-1) {}

	public: static std::shared_ptr<Process> create(std::string const& cmd)
	{
		std::shared_ptr<Process> proc = nullptr;

		auto procPtr = new Process();
		try {
			proc = std::shared_ptr<Process>(procPtr);
		} catch (std::bad_alloc const& e) {
			delete procPtr;
			throw e;
		}

		proc->cmd = cmd;
		return proc;
	}

	public: std::shared_ptr<Process> setCmd(std::string const& cmd)
	{
		this->cmd = cmd;
		return shared_from_this();
	}

	public: std::shared_ptr<Process> setArguments(std::vector<std::string> const& args)
	{
		this->args = args;
		return shared_from_this();
	}

	public: std::shared_ptr<Process> addArgument(std::string const& arg)
	{
		this->args.push_back(arg);
		return shared_from_this();
	}

	public: std::shared_ptr<Process> addPipe(
		unsigned int fileDescriptorToMap,
		Process::ChildAction childAction,
		std::shared_ptr<Pipe> pipe
	) {
		this->pipeConnections[fileDescriptorToMap] = PipeConnection(
			fileDescriptorToMap,
			childAction,
			pipe
		);
		return shared_from_this();
	}

	/**
	 * comfort function to easily assign stdin
	 */
	public: std::shared_ptr<Process> setStdIn(std::shared_ptr<Pipe> pipe)
	{
		return this->addPipe(Process::STDIN, Process::ChildAction::READ, pipe);
	}

	/**
	 * comfort function to easily assign stdout
	 */
	public: std::shared_ptr<Process> setStdOut(std::shared_ptr<Pipe> pipe)
	{
		return this->addPipe(Process::STDOUT, Process::ChildAction::WRITE, pipe);
	}

	/**
	 * comfort function to easily assign stderr
	 */
	public: std::shared_ptr<Process> setStdErr(std::shared_ptr<Pipe> pipe)
	{
		return this->addPipe(Process::STDERR, Process::ChildAction::WRITE, pipe);
	}

	public: std::shared_ptr<Process> readFrom(std::string const& filePath, unsigned int fileDescriptor = Process::STDIN)
	{
		this->inputFiles[fileDescriptor] = filePath;
		return shared_from_this();
	}

	public: std::shared_ptr<Process> writeInto(
		std::string const& filePath,
		FileWriteMode writeMode = FileWriteMode::REPLACE,
		unsigned int fileDescriptor = Process::STDOUT
	) {
		this->outputFiles[fileDescriptor] = filePath;
		this->outputFilesAppendFlags[fileDescriptor] = writeMode;
		return shared_from_this();
	}

	/**
	 * comfort function to attach another process as pipe target
	 */
	public: std::shared_ptr<Process> pipeInto(std::shared_ptr<Process> otherProcess)
	{
		auto procToProcPipe = std::make_shared<Pipe>();
		this->setStdOut(procToProcPipe);
		otherProcess->setStdIn(procToProcPipe);
		this->pipeDest = otherProcess;
		return shared_from_this();
	}

	public: std::shared_ptr<Process> run()
	{
		this->processId = this->createNewProcess(std::bind(std::mem_fn(&Process::handleChildProcess), this));

		for (auto pipeConnection : this->pipeConnections) {
			if (pipeConnection.second.childAction == ChildAction::WRITE) {
				pipeConnection.second.pipe->closeWriteDescriptor();
			}
			if (pipeConnection.second.childAction == ChildAction::READ) {
				pipeConnection.second.pipe->closeReadDescriptor();
			}
		}

		if (this->pipeDest) {
			this->pipeDest->run();
		}
		return shared_from_this();
	}

	public: int finish()
	{
		int res = 0;
		::waitpid(this->processId, &res, 0);
		return res;
	}

	public: std::shared_ptr<Pipe> getPipe(unsigned int channel)
	{
		return this->pipeConnections[channel].pipe;
	}

	private: pid_t createNewProcess(std::function<void()> childProcess)
	{
		pid_t pid = ::fork();

		if (pid == ForkPids::CHILD) {
			childProcess();
		}

		if (pid == ForkPids::ERROR) {
			throw std::runtime_error("fork failed");
		}

		return pid;
	}

	private: void handleChildProcess() {
		for (auto pipeConnection : this->pipeConnections) {
			if (pipeConnection.second.childAction == ChildAction::WRITE) {
				pipeConnection.second.pipe->closeReadDescriptor();
				pipeConnection.second.pipe->mapWriteDescriptor(pipeConnection.second.channel);
			}
			if (pipeConnection.second.childAction == ChildAction::READ) {
				pipeConnection.second.pipe->closeWriteDescriptor();
				pipeConnection.second.pipe->mapReadDescriptor(pipeConnection.second.channel);
			}
		}

		for (auto inputFile : this->inputFiles) {
			int file = ::open(inputFile.second.c_str(), 0);
			::dup2(file, inputFile.first);
			::close(file);
		}

		for (auto outputFile : this->outputFiles) {
			bool replace = this->outputFilesAppendFlags[outputFile.first] == FileWriteMode::REPLACE;
			int file = ::open(
				outputFile.second.c_str(),
				O_WRONLY | O_CREAT | (replace ? O_TRUNC : O_APPEND)
			);
			::dup2(file, outputFile.first);
			::close(file);
		}

		auto argv = new char*[this->args.size() + 2];

		int i = 0;

		argv[i++] = const_cast<char*>(this->cmd.c_str());
		for (auto& arg : this->args) {
			argv[i++] = const_cast<char*>(arg.c_str());
		}
		argv[i++] = NULL;

		::execvp(cmd.c_str(), argv);
	}
};

#endif /* SRC_LIB_PROCESS_HPP_ */