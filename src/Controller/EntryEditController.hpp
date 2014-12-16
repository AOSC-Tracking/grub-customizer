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

#ifndef ENTRY_EDIT_CONTROLLER_INCLUDED
#define ENTRY_EDIT_CONTROLLER_INCLUDED

#include "../View/Main.hpp"
#include <libintl.h>
#include <locale.h>
#include <sstream>
#include "../config.hpp"

#include "../Model/Env.hpp"

#include "../View/EntryEditor.hpp"
#include "../View/Trait/ViewAware.hpp"

#include "../Model/ListCfg.hpp"
#include "../lib/Trait/LoggerAware.hpp"
#include "Common/ControllerAbstract.hpp"
#include "../lib/ContentParserFactory.hpp"
#include "../lib/Exception.hpp"
#include "../Model/DeviceDataList.hpp"
#include "../Model/Installer.hpp"
#include "../Model/ListCfg.hpp"
#include "Helper/Thread.hpp"


class EntryEditController :
	public Controller_Common_ControllerAbstract,
	public View_Trait_ViewAware<View_EntryEditor>,
	public Model_ListCfg_Connection,
	public ContentParserFactory_Connection,
	public Model_DeviceDataListInterface_Connection,
	public Model_Env_Connection,
	public Controller_Helper_Thread_Connection,
	public Bootstrap_Application_Object_Connection
{
	private: std::shared_ptr<ContentParser> currentContentParser;

	public: EntryEditController() :
		Controller_Common_ControllerAbstract("entry-edit"),
		currentContentParser(NULL)
	{
	}

	public: void initViewEvents() override
	{
		using namespace std::placeholders;
		this->view->onApplyClick = std::bind(std::mem_fn(&EntryEditController::applyAction), this);
		this->view->onSourceModification = std::bind(std::mem_fn(&EntryEditController::syncOptionsAction), this);
		this->view->onOptionModification = std::bind(std::mem_fn(&EntryEditController::syncSourceAction), this);
		this->view->onTypeSwitch = std::bind(std::mem_fn(&EntryEditController::switchTypeAction), this, _1);
	}

	public: void initApplicationEvents() override
	{
		using namespace std::placeholders;
		this->applicationObject->onEntryEditorShowRequest.addHandler(std::bind(std::mem_fn(&EntryEditController::showAction), this, _1));
	}

	public: void showAction(Rule* rule)
	{
		if (rule == nullptr) {
			this->showCreatorAction();
			return;
		}

		this->logActionBegin("show");
		try {
			this->view->setRulePtr(rule);
			this->view->setSourcecode(Model_Rule::fromPtr(rule).dataSource->content);
			this->syncEntryEditDlg(false);
			this->view->show();
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void showCreatorAction()
	{
		this->logActionBegin("show-creator");
		try {
			this->view->setRulePtr(NULL);
			this->view->setSourcecode("");
			this->view->selectType("");
			this->view->setOptions(std::map<std::string, std::string>());
			this->view->show();
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void syncOptionsAction()
	{
		this->logActionBegin("sync-options");
		try {
			this->syncEntryEditDlg(false);
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void syncSourceAction()
	{
		this->logActionBegin("sync-source");
		try {
			this->syncEntryEditDlg(true);
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	public: void syncEntryEditDlg(bool useOptionsAsSource)
	{
		try {
			if (useOptionsAsSource) {
				assert(this->currentContentParser != NULL);
				this->currentContentParser->setOptions(this->view->getOptions());
				this->view->setSourcecode(this->currentContentParser->buildSource());
			} else {
				this->currentContentParser = this->contentParserFactory->create(this->view->getSourcecode());
				this->view->setOptions(this->currentContentParser->getOptions());
			}
			this->view->selectType(this->contentParserFactory->getNameByInstance(*this->currentContentParser));
		} catch (ParserNotFoundException const& e) {
			this->view->selectType("");
			this->view->setOptions(std::map<std::string, std::string>());
		}
	}

	public: void switchTypeAction(std::string const& newType)
	{
		this->logActionBegin("switch-type");
		try {
			std::string partition;
			if (this->deviceDataList->size()) {
				partition = this->deviceDataList->begin()->second["UUID"];
			}
	
			if ((this->currentContentParser || partition != "") && newType != "") {
				if (this->currentContentParser) {
					partition = this->currentContentParser->getOption("partition_uuid");
				}
				this->currentContentParser = this->contentParserFactory->createByName(newType);
				this->currentContentParser->buildDefaultEntry(partition);
	
				// sync
				this->view->setSourcecode(this->currentContentParser->buildSource());
				this->view->setOptions(this->currentContentParser->getOptions());
			} else {
				this->view->setOptions(std::map<std::string, std::string>());
				this->view->setSourcecode("");
			}
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	
	public: void applyAction()
	{
		this->logActionBegin("apply");
		try {
			Model_Rule* rulePtr = NULL;
			if (this->view->getRulePtr() != NULL) {
				rulePtr = &Model_Rule::fromPtr(this->view->getRulePtr());
			}
			bool isAdded = false;
			if (rulePtr == NULL) { // insert
				Model_Script* script = this->grublistCfg->repository.getCustomScript();
				if (script == NULL) {
					script = this->createCustomScript();
				}
				assert(script != NULL);
				script->entries().push_back(Model_Entry("new", "", ""));
	
				Model_Rule newRule(script->entries().back(), true, *script);
	
				std::list<Model_Proxy*> proxies = this->grublistCfg->proxies.getProxiesByScript(*script);
				if (proxies.size() == 0) {
					this->grublistCfg->proxies.push_back(Model_Proxy(*script, false));
					proxies = this->grublistCfg->proxies.getProxiesByScript(*script);
				}
				assert(proxies.size() != 0);
	
				for (std::list<Model_Proxy*>::iterator proxyIter = proxies.begin(); proxyIter != proxies.end(); proxyIter++) {
					(*proxyIter)->rules.push_back(newRule);
					newRule.isVisible = false; // if there are more rules of this type, add them invisible
				}
				rulePtr = &proxies.front()->rules.back();
				isAdded = true;
			} else { // update
				Model_Script* script = this->grublistCfg->repository.getScriptByEntry(*rulePtr->dataSource);
				assert(script != NULL);
	
				if (!script->isCustomScript) {
					script = this->grublistCfg->repository.getCustomScript();
					if (script == NULL) {
						script = this->createCustomScript();
					}
					assert(script != NULL);
					script->entries().push_back(*rulePtr->dataSource);
	
					Model_Rule ruleCopy = *rulePtr;
					rulePtr->setVisibility(false);
					ruleCopy.dataSource = &script->entries().back();
					Model_Proxy* proxy = this->grublistCfg->proxies.getProxyByRule(rulePtr);
					std::list<Model_Rule>& ruleList = proxy->getRuleList(proxy->getParentRule(rulePtr));
	
					Model_Rule dummySubmenu(Model_Rule::SUBMENU, std::list<std::string>(), "DUMMY", true);
					dummySubmenu.subRules.push_back(ruleCopy);
					std::list<Model_Rule>::iterator iter = ruleList.insert(proxy->getListIterator(*rulePtr, ruleList), dummySubmenu);
	
					Model_Rule& insertedRule = iter->subRules.back();
					rulePtr = &this->grublistCfg->moveRule(&insertedRule, -1);
					this->grublistCfg->renumerate();
	
					std::list<Model_Proxy*> proxies = this->grublistCfg->proxies.getProxiesByScript(*script);
					for (std::list<Model_Proxy*>::iterator proxyIter = proxies.begin(); proxyIter != proxies.end(); proxyIter++) {
						if (!(*proxyIter)->getRuleByEntry(*rulePtr->dataSource, (*proxyIter)->rules, rulePtr->type)) {
							(*proxyIter)->rules.push_back(Model_Rule(*rulePtr->dataSource, false, *script));
						}
					}
				}
			}
	
			std::string newCode = this->view->getSourcecode();
			rulePtr->dataSource->content = newCode;
			rulePtr->dataSource->isModified = true;
	
			this->env->modificationsUnsaved = true;
			this->applicationObject->onListModelChange.exec();
	
			if (isAdded) {
				this->threadHelper->runDelayed(
					[this, rulePtr] () {
						this->applicationObject->onListRuleChange.exec(rulePtr, true);
					},
					10
				);
			} else {
				this->applicationObject->onListRuleChange.exec(rulePtr, isAdded);
			}
	
	
			this->currentContentParser = NULL;
		} catch (Exception const& e) {
			this->applicationObject->onError.exec(e);
		}
		this->logActionEnd();
	}

	private: Model_Script* createCustomScript() {
		this->grublistCfg->repository.push_back(Model_Script("custom", ""));
		Model_Script& script = this->grublistCfg->repository.back();
		script.isCustomScript = true;
		return &script;
	}
};

#endif