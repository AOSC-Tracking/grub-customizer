/*
 * Copyright (C) 2010-2011 Daniel Richter <danielrichter2007@web.de>
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

#include "Theme.h"

Model_Theme::Model_Theme(std::string const& directory, std::string const& zipFile, std::string const& name)
	: directory(directory), name(name), zipFile(zipFile)
{
	if (directory != "") {
		this->load(directory);
	}

	if (zipFile != "") {
		this->loadZipFile(zipFile);
	}
}

void Model_Theme::load(std::string const& directory) {
	DIR* dir = opendir(directory.c_str());
	if (dir) {
		struct dirent *entry;
		struct stat fileProperties;
		while ((entry = readdir(dir))) {
			if (std::string(entry->d_name) == "." || std::string(entry->d_name) == "..") {
				continue;
			}
			std::string currentFileName = directory + "/" + entry->d_name;
			stat(currentFileName.c_str(), &fileProperties);
			if (S_ISDIR(fileProperties.st_mode)) {
				this->load(currentFileName);
			} else {
				this->files.push_back(Model_ThemeFile(this->extractLocalPath(currentFileName)));
			}
		}
		closedir(dir);
		this->files.sort(&Model_ThemeFile::compareLocalPath);
	} else {
		throw FileReadException("cannot read the theme directory: " + this->directory);
	}
}

void Model_Theme::loadZipFile(std::string const& zipFile) {
	struct archive *a;
	struct archive_entry *entry;
	int r;

	a = archive_read_new();
	archive_read_support_filter_all(a);
	archive_read_support_format_all(a);
	r = archive_read_open_filename(a, zipFile.c_str(), 10240);
	if (r != ARCHIVE_OK) {
		throw InvalidFileTypeException("archive not readable", __FILE__, __LINE__);
	}
	while (archive_read_next_header(a, &entry) == ARCHIVE_OK) {
		this->files.push_back(std::string(archive_entry_pathname(entry)));
		archive_read_data_skip(a);
	}
	r = archive_read_free(a);
	if (r != ARCHIVE_OK) {
		throw InvalidFileTypeException("archive not readable", __FILE__, __LINE__);
	}
}

std::string Model_Theme::loadFileContent(std::string localFileName) {
	if (this->directory != "") {
		return this->loadFileContentFromDirectory(localFileName);
	} else if (this->zipFile != "") {
		return this->loadFileContentFromZip(localFileName);
	} else {
		throw LogicException("neither directory nor zip file set", __FILE__, __LINE__);
	}
}

std::string Model_Theme::loadFileContentExternal(std::string const& externalPath) {
	std::string data;
	FILE* file = fopen(externalPath.c_str(), "r");
	if (file) {
		data.reserve(10240);
		int c;
		while ((c = fgetc(file)) != EOF) {
			data += char(c);
		}
		fclose(file);
	} else {
		throw FileReadException("cannot read file: " + externalPath, __FILE__, __LINE__);
	}
	return data;
}

std::string Model_Theme::loadFileContentFromDirectory(std::string localFileName) {
	return this->loadFileContentExternal(this->directory + "/" + localFileName);
}

std::string Model_Theme::loadFileContentFromZip(std::string localFileName) {
	struct archive *a;
	struct archive_entry *entry;
	int r;
	std::string result;

	a = archive_read_new();
	archive_read_support_filter_all(a);
	archive_read_support_format_all(a);
	r = archive_read_open_filename(a, zipFile.c_str(), 10240);
	if (r != ARCHIVE_OK) {
		throw InvalidFileTypeException("archive not readable", __FILE__, __LINE__);
	}
	while (archive_read_next_header(a, &entry) == ARCHIVE_OK) {
		if (std::string(archive_entry_pathname(entry)) == localFileName) {
			ssize_t size = 0;
			do {
				char data[1024];
				size = archive_read_data(a, data, 1024);
				result += std::string(data, size);
			} while (size > 0);
		}
		archive_read_data_skip(a);
	}
	r = archive_read_free(a);
	if (r != ARCHIVE_OK) {
		throw InvalidFileTypeException("archive not readable", __FILE__, __LINE__);
	}
	return result;
}

void Model_Theme::writeFile(Model_ThemeFile& file, std::string const& path) {
	this->createFilePath(path);
	FILE* outFile = fopen(path.c_str(), "w");
	if (outFile) {
		fwrite(file.content.c_str(), file.content.size(), 1, outFile);
		fclose(outFile);
		file.content = "";
		file.contentLoaded = false;
	} else {
		throw FileSaveException("failed saving file to " + path, __FILE__, __LINE__);
	}
}

bool Model_Theme::fileExists(std::string const& path) {
	FILE* file = fopen(path.c_str(), "r");
	if (file) {
		fclose(file);
		return true;
	} else {
		return false;
	}
}

bool Model_Theme::isDir(std::string const& path) {
	DIR* dir = opendir(path.c_str());
	if (dir) {
		closedir(dir);
		return true;
	} else {
		return false;
	}
}

void Model_Theme::createFilePath(std::string const& path) {
	std::string currentPart = "";
	for (std::string::const_iterator pathIter = path.begin(); pathIter != path.end(); pathIter++) {
		if (*pathIter == '/') {
			mkdir(currentPart.c_str(), 0755);
		}
		currentPart += *pathIter;
	}
}

/**
 * @return int remaining file count
 */
