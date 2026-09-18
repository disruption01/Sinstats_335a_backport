-- SinStats 3.3.5a compatibility layer (build 12340)
local AddName, Ns = ...

Ns.Is335 = true

-- WoW normally exposes the bit library in this era. Keep a tiny fallback for
-- private 3.3.5a clients that omit it, as SinStats only needs bit.band.
if not bit then bit = {} end
if not bit.band then
    function bit.band(a, b)
        a, b = tonumber(a) or 0, tonumber(b) or 0
        local result, place = 0, 1
        while a > 0 and b > 0 do
            local aa, bb = a % 2, b % 2
            if aa == 1 and bb == 1 then result = result + place end
            a = math.floor(a / 2)
            b = math.floor(b / 2)
            place = place * 2
        end
        return result
    end
end

-- Core helpers added in later clients.
if not Mixin then
    function Mixin(object, ...)
        for i = 1, select('#', ...) do
            local mixin = select(i, ...)
            if mixin then
                for k, v in pairs(mixin) do object[k] = v end
            end
        end
        return object
    end
end

if not table.wipe then
    table.wipe = wipe or function(t)
        for k in pairs(t) do t[k] = nil end
        return t
    end
end

if not CreateColor then
    function CreateColor(r, g, b, a)
        local c = { r = r or 1, g = g or 1, b = b or 1, a = a or 1 }
        function c:GenerateHexColorMarkup()
            local rr = math.floor((self.r or 1) * 255 + 0.5)
            local gg = math.floor((self.g or 1) * 255 + 0.5)
            local bb = math.floor((self.b or 1) * 255 + 0.5)
            return string.format("|cff%02x%02x%02x", rr, gg, bb)
        end
        return c
    end
end

if not BreakUpLargeNumbers then
    function BreakUpLargeNumbers(value)
        local n = tonumber(value) or 0
        local sign = n < 0 and "-" or ""
        local s = tostring(math.floor(math.abs(n) + 0.5))
        while true do
            local changed
            s, changed = s:gsub("^(%d+)(%d%d%d)", "%1,%2")
            if changed == 0 then break end
        end
        return sign .. s
    end
end

if not GetClassColor then
    function GetClassColor(classFile)
        local c = RAID_CLASS_COLORS and RAID_CLASS_COLORS[classFile]
        if c then return c.r, c.g, c.b end
        return 1, 1, 1
    end
end

-- 3.3.5 GetItemInfo stops at sellPrice; numeric classID/subclassID were only
-- added much later. SinStats only needs these old IDs to distinguish weapons,
-- shields and (for warrior Mace Specialization) one/two-handed maces.
local legacyWeaponSubtypes
do
    if GetAuctionItemSubClasses then
        local subclasses = { GetAuctionItemSubClasses(1) } -- old AH class 1 = Weapons
        legacyWeaponSubtypes = { mace1 = subclasses[5], mace2 = subclasses[6] }
    else
        legacyWeaponSubtypes = {}
    end
end

function Ns.GetItemClassSubClass335(item)
    if not item then return 0, 0 end
    local _, _, _, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo(item)
    if not itemType then return 0, 0 end

    if equipLoc == "INVTYPE_SHIELD" then
        return 4, 6 -- Armor / Shield
    end

    local weapon = equipLoc == "INVTYPE_WEAPON"
        or equipLoc == "INVTYPE_WEAPONMAINHAND"
        or equipLoc == "INVTYPE_WEAPONOFFHAND"
        or equipLoc == "INVTYPE_2HWEAPON"
        or equipLoc == "INVTYPE_RANGED"
        or equipLoc == "INVTYPE_RANGEDRIGHT"
        or equipLoc == "INVTYPE_THROWN"
    if weapon then
        if itemSubType and legacyWeaponSubtypes.mace1 and itemSubType == legacyWeaponSubtypes.mace1 then
            return 2, 4 -- Weapon / One-Handed Mace
        elseif itemSubType and legacyWeaponSubtypes.mace2 and itemSubType == legacyWeaponSubtypes.mace2 then
            return 2, 5 -- Weapon / Two-Handed Mace
        end
        return 2, 0
    end

    return 0, 0
end

if not GetItemInfoInstant then
    function GetItemInfoInstant(item)
        local itemID = tonumber(item)
        if not itemID and type(item) == "string" then
            itemID = tonumber(item:match("item:(%d+)"))
        end
        local _, _, _, _, _, itemType, itemSubType, _, equipLoc, icon = GetItemInfo(item)
        local classID, subClassID = Ns.GetItemClassSubClass335(item)
        return itemID, itemType, itemSubType, equipLoc, icon, classID, subClassID
    end
end

-- 3.3.5a exposes rating haste but not the later aggregate haste helpers.
if not GetMeleeHaste then
    function GetMeleeHaste()
        return (CR_HASTE_MELEE and GetCombatRatingBonus(CR_HASTE_MELEE)) or 0
    end
end
if not GetRangedHaste then
    function GetRangedHaste()
        return (CR_HASTE_RANGED and GetCombatRatingBonus(CR_HASTE_RANGED)) or 0
    end
end
if not GetHitModifier then
    function GetHitModifier()
        -- 3.3.5a has no aggregate GetHitModifier API. Rating is added separately by SinStats.
        return 0
    end
end

-- Modern namespaces used by the Wrath Classic release.
C_AddOns = C_AddOns or {}
C_AddOns.GetAddOnMetadata = C_AddOns.GetAddOnMetadata or GetAddOnMetadata

C_Container = C_Container or {}
C_Container.GetContainerNumSlots = C_Container.GetContainerNumSlots or GetContainerNumSlots
C_Container.GetContainerItemLink = C_Container.GetContainerItemLink or GetContainerItemLink
C_Container.GetContainerItemDurability = C_Container.GetContainerItemDurability or GetContainerItemDurability

