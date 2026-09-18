-- Minimal LibDBIcon-1.0 implementation for WoW 3.3.5a, sufficient for SinStats.
local MAJOR, MINOR = "LibDBIcon-1.0", 33501
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end
local ldb = LibStub("LibDataBroker-1.1")
lib.objects = lib.objects or {}

local function UpdatePosition(button)
    local db = button.db or {}
    local angle = math.rad(db.minimapPos or 220)
    local radius = 80
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

local function OnDragStart(self)
    self:SetScript("OnUpdate", function(button)
        local mx, my = Minimap:GetCenter()
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        x, y = x / scale, y / scale
        local atan2 = math.atan2 or _G.atan2
        if not atan2 then return end
        local angle = math.deg(atan2(y - my, x - mx))
        button.db.minimapPos = angle
        UpdatePosition(button)
    end)
end

local function OnDragStop(self)
    self:SetScript("OnUpdate", nil)
end

function lib:Register(name, dataObject, db)
    if self.objects[name] then return end
    local button = CreateFrame("Button", "LibDBIcon10_" .. name, Minimap)
    button:SetWidth(31); button:SetHeight(31)
    button:SetFrameStrata("MEDIUM")
    button:SetMovable(true)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:RegisterForDrag("LeftButton")
    button.db = db or {}
    button.dataObject = dataObject

    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetWidth(20); icon:SetHeight(20)
    icon:SetPoint("CENTER", button, "CENTER", 0, 0)
    icon:SetTexture(dataObject.icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    button.icon = icon

    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetWidth(53); border:SetHeight(53)
    border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    button:SetScript("OnDragStart", OnDragStart)
    button:SetScript("OnDragStop", OnDragStop)
    button:SetScript("OnClick", function(self, mouseButton)
        if self.dataObject and self.dataObject.OnClick then self.dataObject.OnClick(self, mouseButton) end
    end)
    button:SetScript("OnEnter", function(self)
        if self.dataObject and self.dataObject.OnTooltipShow then
            GameTooltip:SetOwner(self, "ANCHOR_LEFT")
            self.dataObject.OnTooltipShow(GameTooltip)
            GameTooltip:Show()
        elseif self.dataObject and self.dataObject.OnEnter then
            self.dataObject.OnEnter(self)
        end
    end)
    button:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
        if self.dataObject and self.dataObject.OnLeave then self.dataObject.OnLeave(self) end
    end)

    UpdatePosition(button)
    self.objects[name] = button
    if button.db.hide then button:Hide() else button:Show() end
end

function lib:Show(name)
    local b = self.objects[name]; if b then b.db.hide = false; b:Show() end
end
function lib:Hide(name)
    local b = self.objects[name]; if b then b.db.hide = true; b:Hide() end
end
function lib:IsRegistered(name) return self.objects[name] ~= nil end
function lib:GetMinimapButton(name) return self.objects[name] end
function lib:IsButtonCompartmentAvailable() return false end
function lib:AddButtonToCompartment(name) end
function lib:RemoveButtonFromCompartment(name) end
