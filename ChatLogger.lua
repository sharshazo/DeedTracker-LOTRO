-- Chat log filter.
-- Controls chat messages and actions the appropriate functions based on the message.
chatComplete = GetString(_LANG.DEEDS.CHAT_COMPLETED);
taskIndicator = GetString(_LANG.DEEDS.TASK_INDICATOR);

function InitiateChatLogger()
    local character = MYCHAR:GetName();

    -- QUESTSYNC INTEGRATION: Use shared global hook
    if not _G.LQA_ChatHookWatcher then
        _G.LQA_ChatHookWatcher = Turbine.UI.Control()
        _G.LQA_ChatHookWatcher:SetWantsUpdates(true)
        _G.LQA_ChatHookWatcher.Update = function(sender, args)
        end

        _G.LQA_ChatListeners = _G.LQA_ChatListeners or {}
        
        if not _G.LQA_ChatHookInstalled then
            Turbine.Chat.Received = function(sender, args)
                for _, listener in pairs(_G.LQA_ChatListeners) do
                    pcall(listener, sender, args)
                end
            end
            _G.LQA_ChatHookInstalled = true
        end
    end

    _G.LQA_ChatListeners = _G.LQA_ChatListeners or {}
    _G.LQA_ChatListeners["DeedTracker"] = function(sender, args)
        local tempMessage = tostring(args.Message);

        if args.ChatType == Turbine.ChatType.Standard then
            local enterPattern = GetString(_LANG.ENTER_CHANNEL);
            local possibleEnterRegion = string.match(tempMessage, enterPattern);
            if (possibleEnterRegion ~= nil) then
                ChangeLocation(possibleEnterRegion);
            end

            local leavePattern = GetString(_LANG.LEAVE_CHANNEL);
            local possibleLeaveRegion = string.match(tempMessage, leavePattern);
            if (possibleLeaveRegion ~= nil) then
                local nonRegionIndex = _LANG.LEAVE_CHANNEL.LEAVE_REGION_INDEX;
                local nonRegionName = GetString(DataFiles._CHAT_REGIONS[nonRegionIndex].CHAT_REGION);
                ChangeLocation(nonRegionName);
            end
        end

        if args.ChatType == Turbine.ChatType.Quest then
            FilterQuest(character, tempMessage);
            PREVIOUS_QUEST_CHAT = tempMessage;
            DataFiles.CheckForDelayedText(tempMessage);
        end
    end
end

function ChangeLocation(newLocation)
    local oldLocationNum = LOCATION_NUMBER;
    local newLocationNum = DataFiles.GetChatRegionNumber(newLocation);
    if (oldLocationNum ~= newLocationNum) then
        LOCATION_NUMBER = newLocationNum;
        if (SETTINGS.VERBOSE_OUTPUT) then
            local instance = "";
            if (newLocationNum == _LANG.LEAVE_CHANNEL.LEAVE_REGION_INDEX) then
                local instanceName = _LANG.LEAVE_CHANNEL.LAST_KNOWN_INSTANCE_ENTERED_NAME;
                if (instanceName ~= "") then
                    instance = " (" .. instanceName .. ")";
                    Debug("Entering an instance, resetting delayed skirmish completion status.");
                    DELAYED_SKIRMISH_COMPLETION_CHAT = nil;
                end
            end
            Debug("Deed Tracker thinks you moved from " .. DataFiles.GetRegionName(oldLocationNum) .. " to " .. DataFiles.GetRegionName(newLocationNum) .. instance);
        end
    end
end

-- Filters here for use with the Quest channel.
function FilterQuest(character, cMessage)
    if (taskIndicator ~= nil and string.find(cMessage, taskIndicator)) then
        return;
    end

    if (string.find(cMessage, chatComplete)) then
        local deedName = string.gsub(cMessage, chatComplete, "");
        deedName = string.gsub(deedName,"\n","");
        deedName = string.gsub(deedName,"^%s*(.-)%s*$", "%1");
        IfDeedMarkComplete(character, deedName);
    end
    
    DataFiles.CheckForObjectiveText(character, cMessage);
    FindInstanceStartText(cMessage);
end

function FindInstanceStartText(cMessage)
    local enterPattern = "<u>([%a%p%u%l%s]*)</u>";   
    local possibleInstance = string.match(cMessage, enterPattern);
    if (possibleInstance == nil or possibleInstance == "") then return; end
    _LANG.LEAVE_CHANNEL.LAST_KNOWN_INSTANCE_ENTERED_NAME = possibleInstance;
end
