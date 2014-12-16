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

#ifndef TRASHCONTROLLERIMPL_H_
#define TRASHCONTROLLERIMPL_H_

#include "../Model/ListCfg.hpp"
#include "../View/Main.hpp"
#include <libintl.h>
#include <locale.h>
#include <sstream>
#include "../config.hpp"

#include "../Model/Env.hpp"

#include "../Model/MountTable.hpp"

#include "../View/Trash.hpp"

#include "../View/EnvEditor.hpp"
#include "../View/Trait/ViewAware.hpp"
#include "../Mapper/EntryName.hpp"

#include "Common/ControllerAbstract.hpp"

#include "../Model/DeviceDataListInterface.hpp"
#include "../lib/ContentParserFactory.hpp"
#include "Helper/DeviceInfo.hpp"

class TrashController :
	public Controller_Common_ControllerAbstract,
	public View_Trait_ViewAware<View_Trash>,
	public Model_ListCfg_Connection,
	public Mapper_EntryName_Connection,
	public Model_DeviceDataListInterface_Connection,
	public ContentParserFactory_Connection,
	public Model_Env_Connection,
	public Bootstrap_Application_Object_Connection
{
	private: std::list<Model_Rule> data;

	public:	TrashController() :
		Controller_Common_ControllerAbstract("trash")
	{
	}

	public:	void initViewEvents() override
	{
		using namespace std::placeholders;

		this->view->onRestore = std::bind(std::mem_fn(&TrashController::applyAction), this);
		this->view->onDeleteClick = std::bind(std::mem_fn(&TrashController::deleteCustomEntriesAction), this);
		this->view->onSelectionChange = std::bind(std::mem_fn(&TrashController::updateSelectionAction), this, _1);
	}

	public:	void initApplicationEvents() override
	{
		using namespace std::placeholders;

		this->applicationObject->onEnvChange.addHandler(std::bind(std::mem_fn(&TrashController::hideAction), this));
		this->applicationObject->onListModelChange.addHandler(std::bind(std::mem_fn(&TrashController::updateAction), this));
		this->applicationObject->onEntryRemove.addHandler(std::bind(std::mem_fn(&TrashController::selectEntriesAction), this, _1));
		this->applicationObject->onEntrySelection.addHandler(std::bind(std::mem_fn(&TrashController::selectEntriesAction), this, std::list<Entry*>()));
	}
	
	public:	void updateAction()
	{
		this->logActionBegin("update");
		try {
			this->view->setOptions(this->applicationObject->viewOptions);
			this->refresh();
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public:	void applyAction()
	{
		this->logActionBegin("apply");
		try {
			std::list<Rule*> entries = view->getSelectedEntries();
			this->applicationObject->onEntryInsertionRequest.exec(entries);
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public:	void hideAction()
	{
		this->logActionBegin("hide");
		try {
			this->view->hide();
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void deleteCustomEntriesAction()
	{
		this->logActionBegin("delete-custom-entries");
		try {
			std::list<Rule*> deletableEntries = this->view->getSelectedEntries();
			for (std::list<Rule*>::iterator iter = deletableEntries.begin(); iter != deletableEntries.end(); iter++) {
				assert(Model_Rule::fromPtr(*iter).dataSource != NULL);
				this->grublistCfg->deleteEntry(*Model_Rule::fromPtr(*iter).dataSource);
			}
			this->refresh();
			this->updateSelectionAction(std::list<Rule*>());
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void selectEntriesAction(std::list<Entry*> const& entries)
	{
		this->logActionBegin("select-entries");
		try {
			// first look for rules in local data, linking to the the given entries
			std::list<Rule*> rules;
			for (std::list<Entry*>::const_iterator entryIter = entries.begin(); entryIter != entries.end(); entryIter++) {
				for (std::list<Model_Rule>::iterator ruleIter = this->data.begin(); ruleIter != this->data.end(); ruleIter++) {
					if (*entryIter == ruleIter->dataSource) {
						rules.push_back(&*ruleIter);
					}
				}
			}
			this->view->selectEntries(rules);
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void updateSelectionAction(std::list<Rule*> const& selectedEntries)
	{
		this->logActionBegin("update-selection");
		try {
			if (selectedEntries.size()) {
				this->applicationObject->onTrashEntrySelection.exec();
				this->view->setRestoreButtonSensitivity(true);
				this->view->setDeleteButtonVisibility(this->ruleListIsDeletable(selectedEntries));
			} else {
				this->view->setRestoreButtonSensitivity(false);
				this->view->setDeleteButtonVisibility(false);
			}
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	private: void refresh()
	{
		assert(this->contentParserFactory != NULL);
		assert(this->deviceDataList != NULL);

		this->view->clear();

		this->data = this->grublistCfg->getRemovedEntries();

		this->refreshView(NULL);
	}

	private: void refreshView(Model_Rule* parent)
	{
		std::list<Model_Rule>& list = parent ? parent->subRules : this->data;
		for (std::list<Model_Rule>::iterator iter = list.begin(); iter != list.end(); iter++) {
			Model_Script* script = iter->dataSource ? this->grublistCfg->repository.getScriptByEntry(*iter->dataSource) : NULL;

			std::string name = iter->outputName;
			if (iter->dataSource && script) {
				name = this->entryNameMapper->map(iter->dataSource, name, iter->type != Model_Rule::SUBMENU);
			}

			View_Model_ListItem<Rule, Script> listItem;
			listItem.name = name;
			listItem.entryPtr = &*iter;
			listItem.scriptPtr = NULL;
			listItem.is_placeholder = iter->type == Model_Rule::OTHER_ENTRIES_PLACEHOLDER || iter->type == Model_Rule::PLAINTEXT;
			listItem.is_submenu = iter->type == Model_Rule::SUBMENU;
			listItem.scriptName = script ? script->name : "";
			listItem.isVisible = true;
			listItem.parentEntry = parent;

			if (iter->dataSource) {
				listItem.options = Controller_Helper_DeviceInfo::fetch(
					iter->dataSource->content,
					*this->contentParserFactory,
					*this->deviceDataList
				);
			}

			this->view->addItem(listItem);

			if (iter->subRules.size()) {
				this->refreshView(&*iter);
			}
		}
	}

	private: bool ruleListIsDeletable(std::list<Rule*> const& selectedEntries)
	{
		if (selectedEntries.size() == 0) {
			return false;
		}

		for (auto& entry : selectedEntries) {
			if (Model_Rule::fromPtr(entry).type != Model_Rule::NORMAL || Model_Rule::fromPtr(entry).dataSource == NULL) {
				return false;
			}
			Model_Script* script = this->grublistCfg->repository.getScriptByEntry(*Model_Rule::fromPtr(entry).dataSource);
			assert(script != NULL);
			if (!script->isCustomScript) {
				return false;
			}
		}

		return true;
	}
};

#endif