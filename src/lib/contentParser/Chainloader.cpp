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
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Chainloader.h"

const char* ContentParserChainloader::_regex = "\
[ \t]*set[ \t]+root='\\(hd([0-9]+)[^0-9]+([0-9]+)\\)'\\n\
[ \t]*search[ \t]+--no-floppy[ \t]+--fs-uuid[ \t]+--set(?:=root)?[ \t]+([-0-9a-fA-F]+)\\n\
[ \t]*drivemap[ \t]+-s[ \t]+\\(hd([0-9]+)\\)[ \t]+\\$\\{root\\}\n\
[ \t]*chainloader[ \t]+\\+1\\n?[ \t]*\
";

ContentParserChainloader::ContentParserChainloader(GrubDeviceMap& deviceMap)
	: deviceMap(deviceMap)
{}

void ContentParserChainloader::parse(std::string const& sourceCode) {
	this->sourceCode = sourceCode;
	try {
		std::vector<std::string> result = Regex::match(ContentParserChainloader::_regex, this->sourceCode);

		//check partition indices by uuid
		GrubPartitionIndex pIndex = deviceMap.getHarddriveIndexByPartitionUuid(result[3]);
		if (pIndex.hddNum != result[1] || pIndex.partNum != result[2] || pIndex.hddNum != result[4]){
			throw ContentParser::PARSING_FAILED;
		}

		this->options["partition_uuid"] = result[3];
	} catch (Regex::Exception e) {
		throw ContentParser::PARSING_FAILED;
	}
}

std::string ContentParserChainloader::buildSource() const {
	GrubPartitionIndex pIndex = deviceMap.getHarddriveIndexByPartitionUuid(this->options.at("partition_uuid"));
	std::map<int, std::string> newValues;
	newValues[1] = pIndex.hddNum;
	newValues[2] = pIndex.partNum;
	newValues[3] = this->options.at("partition_uuid");
	newValues[4] = pIndex.hddNum;

	std::string newSourceCode = Regex::replace(ContentParserChainloader::_regex, this->sourceCode, newValues);

	//check the new string. If they aren't matchable anymore (evil input), do a rollback
	try {
		Regex::match(ContentParserChainloader::_regex, newSourceCode);
		return newSourceCode;
	} catch (Regex::Exception e) {
		this->log("Ignoring data - doesn't match", Logger::ERROR);
		return this->sourceCode;
	}
}