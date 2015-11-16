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

#ifndef GLIB_HPP_
#define GLIB_HPP_
#include "Abstract.hpp"
#include <glibmm/dispatcher.h>

class Dispatcher_Glib : public Dispatcher_Abstract
{
	private: Glib::Dispatcher dispatcher;

	public: Dispatcher_Glib()
	{
		this->dispatcher.connect([this] {this->callback();});
	}

	public: void notify() override
	{
		this->dispatcher.emit();
	}
};



#endif /* GLIB_HPP_ */
