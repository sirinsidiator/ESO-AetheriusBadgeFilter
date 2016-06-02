local ADDON_NAME = "AetheriusBadgeFilter"
AetheriusBadgeFilter = {}

local nextEventHandleIndex = 1

local function RegisterForEvent(event, callback)
    local eventHandleName = ADDON_NAME .. nextEventHandleIndex
    EVENT_MANAGER:RegisterForEvent(eventHandleName, event, callback)
    nextEventHandleIndex = nextEventHandleIndex + 1
    return eventHandleName
end

local function UnregisterForEvent(event, name)
    EVENT_MANAGER:UnregisterForEvent(name, event)
end

local function WrapFunction(object, functionName, wrapper)
    if(type(object) == "string") then
        wrapper = functionName
        functionName = object
        object = _G
    end
    local originalFunction = object[functionName]
    object[functionName] = function(...) return wrapper(originalFunction, ...) end
end

local messages = {}
local function LogDebug(message, ...)
    if CHAT_SYSTEM.primaryContainer then
        df("[%s] " .. message, ADDON_NAME, ...)
    else
        messages[#messages + 1] = {message, ...}
    end
end

local function FlushMessages()
    for i = 1, #messages do
        LogDebug(messages[i])
    end
    messages = {}
end

local function OnAddonLoaded(callback)
    local eventHandle = ""
    eventHandle = RegisterForEvent(EVENT_ADD_ON_LOADED, function(event, name)
        if(name ~= ADDON_NAME) then return end
        FlushMessages()
        callback()
        UnregisterForEvent(event, name)
    end)
end

AetheriusBadgeFilter.SERVER_PTS = "PTS"
AetheriusBadgeFilter.SERVER_NA = "NA Megaserver"
AetheriusBadgeFilter.SERVER_EU = "EU Megaserver"

AetheriusBadgeFilter.guilds = {}
local currentServer = GetWorldName()
function AetheriusBadgeFilter:RegisterGuild(server, name, data)
    if(server ~= currentServer and currentServer ~= AetheriusBadgeFilter.SERVER_PTS) then return end
    local entries = {}
    local badges = {}
    local relations = {}
    data = data or {}
    for _, group in ipairs(data) do
        if(group.name) then
            entries[#entries + 1] = AetheriusBadgeFilter.CreateGroupEntry(group)
        end
        for _, badge in ipairs(group.badges) do
            badge = AetheriusBadgeFilter.CreateBadgeEntry(badge)
            entries[#entries + 1] = badge
            badges[badge.name] = badge
            relations[badge.name] = badge.relations or {}
        end
    end
    self.guilds[name] = {
        entries = entries,
        badges = badges,
        relations = relations,
    }
end

OnAddonLoaded(function()
    local defaultData = {
        version = 2,
        enabled = true,
        locked = true,
        showScannedBadges = false,
        showMemberCount = true,
        x = 680,
        y = 225,
        width = 300,
        height = 600,
    }

    AetheriusBadgeFilter_Data = AetheriusBadgeFilter_Data or {}
    local saveData = AetheriusBadgeFilter_Data[GetDisplayName()] or ZO_DeepTableCopy(defaultData)
    AetheriusBadgeFilter_Data[GetDisplayName()] = saveData
    AetheriusBadgeFilter.defaultData = defaultData

    if(saveData.version < 2) then
        saveData.showMemberCount = defaultData.showMemberCount
        saveData.version = 2
    end

    local filter = AetheriusBadgeFilter.BadgeFilter:New(AetheriusBadgeFilter.guilds, saveData)
    local window = AetheriusBadgeFilter.FilterWindow:New(AetheriusBadgeFilterWindow, saveData, defaultData, filter)

    local guildRoster = GUILD_ROSTER_KEYBOARD
    local guildRosterManager = GUILD_ROSTER_MANAGER
    local guildRosterScene = SCENE_MANAGER:GetScene("guildRoster")

    local currentSearchTerm, hasActiveFilteredBadges
    local originalGetSearchTerm = guildRoster.searchBox.GetText
    guildRoster.searchBox.GetText = function(control)
        currentSearchTerm = originalGetSearchTerm(control)
        if(not window:IsEnabled()) then return currentSearchTerm end
        hasActiveFilteredBadges = filter:IsAnyBadgeSelected()
        return "\1" -- avoid the empty string check in FilterScrollList so IsMatch is called
    end

    local originalIsMatch = guildRosterManager.IsMatch
    guildRosterManager.IsMatch = function(self, searchTerm, data)
        if(window:IsEnabled() and hasActiveFilteredBadges and not filter:HasSelectedBadge(data.note)) then
            return false
        end

        return originalIsMatch(self, currentSearchTerm, data)
    end

    SLASH_COMMANDS["/abf"] = function(command)
        if(command == "show") then
            window:Enable()
        elseif(command == "hide") then
            window:Disable()
        elseif(command == "mode") then
            saveData.showScannedBadges = not saveData.showScannedBadges
            window:Update()
        elseif(command == "reset") then
            window:ResetPosition()
        elseif(command == "lock") then
            window:Lock()
        elseif(command == "unlock") then
            window:Unlock()
        elseif(command == "refresh") then
            window:Update(true)
        elseif(command == "help") then
            d("[AetheriusBadgeFilter] Available /abf commands: show, hide, toggle, lock, unlock, mode, refresh, reset, help; default: toggle")
        else
            -- toggle
            if(window:IsEnabled()) then
                window:Disable()
            else
                window:Enable()
            end
        end
    end

    local function Update()
        filter:SetGuild(guildRosterManager.guildId)
        if(filter:SupportsBadges()) then
            window:AddToScene(guildRosterScene)
            window:Update()
        else
            window:RemoveFromScene(guildRosterScene)
        end
    end

    local function Check(_, guildId)
        filter:CheckGuildInfo(guildId, true)
    end

    guildRosterScene:RegisterCallback("StateChange", Update)
    ZO_PreHook(guildRosterManager, "OnGuildIdChanged", Update)
    RegisterForEvent(EVENT_GUILD_MOTD_CHANGED, Check)
    RegisterForEvent(EVENT_GUILD_DESCRIPTION_CHANGED, Check)
    RegisterForEvent(EVENT_GUILD_MEMBER_NOTE_CHANGED, function(_, guildId, displayName, note)
        if(filter:IsCurrentGuild(guildId) and window:IsShowing()) then
            local badges = filter:ParseBadges(note)
            if(#badges > 0) then
                filter.dirty = true
                if(not filter:IsAnyBadgeSelected()) then
                    window:Update()
                end
            end
        end
    end)
end)
