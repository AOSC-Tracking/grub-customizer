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

#ifndef ENTRYEDITDLGGTK_H_
#define ENTRYEDITDLGGTK_H_
#include "../interface/entryEditDlg.h"
#include "../presenter/commonClass.h"
#include "../lib/str_replace.h"
#include <libintl.h>
#include <gtkmm.h>
#include "../interface/evt_entryEditDlg.h"

class EntryEditDlgGtk : public EntryEditDlg, public Gtk::Dialog, public CommonClass {
	Gtk::Notebook tabbox;
	Gtk::TextView tvSource;
	Gtk::ScrolledWindow scrSource;
	EventListener_entryEditDlg* eventListener;

	void* rulePtr;
public:
	EntryEditDlgGtk();
	void setEventListener(EventListener_entryEditDlg& eventListener);
	void setSourcecode(std::string const& source);
	std::string getSourcecode();
	void setRulePtr(void* rulePtr);
	void* getRulePtr();
	void show();
	void hide();
	void signal_response_action(int response_id);
};

#endif /* ENTRYEDITDLGGTK_H_ */