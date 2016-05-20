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

local GROUP_ENTRY = 1
local BADGE_ENTRY = 2

AetheriusBadgeFilter.guilds = {}
function AetheriusBadgeFilter:RegisterGuild(name, data)
    local entries = {}
    local badges = {}
    local relations = {}
    for _, group in ipairs(data) do
        if(group.name) then
            group.type = GROUP_ENTRY
            entries[#entries + 1] = group
        end
        for _, badge in ipairs(group.badges) do
            badge.type = BADGE_ENTRY
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

function AetheriusBadgeFilter.CreateBadgeEntry(name)
    return  {
        name = name,
        type = BADGE_ENTRY,
    }
end

OnAddonLoaded(function()
    local guilds = AetheriusBadgeFilter.guilds
    local guildRosterManager = GUILD_ROSTER_MANAGER
    local guildRoster = GUILD_ROSTER_KEYBOARD
    local guildRosterScene = SCENE_MANAGER:GetScene("guildRoster")
    local listControl = AetheriusBadgeFilterWindowFilterList
    local r, g, b = ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB()

    local defaultData = {
        version = 1,
        enabled = true,
        locked = true,
        showScannedBadges = false,
        x = 680,
        y = 225,
        width = 300,
        height = 600,
    }

    AetheriusBadgeFilter_Data = AetheriusBadgeFilter_Data or {}
    local saveData = AetheriusBadgeFilter_Data[GetDisplayName()] or ZO_DeepTableCopy(defaultData)
    AetheriusBadgeFilter_Data[GetDisplayName()] = saveData
    AetheriusBadgeFilter.defaultData = defaultData

    AetheriusBadgeFilter.RefreshFilter = function(clearSelection)
        guildRoster:RefreshFilters()
    end
    AetheriusBadgeFilter.Update = function() end

    local filter = AetheriusBadgeFilter.BadgeFilter:New(AetheriusBadgeFilter.guilds, saveData)
    local window = AetheriusBadgeFilter.FilterWindow:New(AetheriusBadgeFilterWindow, saveData, defaultData)

    local function Update()
        if(guildRosterScene:IsShowing() and filter:HasBadges() and window:IsEnabled()) then
            filter:CollectBadges()

            local scrollData = ZO_ScrollList_GetDataList(listControl)
            ZO_ScrollList_Clear(listControl)

            local list = filter:GetListEntries()
            for _, entry in ipairs(list) do
                scrollData[#scrollData + 1] = ZO_ScrollList_CreateDataEntry(entry.type, ZO_ShallowTableCopy(entry))
            end

            ZO_ScrollList_Commit(listControl)
            guildRoster:RefreshFilters()
        end
    end
    AetheriusBadgeFilter.Update = Update

    local function HandleFilterEntryClicked(entry, shift)
        if(not shift) then
            filter:ClearAll()
        end
        local selected = filter:GetBadge(entry.name)
        filter:SetBadge(entry.name, not selected)
        PlaySound("Click")
        guildRoster:RefreshFilters()
        ZO_ScrollList_RefreshVisible(listControl)
    end

    local function ShowTooltip(rowControl, name, description)
        InitializeTooltip(InformationTooltip)
        InformationTooltip:ClearAnchors()
        InformationTooltip:SetOwner(rowControl, RIGHT, -5, 0)
        InformationTooltip:AddLine(name, "ZoFontGameBold", r, g, b)
        if(description) then
            InformationTooltip:AddLine(description, "", r, g, b)
        end
    end

    local function InitializeGroupRow(rowControl, entry)
        local nameControl = rowControl:GetNamedChild("Name")
        nameControl:SetText(entry.name)

        local function FadeIn()
            ShowTooltip(rowControl, entry.name, entry.description)
        end

        local function FadeOut()
            ClearTooltip(InformationTooltip)
        end

        rowControl:SetHandler("OnMouseEnter", FadeIn)
        rowControl:SetHandler("OnMouseExit", FadeOut)
    end

    local function DestroyGroupRow(rowControl)
        ZO_ObjectPool_DefaultResetControl(rowControl)
    end

    local function InitializeBadgeRow(rowControl, entry)
        local nameControl = rowControl:GetNamedChild("Name")
        local name = entry.badge or entry.name
        nameControl:SetText(name)

        local highlight = rowControl:GetNamedChild("Highlight")
        if not highlight.animation then
            highlight.animation = ANIMATION_MANAGER:CreateTimelineFromVirtual("ShowOnMouseOverLabelAnimation", highlight)
        end

        local alpha = filter:GetBadge(entry.name) and 0.5 or 0
        highlight:SetAlpha(alpha)
        highlight.animation:GetFirstAnimation():SetAlphaValues(alpha, 1)

        local function FadeIn()
            highlight.animation:PlayForward()
            ShowTooltip(rowControl, entry.name, entry.description)
        end

        local function FadeOut()
            highlight.animation:PlayBackward()
            ClearTooltip(InformationTooltip)
        end

        rowControl:SetHandler("OnMouseEnter", FadeIn)
        rowControl:SetHandler("OnMouseExit", FadeOut)

        rowControl:SetHandler("OnMouseUp", function(control, button, isInside, ctrl, alt, shift, command)
            if(button == 1 and isInside) then
                HandleFilterEntryClicked(entry, shift)
            end
        end)
    end

    local function DestroyBadgeRow(rowControl)
        local highlight = rowControl:GetNamedChild("Highlight")
        highlight.animation:PlayFromEnd(highlight.animation:GetDuration())
        ZO_ObjectPool_DefaultResetControl(rowControl)
    end

    ZO_ScrollList_Initialize(listControl)
    ZO_ScrollList_AddDataType(listControl, GROUP_ENTRY, "AetheriusBadgeFilterGroupTemplate", 30, InitializeGroupRow, nil, nil, DestroyGroupRow)
    ZO_ScrollList_AddDataType(listControl, BADGE_ENTRY, "AetheriusBadgeFilterBadgeTemplate", 24, InitializeBadgeRow, nil, nil, DestroyBadgeRow)
    ZO_ScrollList_AddResizeOnScreenResize(listControl)

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

    SLASH_COMMANDS["/abf"] = function()
        saveData.showScannedBadges = not saveData.showScannedBadges
        Update()
    end

    guildRosterScene:RegisterCallback("StateChange", Update)
    ZO_PreHook(guildRosterManager, "OnGuildIdChanged", function(self)
        filter:SetGuild(self.guildId)
        if(filter:HasBadges()) then
            window:AddToScene(guildRosterScene)
            Update()
        else
            window:RemoveFromScene(guildRosterScene)
        end
    end)
end)
