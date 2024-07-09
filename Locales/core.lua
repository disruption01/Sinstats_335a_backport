local AddName, Ns = ...

local defaultLocale, newLocale
function Ns.RegisterLocale(locale, default)
    if default then
        if locale == "enUS" and not defaultLocale then
            defaultLocale, newLocale = {}, {}
            Ns.L = setmetatable(newLocale, {
                __index = function(t, k)
                    local v = defaultLocale[k] or tostring(k)
                    return v
                end
            })
            return defaultLocale
        end
    end
    return newLocale
end

-- icons
local path = "Interface\\AddOns\\" .. AddName .. "\\Textures\\"
Ns.MiscIcon = "\124T" .. path .. "Misc:13\124t "
Ns.SettingsIcon = "\124T" .. path .. "Settings:13\124t "
Ns.DisplayIcon = "\124T" .. path .. "Display:13\124t "
Ns.SpacingIcon = "\124T" .. path .. "Spacing:13\124t "
Ns.LayoutIcon = "\124T" .. path .. "Order:13\124t "
Ns.ColumnIcon = "\124T" .. path .. "CheckColumn:13\124t "
Ns.EventsIcon = "\124T" .. path .. "Events:13\124t "
Ns.LockIcon = "\124T" .. path .. "Lock:12\124t "
Ns.HideIcon = "\124T" .. path .. "Hide:12\124t "
Ns.AttachIcon = "\124T" .. path .. "Attach:12\124t "
Ns.StrataIcon = "\124T" .. path .. "Strata:12\124t "
Ns.OutlineIcon = "\124T" .. path .. "Outline:12\124t "
Ns.BackgroundIcon = "\124T" .. path .. "Background:12\124t "
Ns.FontsIcon = "\124T" .. path .. "Fonts:12\124t "
Ns.FontSizeIcon = "\124T" .. path .. "FontSize:12\124t "
Ns.AlignIcon = "\124T" .. path .. "Align:12\124t "
Ns.WidthIcon = "\124T" .. path .. "Width:12\124t "
Ns.WidthStringIcon = "\124T" .. path .. "WidthString:12\124t "
Ns.HeightIcon = "\124T" .. path .. "Height:12\124t "
Ns.CapsIcon = "\124T" .. path .. "Caps:12\124t "
Ns.TextColorIcon = "\124T" .. path .. "TextColor:12\124t "
Ns.ValueColorIcon = "\124T" .. path .. "ValueColor:12\124t "
Ns.AbbreviateIcon = "\124T" .. path .. "Abbreviate:12\124t "
Ns.ToggleIconsIcon = "\124T" .. path .. "ToggleIcons:12\124t "
Ns.SeparatorIcon = "\124T" .. path .. "TextSeparator:12\124t "
Ns.MiniMenuIcon = "\124T" .. path .. "MinimapMenu:12\124t "
Ns.CompIcon = "\124T" .. path .. "Compartment:12\124t "

-- spells