int Model_Theme::deleteEmptyDirectories(std::string const& path) {
	int remainingFileCount = 0;
	DIR* dir = opendir(path.c_str());
	if (dir) {
		struct dirent *entry;
		struct stat fileProperties;
		while ((entry = readdir(dir))) {
			if (std::string(entry->d_name) == "." || std::string(entry->d_name) == "..") {
				continue;
			}
			std::string currentFileName = path + "/" + entry->d_name;
			stat(currentFileName.c_str(), &fileProperties);
			if (S_ISDIR(fileProperties.st_mode)) {
				int remainingFileCountSubDir = this->deleteEmptyDirectories(currentFileName);
				if (remainingFileCountSubDir == 0) {
					rmdir(currentFileName.c_str());
				} else {
					remainingFileCount++;
				}
			} else {
				remainingFileCount++;
			}
		}
		closedir(dir);
	} else {
		throw FileReadException("cannot read directory: " + path, __FILE__, __LINE__);
	}
	return remainingFileCount;
}

void Model_Theme::renameDirectory(std::string const& themePath, std::string const& localDirName, std::string const& newLocalDirName) {
	rename((themePath + "/" + localDirName).c_str(), (themePath + "/" + newLocalDirName).c_str());
	for (std::list<Model_ThemeFile>::iterator themeFileIter = this->files.begin(); themeFileIter != this->files.end(); themeFileIter++) {
		if (themeFileIter->localFileName.substr(0, localDirName.length() + 1) == localDirName + "/") {
			themeFileIter->localFileName.replace(0, localDirName.length(), newLocalDirName);
		}
	}
}

std::string Model_Theme::getFullFileName(std::string localFileName) {
	if (this->directory != "") {
		return this->directory + "/" + localFileName;
	} else {
		std::string fileContent = this->loadFileContentFromZip(localFileName);
		FILE* file = fopen("/tmp/grub-customizer_theme_preview", "w");
		if (!file) {
			throw FileSaveException("cannot write preview file to " + localFileName, __FILE__, __LINE__);
		}
		fwrite(fileContent.c_str(), fileContent.size(), 1, file);
		fclose(file);
		return "/tmp/grub-customizer_theme_preview";
	}
}

Model_ThemeFile& Model_Theme::getFile(std::string localFileName) {
	for (std::list<Model_ThemeFile>::iterator fileIter = this->files.begin(); fileIter != this->files.end(); fileIter++) {
		if (fileIter->localFileName == localFileName) {
			return *fileIter;
		}
	}
	throw ItemNotFoundException("themefile " + localFileName + " not found!", __FILE__, __LINE__);
}