C_CreatureInfo = C_CreatureInfo or {}
do
    local classes = {
        [1] = { className = "Warrior", classFile = "WARRIOR", classID = 1 },
        [2] = { className = "Paladin", classFile = "PALADIN", classID = 2 },
        [3] = { className = "Hunter", classFile = "HUNTER", classID = 3 },
        [4] = { className = "Rogue", classFile = "ROGUE", classID = 4 },
        [5] = { className = "Priest", classFile = "PRIEST", classID = 5 },
        [6] = { className = "Death Knight", classFile = "DEATHKNIGHT", classID = 6 },
        [7] = { className = "Shaman", classFile = "SHAMAN", classID = 7 },
        [8] = { className = "Mage", classFile = "MAGE", classID = 8 },
        [9] = { className = "Warlock", classFile = "WARLOCK", classID = 9 },
        [11] = { className = "Druid", classFile = "DRUID", classID = 11 },
    }
    C_CreatureInfo.GetClassInfo = C_CreatureInfo.GetClassInfo or function(id) return classes[id] end
end

-- Currency IDs used by Wrath Classic do not exist as a query API on the 3.3.5 client.
-- Map original-Wrath currencies to their token items / legacy PvP APIs.
local currencyItems = {
    [101] = 40752, -- Emblem of Heroism
    [102] = 40753, -- Emblem of Valor
    [126] = 43589, -- Mark of Wintergrasp
    [161] = 43228, -- Stone Keeper's Shard
    [221] = 45624, -- Emblem of Conquest
    [301] = 47241, -- Emblem of Triumph
    [341] = 49426, -- Emblem of Frost
}

local function LegacyCurrencyInfo(id)
    id = tonumber(id)
    if id == 1901 then
        local n = (GetHonorCurrency and GetHonorCurrency()) or 0
        return HONOR or "Honor", n, "Interface\\TargetingFrame\\UI-PVP-FFA"
    elseif id == 103 then
        local n = (GetArenaCurrency and GetArenaCurrency()) or 0
        return ARENA_POINTS or "Arena Points", n, "Interface\\PVPFrame\\PVP-Currency-Alliance"
    end
    local itemID = currencyItems[id]
    if itemID then
        local name, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
        return name or ("Currency " .. id), GetItemCount(itemID, true) or 0, icon
    end
    -- Sidereal Essence / Defiler's Scourgestone are Wrath Classic additions, not original 3.3.5a.
    return "Unsupported currency", 0, "Interface\\Icons\\INV_Misc_QuestionMark"
end

if not GetCurrencyInfo then GetCurrencyInfo = LegacyCurrencyInfo end
C_CurrencyInfo = C_CurrencyInfo or {}
C_CurrencyInfo.GetCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo or function(id)
    local name, quantity, icon = LegacyCurrencyInfo(id)
    return { name = name, quantity = quantity or 0, iconFileID = icon }
end

C_WowTokenPublic = C_WowTokenPublic or {}
C_WowTokenPublic.UpdateMarketPrice = C_WowTokenPublic.UpdateMarketPrice or function() end
C_WowTokenPublic.GetCurrentMarketPrice = C_WowTokenPublic.GetCurrentMarketPrice or function() return 0 end

-- Lightweight C_Timer implementation for 3.3.5a.
C_Timer = C_Timer or {}
do
    local timerFrame = CreateFrame("Frame")
    local timers = {}
    local function AddTimer(delay, callback, interval, iterations)
        local obj = { remaining = delay or 0, callback = callback, interval = interval, iterations = iterations, cancelled = false }
        function obj:Cancel() self.cancelled = true end
        table.insert(timers, obj)
        return obj
    end
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        local i = 1
        while i <= #timers do
            local t = timers[i]
            if t.cancelled then
                table.remove(timers, i)
            else
                t.remaining = t.remaining - elapsed
                if t.remaining <= 0 then
                    local ok, err = pcall(t.callback, t)
                    if not ok and DEFAULT_CHAT_FRAME then
                        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000SinStats timer error:|r " .. tostring(err))
                    end
                    if t.interval and not t.cancelled and (not t.iterations or t.iterations > 1) then
                        if t.iterations then t.iterations = t.iterations - 1 end
                        t.remaining = t.interval
                        i = i + 1
                    else
                        table.remove(timers, i)
                    end
                else
                    i = i + 1
                end
            end
        end
    end)
    C_Timer.After = C_Timer.After or function(delay, callback) AddTimer(delay, callback) end
    C_Timer.NewTicker = C_Timer.NewTicker or function(interval, callback, iterations)
        return AddTimer(interval, callback, interval, iterations)
    end
end

function Ns.GetCombatLogEventInfo(...)
    if CombatLogGetCurrentEventInfo then return CombatLogGetCurrentEventInfo() end

    -- WoW 3.3.5a CLEU has an 8-field header. Wrath Classic uses an 11-field
    -- header (hideCaster/sourceRaidFlags/destRaidFlags were added later).
    -- Rebuild the modern shape so the original SinStats Wrath logic can keep
    -- using source/destination GUIDs and select(12, ...) for event payloads.
    local timestamp, subevent, sourceGUID, sourceName, sourceFlags,
          destGUID, destName, destFlags = ...

    return timestamp, subevent, false,
           sourceGUID, sourceName, sourceFlags, 0,
           destGUID, destName, destFlags, 0,
           select(9, ...)
end

function Ns.PlaySound335(sound)
    if not sound then return end
    pcall(PlaySound, sound)
end

-- Old client uses UnitPowerMax(unit, 0) for mana.
Ns.ManaPowerType = 0
