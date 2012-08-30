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

#ifndef DEVICE_DATALIST_INCLUDED
#define DEVICE_DATALIST_INCLUDED
#include <map>
#include <cstdio>
#include <string>
#include "../Model/DeviceDataListInterface.h"
#include "../lib/CommonClass.h"

class Model_DeviceDataList : public Model_DeviceDataListInterface, public CommonClass {
public:
	Model_DeviceDataList(FILE* blkidOutput);
	Model_DeviceDataList();
	void loadData(FILE* blkidOutput);
	void clear();
};
#endif
