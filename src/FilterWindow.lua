local FilterWindow = ZO_Object:Subclass()
AetheriusBadgeFilter.FilterWindow = FilterWindow

local BUTTON_NORMAL_TEXTURE = "EsoUI/Art/TreeIcons/store_indexicon_trophy_up.dds"
local BUTTON_PRESSED_TEXTURE = "EsoUI/Art/TreeIcons/store_indexicon_trophy_down.dds"
local r, g, b = ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB()

function FilterWindow:New(...)
    local obj = ZO_Object.New(self)
    obj:Initialize(...)
    return obj
end

function FilterWindow:Initialize(window, saveData, defaultData)
    self.window = window
    self.saveData = saveData
    self.defaultData = defaultData

    local control = window:GetNamedChild("Filter")
    self.listControl = control:GetNamedChild("List")
    self.fragment = ZO_SimpleSceneFragment:New(window)
    self.control = control

    local resizing = false
    control:SetMovable(not saveData.locked)
    control:SetResizeHandleSize(not saveData.locked and 5 or 0)
    control:SetHandler("OnMoveStop", function() self:SavePosition() end)
    control:SetHandler("OnResizeStart", function() resizing = true end)
    control:SetHandler("OnUpdate", function() if(resizing) then self:HandleResize() end end)
    control:SetHandler("OnResizeStop", function() self:HandleResize() self:SavePosition() resizing = false end)

    self:InitializeButtons()
    self:LoadPosition()
end

function FilterWindow:AddToScene(scene)
    scene:AddFragment(self.fragment)
end

function FilterWindow:RemoveFromScene(scene)
    scene:RemoveFragment(self.fragment)
end

function FilterWindow:IsHidden()
    return self.control:IsHidden()
end

function FilterWindow:SavePosition()
    local control, saveData = self.control, self.saveData
    saveData.x, saveData.y = control:GetScreenRect()
    saveData.width, saveData.height = control:GetDimensions()
end

function FilterWindow:HandleResize()
    ZO_ScrollList_Commit(self.listControl)
end

function FilterWindow:LoadPosition()
    local control, saveData = self.control, self.saveData
    control:ClearAnchors()
    control:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, saveData.x, saveData.y)
    control:SetDimensions(saveData.width, saveData.height)
    self:HandleResize()
end

function FilterWindow:ResetPosition()
    local saveData, defaultData = self.saveData, self.defaultData
    saveData.x, saveData.y = defaultData.x, defaultData.y
    saveData.width, saveData.height = defaultData.width, defaultData.height
    self:LoadPosition()
end

function FilterWindow:IsLocked()
    return self.saveData.locked
end

function FilterWindow:Lock()
    self.saveData.locked = true
    self.control:SetMovable(false)
    self.control:SetResizeHandleSize(0)
end

function FilterWindow:Unlock()
    self.saveData.locked = false
    self.control:SetMovable(true)
    self.control:SetResizeHandleSize(5)
end

function FilterWindow:IsEnabled()
    return self.saveData.enabled
end

function FilterWindow:Enable()
    self.saveData.enabled = true
    self.control:SetHidden(false)
    self.toggleWindowButton:SetNormalTexture(BUTTON_PRESSED_TEXTURE)
    self.toggleWindowButton:SetPressedTexture(BUTTON_NORMAL_TEXTURE)
    AetheriusBadgeFilter.Update()
end

function FilterWindow:Disable()
    self.saveData.enabled = false
    self.control:SetHidden(true)
    self.toggleWindowButton:SetNormalTexture(BUTTON_NORMAL_TEXTURE)
    self.toggleWindowButton:SetPressedTexture(BUTTON_PRESSED_TEXTURE)
    AetheriusBadgeFilter.RefreshFilter()
end

function FilterWindow:InitializeButtons()
    local saveData = self.saveData

    local optionsButton = self.control:GetNamedChild("Options")
    optionsButton:SetHandler("OnClicked", function(control)
        local Update = AetheriusBadgeFilter.Update
        ClearMenu()

        AddCustomMenuItem("Refresh Badges", Update)

        if(saveData.showScannedBadges) then
            AddCustomMenuItem("Show Defined Badges", function()
                saveData.showScannedBadges = false
                Update()
            end)
        else
            AddCustomMenuItem("Show Scanned Badges", function()
                saveData.showScannedBadges = true
                Update()
            end)
        end

        if(self:IsLocked()) then
            AddCustomMenuItem("Unlock Window", function() self:Unlock() end)
        else
            AddCustomMenuItem("Lock Window", function() self:Lock() end)
            AddCustomMenuItem("Reset Window", function() self:ResetPosition() end)
        end

        AddCustomMenuItem("Hide Window", function()
            self:Disable()
        end)

        ShowMenu(optionsButton)
    end)
    self.optionsButton = optionsButton

    local toggleWindowButton = self.window:GetNamedChild("Button")
    toggleWindowButton:SetHandler("OnClicked", function(control)
        if(self:IsEnabled()) then
            self:Disable()
        else
            self:Enable()
        end
    end)
    toggleWindowButton:SetHandler("OnMouseEnter", function(control)
        InitializeTooltip(InformationTooltip)
        InformationTooltip:ClearAnchors()
        InformationTooltip:SetOwner(control, BOTTOM, 0, 0)
        InformationTooltip:AddLine("Toggle Aetherius Badge Filter Window", "", r, g, b)
    end)
    toggleWindowButton:SetHandler("OnMouseExit", function(control)
        ClearTooltip(InformationTooltip)
    end)
    self.toggleWindowButton = toggleWindowButton

    -- properly initialize the button state
    if(self:IsEnabled()) then
        self:Enable()
    else
        self:Disable()
    end
end
