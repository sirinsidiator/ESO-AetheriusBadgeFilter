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

OnAddonLoaded(function()
    local guilds = AetheriusBadgeFilter.guilds
    local guildRosterManager = GUILD_ROSTER_MANAGER
    local guildRoster = GUILD_ROSTER_KEYBOARD
    local guildRosterScene = SCENE_MANAGER:GetScene("guildRoster")
    local window = AetheriusBadgeFilterList
    local listControl = window:GetNamedChild("Badges")
    local showAllBadges = false
    local currentData
    local filteredBadge = {}
    local r, g, b = ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB()

    local function DeselectAll()
        local scrollData = ZO_ScrollList_GetDataList(listControl)
        for _, entry in pairs(scrollData) do
            entry.data.selected = false
        end
        filteredBadge = {}
    end

    local function HandleFilterEntryClicked(entry, shift)
        local wasSelected = entry.selected
        if(not shift) then
            DeselectAll()
        end
        entry.selected = not wasSelected
        filteredBadge[entry.name] = entry.selected
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

        local alpha = entry.selected and 0.5 or 0
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

    local function RefreshBadgeList()
        local scrollData = ZO_ScrollList_GetDataList(listControl)
        ZO_ScrollList_Clear(listControl)

        local list = showAllBadges and currentData.collected or currentData.entries
        for _, entry in ipairs(list) do
            scrollData[#scrollData + 1] = ZO_ScrollList_CreateDataEntry(entry.type, ZO_ShallowTableCopy(entry))
        end

        ZO_ScrollList_Commit(listControl)
    end

    local function GetGuildIdByName(guildName)
        for i = 1, GetNumGuilds() do
            local guildId = GetGuildId(i)
            if(GetGuildName(guildId) == guildName) then
                return guildId
            end
        end
    end

    local function ParseBadges(note)
        local badges = {}
        for badge in note:gmatch("|c.......-|r") do
            badges[#badges + 1] = badge
        end
        return badges
    end

    local function GetBadgeName(badge)
        return badge:gsub("|c......(.-)|r", "%1")
    end

    local function HasSelectedBadge(note)
        local badges = ParseBadges(note)
        for i = 1, #badges do
            local name = GetBadgeName(badges[i])
            if(filteredBadge[name]) then return true end
            local relations = currentData.relations
            if(relations[name]) then
                for _, relatedName in ipairs(relations[name]) do
                    if(filteredBadge[relatedName]) then return true end
                end
            end
        end
        return false
    end

    local function HasFilteredBadges()
        for badge, state in pairs(filteredBadge) do
            if(state) then
                return true
            end
        end
        return false
    end

    local currentSearchTerm, hasActiveFilteredBadges
    local originalGetSearchTerm = guildRoster.searchBox.GetText
    guildRoster.searchBox.GetText = function(control)
        currentSearchTerm = originalGetSearchTerm(control)
        if(window:IsHidden()) then return currentSearchTerm end
        hasActiveFilteredBadges = HasFilteredBadges()
        return "\1" -- avoid the empty string check in FilterScrollList so IsMatch is called
    end

    local originalIsMatch = guildRosterManager.IsMatch
    guildRosterManager.IsMatch = function(self, searchTerm, data)
        if(not window:IsHidden() and hasActiveFilteredBadges and not HasSelectedBadge(data.note)) then
            return false
        end

        return originalIsMatch(self, currentSearchTerm, data)
    end

    local function SortByNameAsc(a, b)
        return a.name < b.name
    end

    local function CollectBadges(guildId)
        local badgeTable = {}
        for i = 1, GetNumGuildMembers(guildId) do
            local _, note = GetGuildMemberInfo(guildId, i)
            local badges = ParseBadges(note)
            for j = 1, #badges do
                badgeTable[badges[j]] = true
            end
        end

        local badgeTypes = currentData.badges
        local collected = {}
        for badge in pairs(badgeTable) do
            local name = GetBadgeName(badge)
            local badgeData = badgeTypes[name] or {
                name = name,
                type = BADGE_ENTRY,
            }
            badgeData.badge = badge
            collected[#collected + 1] = badgeData
        end

        table.sort(collected, SortByNameAsc)
        currentData.collected = collected
        RefreshBadgeList()
        guildRoster:RefreshFilters()
    end

    local function Update()
        if(guildRosterScene:IsShowing()) then
            filteredBadge = {}
            local guildName = guildRosterManager.guildName
            currentData = guilds[guildName]
            window:SetHidden(currentData == nil)
            if(not window:IsHidden()) then
                local guildId = GetGuildIdByName(guildName)
                if(guildId) then
                    CollectBadges(guildId)
                end
            end
        else
            window:SetHidden(true)
        end
    end

    SLASH_COMMANDS["/abf"] = function()
        showAllBadges = not showAllBadges
        Update()
    end

    guildRosterScene:RegisterCallback("StateChange", Update)
    ZO_PreHook(guildRosterManager, "OnGuildIdChanged", Update)
end)