Ns.ShadWeaveLink = "|T" .. select(3, GetSpellInfo(15258)) .. ":0|t" .. GetSpellLink(15258) .. "   "
Ns.MiseryLink = "|T" .. select(3, GetSpellInfo(33198)) .. ":0|t" .. GetSpellLink(33198) .. "   "
Ns.EbPlagLink = "|T" .. select(3, GetSpellInfo(51735)) .. ":0|t" .. GetSpellLink(51735) .. "   "
Ns.FaeFireLink = "|T" .. select(3, GetSpellInfo(770)) .. ":0|t" .. GetSpellLink(770) .. "   "
Ns.InsSwarmLink = "|T" .. select(3, GetSpellInfo(5570)) .. ":0|t" .. GetSpellLink(5570) .. "   "
Ns.EarMoonLink = "|T" .. select(3, GetSpellInfo(48506)) .. ":0|t" .. GetSpellLink(48506) .. "   "
Ns.HuntMarkLink = "|T" .. select(3, GetSpellInfo(53338)) .. ":0|t" .. GetSpellLink(53338) .. "   "
-- Ns.GlyphMarkLink = "|T" .. select(5, GetItemInfoInstant(42907)) .. ":0|t" .. GetSpellLink(56829) .. "   " -- Remove this line
Ns.ScorStingLink = "|T" .. select(3, GetSpellInfo(3043)) .. ":0|t" .. GetSpellLink(3043) .. "   "
Ns.WinChillLink = "|T" .. select(3, GetSpellInfo(12579)) .. ":0|t" .. GetSpellLink(12579) .. "   "
Ns.ImpScorLink = "|T" .. select(3, GetSpellInfo(2948)) .. ":0|t" .. GetSpellLink(22959) .. "   "
Ns.HearCrusLink = "|T" .. select(3, GetSpellInfo(20337)) .. ":0|t" .. GetSpellLink(54499) .. "   "
Ns.VengLink = "|T" .. select(3, GetSpellInfo(20049)) .. ":0|t" .. GetSpellLink(20053) .. "   "
Ns.HemoLink = "|T" .. select(3, GetSpellInfo(16511)) .. ":0|t" .. GetSpellLink(65954) .. "   "
Ns.ExpArmLink = "|T" .. select(3, GetSpellInfo(8647)) .. ":0|t" .. GetSpellLink(48669) .. "   "
Ns.StoStriLink = "|T" .. select(3, GetSpellInfo(17364)) .. ":0|t" .. GetSpellLink(32175) .. "   "
Ns.TotWrathLink = "|T" .. select(3, GetSpellInfo(30706)) .. ":0|t" .. GetSpellLink(57663) .. "   "
Ns.SunArmLink = "|T" .. select(3, GetSpellInfo(58567)) .. ":0|t" .. GetSpellLink(47467) .. "   "
Ns.ShaVulLink = "|T" .. select(3, GetSpellInfo(36276)) .. ":0|t" .. GetSpellLink(36276) .. "   "
Ns.ShaMasLink = "|T" .. select(3, GetSpellInfo(17800)) .. ":0|t" .. GetSpellLink(17800) .. "   "
Ns.CursEleLink = "|T" .. select(3, GetSpellInfo(1490)) .. ":0|t" .. GetSpellLink(47865) .. "   "
Ns.CursWeaLink = "|T" .. select(3, GetSpellInfo(702)) .. ":0|t" .. GetSpellLink(50511) .. "   "
Ns.BeaSlayLink = "|T" .. select(3, GetSpellInfo(20557)) .. ":0|t" .. GetSpellLink(20557) .. "   "
Ns.TunStalkLink = "|T" .. select(3, GetSpellInfo(49202)) .. ":0|t"
Ns.RageRivLink = "|T" .. select(3, GetSpellInfo(50117)) .. ":0|t"
Ns.SurvFitLink = "|T" .. select(3, GetSpellInfo(33853)) .. ":0|t"
Ns.ImpFaeLink = "|T" .. select(3, GetSpellInfo(770)) .. ":0|t"
Ns.ImpHuntMarkLink = "|T" .. select(3, GetSpellInfo(53338)) .. ":0|t"
Ns.MolFuryLink = "|T" .. select(3, GetSpellInfo(31679)) .. ":0|t"
Ns.FireVulLink = "|T" .. select(3, GetSpellInfo(38715)) .. ":0|t"
Ns.CrusadeLink = "|T" .. select(3, GetSpellInfo(31866)) .. ":0|t"
Ns.SavCombLink = "|T" .. select(3, GetSpellInfo(58413)) .. ":0|t"
Ns.MasPoisLink = "|T" .. select(3, GetSpellInfo(31226)) .. ":0|t"
Ns.BloFrenLink = "|T" .. select(3, GetSpellInfo(29836)) .. ":0|t"

-- class colors
Ns.Colors = {
    Green = "|cff71ffc9",
    Red = "|cffC41E3A",
    Warrior = "|cffC69B6D",
    Rogue = "|cffFFF468",
    Warlock = "|cff8788EE",
    Paladin = "|cffF48CBA",
    DeathKnight = "|cffC41E3A",
    Druid = "|cffFF7C0A",
    Hunter = "|cffAAD372",
    Mage = "|cff3FC7EB",
    Shaman = "|cff0070DD",
    Evoker = "|cff33937F",
    Monk = "|cff00FF98",
    DemonHunter = "|cffA330C9"
}
