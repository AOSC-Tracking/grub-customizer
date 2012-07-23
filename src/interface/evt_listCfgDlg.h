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

#ifndef EVENTLISTENER_LISTCFGDLG_INCLUDED
#define EVENTLISTENER_LISTCFGDLG_INCLUDED

#include <list>
/**
 * base class to be implemented by grublistconfig event listeners
 */
class EventListener_listCfgDlg {
public:
	//user wants to show the settings dialog
	virtual void settings_dialog_request()=0;
	//user wants to reload the whole configuration
	virtual void reload_request()=0;
	//user wants to save all his changes
	virtual void save_request()=0;
	//user wants to show the partition chooser
	virtual void rootSelector_request()=0;
	//user wants to show the grub install dialog
	virtual void installDialogRequest()=0;
	//user wants to create a new submenu
	virtual void createSubmenuRequest(std::list<void*> childItems)=0;
	//user wants to remove a submenu
	virtual void removeSubmenuRequest(std::list<void*> childItems)=0;
	//user wants to show the dialog which lets him add new entries
	virtual void entryAddDlg_requested()=0;
	//user wants to edit an entry
	virtual void entryEditDlg_requested(void* rule)=0;
	//user wants to show the about dialog
	virtual void aboutDialog_requested()=0;
	//user wants to quit -> application asks if it should be closed (return values: true = close, false = stay opened)
	virtual void exitRequest()=0;

	//user has activated or disabled one of the entries
	virtual void signal_entry_remove_requested(std::list<void*> entries)=0;
	//user has renamed one of the entries
	virtual void signal_entry_renamed(void* entry, std::string const& newText)=0;

	//user wants to swap two rules
	virtual void ruleAdjustment_requested(std::list<void*> rules, int direction)=0;

	//user has selected another rule
	virtual void ruleSelected(void* rule)=0;

	//user has used the close button of the burg switcher window
	virtual void burgSwitcher_cancelled()=0;

	//user has chosen burg or grub from the burgSwitcher
	virtual void burgSwitcher_response(bool burgChosen)=0;
};

#endif