Model_ThemeFile& Model_Theme::getFileByNewName(std::string localFileName) {
	for (std::list<Model_ThemeFile>::iterator fileIter = this->files.begin(); fileIter != this->files.end(); fileIter++) {
		if (fileIter->newLocalFileName == localFileName) {
			return *fileIter;
		}
	}
	throw ItemNotFoundException("themefile " + localFileName + " not found!", __FILE__, __LINE__);
}

void Model_Theme::removeFile(Model_ThemeFile const& file) {
	for (std::list<Model_ThemeFile>::iterator fileIter = this->files.begin(); fileIter != this->files.end(); fileIter++) {
		if (&*fileIter == &file) {
			this->files.erase(fileIter);
			return;
		}
	}
	throw ItemNotFoundException("themefile " + file.localFileName + " not found!", __FILE__, __LINE__);
}

void Model_Theme::save(std::string const& baseDirectory) {
	std::string themeDir = baseDirectory + "/" + this->name;
	mkdir(themeDir.c_str(), 0755);
	for (std::list<Model_ThemeFile>::iterator fileIter = this->files.begin(); fileIter != this->files.end(); fileIter++) {
		if (this->zipFile != "" && !fileIter->contentLoaded) {
			fileIter->content = this->loadFileContentFromZip(fileIter->localFileName);
			fileIter->contentLoaded = true;
		}

		if (fileIter->externalSource != "") {
			fileIter->content = this->loadFileContentExternal(fileIter->externalSource);
			fileIter->contentLoaded = true;
			fileIter->externalSource = "";
		}

		if (fileIter->contentLoaded) {
			this->writeFile(*fileIter, themeDir + "/" + fileIter->localFileName);
		}

		if (fileIter->newLocalFileName != fileIter->localFileName) {
			std::string oldPath = themeDir + "/" + fileIter->localFileName;
			std::string newPath = themeDir + "/" + fileIter->newLocalFileName;

			if (this->fileExists(newPath)) {
				if (isDir(newPath)) {
					this->renameDirectory(themeDir, fileIter->newLocalFileName, fileIter->newLocalFileName + ".__old_dirname");
					oldPath = themeDir + "/" + fileIter->localFileName;
				} else {
					std::string tmpDummyPath = newPath + ".__old";
					this->getFile(fileIter->newLocalFileName).localFileName = tmpDummyPath;
					this->renameFile(newPath, tmpDummyPath);
				}
			}
			this->renameFile(oldPath, newPath);
			fileIter->localFileName = fileIter->newLocalFileName;
		}
		fileIter->isAddedByUser = false;
	}

	// delete removed files
	std::list<std::string> removedFiles;
	Model_Theme currentTheme(themeDir, "", ""); // also contains files which have been deleted in current theme
	for (std::list<Model_ThemeFile>::iterator themeFileIter = currentTheme.files.begin(); themeFileIter != currentTheme.files.end(); themeFileIter++) {
		try {
			this->getFile(themeFileIter->localFileName);
		} catch (ItemNotFoundException const& e) {
			this->deleteFile(themeDir, themeFileIter->localFileName);
		}
	}

	// delete empty directories
	this->deleteEmptyDirectories(themeDir);

	this->zipFile = "";
	this->directory = themeDir;
}

void Model_Theme::renameFile(std::string const& oldName, std::string const& newName) {
	std::string tmpName = oldName + ".__tmp"; // solves problems when oldName is part of a new directory name
	int successRenameToTmp = std::rename(oldName.c_str(), tmpName.c_str());
	if (successRenameToTmp != 0) {
		throw FileSaveException("rename failed: " + oldName + " -> " + tmpName, __FILE__, __LINE__);
	}
	this->createFilePath(newName);
	int success = std::rename(tmpName.c_str(), newName.c_str());
	if (success != 0) {
		throw FileSaveException("rename failed: " + tmpName + " -> " + newName, __FILE__, __LINE__);
	}
}

void Model_Theme::deleteFile(std::string const& themePath, std::string const& localFileName) {
	unlink((themePath + "/" + localFileName).c_str());
}

std::string Model_Theme::extractLocalPath(std::string fullPath) {
	return fullPath.substr(this->directory.size() + 1);
}
