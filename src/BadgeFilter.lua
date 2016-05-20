local CreateBadgeEntry = AetheriusBadgeFilter.CreateBadgeEntry

local BadgeFilter = ZO_Object:Subclass()
AetheriusBadgeFilter.BadgeFilter = BadgeFilter

function BadgeFilter:New(...)
    local obj = ZO_Object.New(self)
    obj:Initialize(...)
    return obj
end

function BadgeFilter:Initialize(guilds, saveData)
    self.guilds = guilds
    self.saveData = saveData
    self.filteredBadge = {}
end

function BadgeFilter:SetGuild(guildId)
    self.currentGuildId = guildId
    self.currentGuild = self.guilds[GetGuildName(guildId)]
    self.dirty = true
end

function BadgeFilter:HasBadges()
    return self.currentGuild ~= nil
end

local function SortByNameAsc(a, b)
    return a.name < b.name
end

function BadgeFilter:CollectBadges(forced)
    if(self.dirty or forced) then
        self:ClearAll()

        local badgeTable = {}
        local guildId = self.currentGuildId
        for i = 1, GetNumGuildMembers(guildId) do
            local _, note = GetGuildMemberInfo(guildId, i)
            local badges = self:ParseBadges(note)
            for j = 1, #badges do
                badgeTable[badges[j]] = true
            end
        end

        local currentData = self.currentGuild
        local badgeTypes = currentData.badges
        local collected = {}
        for badge in pairs(badgeTable) do
            local name = self:GetBadgeName(badge)
            local badgeData = badgeTypes[name] or CreateBadgeEntry(name)
            badgeData.badge = badge
            collected[#collected + 1] = badgeData
        end

        table.sort(collected, SortByNameAsc)
        currentData.collected = collected
        self.dirty = false
    end
end

function BadgeFilter:ParseBadges(note)
    local badges = {}
    for badge in note:gmatch("|c.......-|r") do
        badges[#badges + 1] = badge
    end
    return badges
end

function BadgeFilter:GetBadgeName(badge)
    return badge:gsub("|c......(.-)|r", "%1")
end

function BadgeFilter:GetListEntries()
    local saveData, currentData = self.saveData, self.currentGuild
    return saveData.showScannedBadges and currentData.collected or currentData.entries
end

function BadgeFilter:HasSelectedBadge(note)
    local badges = self:ParseBadges(note)
    for i = 1, #badges do
        local name = self:GetBadgeName(badges[i])
        if(self.filteredBadge[name]) then return true end
        local relations = self.currentGuild.relations
        if(relations[name]) then
            for _, relatedName in ipairs(relations[name]) do
                if(self.filteredBadge[relatedName]) then return true end
            end
        end
    end
    return false
end

function BadgeFilter:IsAnyBadgeSelected()
    if(not self.currentGuild) then return false end
    for badge, state in pairs(self.filteredBadge) do
        if(state) then
            return true
        end
    end
    return false
end

function BadgeFilter:ClearAll()
    local filteredBadge = self.filteredBadge
    for key in pairs(filteredBadge) do
        filteredBadge[key] = nil
    end
end

function BadgeFilter:SetBadge(name, state)
    self.filteredBadge[name] = state
end

function BadgeFilter:GetBadge(name)
    if(self.filteredBadge[name]) then
        return true
    end
    return false
end
