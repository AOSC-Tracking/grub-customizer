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

#ifndef MODEL_THEME_H_
#define MODEL_THEME_H_
#include <list>
#include "ThemeFile.h"
#include <cstdio>
#include <sys/stat.h>
#include <dirent.h>
#include <fstream>
#include "../lib/Exception.h"

struct Model_Theme {
	std::string directory;
	std::list<Model_ThemeFile> files;
	std::string name;

	Model_Theme(std::string const& directory, std::string const& name);
	void load(std::string const& directory);
	std::string loadFileContent(std::string localFileName);
	std::string getFullFileName(std::string localFileName);
private:
	std::string extractLocalPath(std::string fullPath);
};


#endif /* MODEL_THEME_H_ */
