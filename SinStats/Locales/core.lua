local AddName, Ns = ...

local defaultLocale, newLocale
function Ns.RegisterLocale(locale, default)
	if default then
		if locale == "enUS" and not defaultLocale then
			defaultLocale, newLocale = {}, {}
			Ns.L = setmetatable(newLocale, { __index = function(t, k)
				local v = defaultLocale[k] or tostring(k)
				return v
			end})
			return defaultLocale
		end
	end
	return newLocale
end

-- icons
local path = "Interface\\AddOns\\"..AddName.."\\Textures\\"
Ns.MiscIcon = "\124T" .. path .."Misc:13\124t "
Ns.SettingsIcon = "\124T" .. path .."Settings:13\124t "
Ns.DisplayIcon = "\124T" .. path .."Display:13\124t "
Ns.SpacingIcon = "\124T" .. path .."Spacing:13\124t "
Ns.LayoutIcon = "\124T" .. path .."Order:13\124t "
Ns.ColumnIcon = "\124T" .. path .."CheckColumn:13\124t "
Ns.EventsIcon = "\124T" .. path .."Events:13\124t "
Ns.LockIcon = "\124T" .. path .."Lock:12\124t "
Ns.HideIcon = "\124T" .. path .."Hide:12\124t "
Ns.AttachIcon = "\124T" .. path .."Attach:12\124t "
Ns.StrataIcon = "\124T" .. path .."Strata:12\124t "
Ns.OutlineIcon = "\124T" .. path .."Outline:12\124t "
Ns.BackgroundIcon = "\124T" .. path .."Background:12\124t "
Ns.FontsIcon = "\124T" .. path .."Fonts:12\124t "
Ns.FontSizeIcon = "\124T" .. path .."FontSize:12\124t "
Ns.AlignIcon = "\124T" .. path .."Align:12\124t "
Ns.WidthIcon = "\124T" .. path .."Width:12\124t "
Ns.WidthStringIcon = "\124T" .. path .."WidthString:12\124t "
Ns.HeightIcon = "\124T" .. path .."Height:12\124t "
Ns.CapsIcon = "\124T" .. path .."Caps:12\124t "
Ns.TextColorIcon = "\124T" .. path .."TextColor:12\124t "
Ns.ValueColorIcon = "\124T" .. path .."ValueColor:12\124t "
Ns.AbbreviateIcon = "\124T" .. path .."Abbreviate:12\124t "
Ns.ToggleIconsIcon = "\124T" .. path .."ToggleIcons:12\124t "
Ns.SeparatorIcon = "\124T" .. path .."TextSeparator:12\124t "
Ns.MiniMenuIcon = "\124T" .. path .."MinimapMenu:12\124t "
Ns.CompIcon = "\124T" .. path .."Compartment:12\124t "

-- spell links (3.3.5a)
local function SpellLink335(spellID, trailing)
    local name, _, icon = GetSpellInfo(spellID)
    local link = GetSpellLink and GetSpellLink(spellID)
    if not name or not icon then return "" end
    return "|T"..icon..":0|t" .. (link or name) .. (trailing or "   ")
end

-- Wrath debuffs / talents referenced by the Wrath locale tooltips.
Ns.BeaSlayLink     = SpellLink335(20557)
Ns.BloFrenLink     = SpellLink335(30070)
Ns.CrusadeLink     = SpellLink335(31866)
Ns.CursEleLink     = SpellLink335(1490)
Ns.CursWeaLink     = SpellLink335(702)
Ns.EarMoonLink     = SpellLink335(60433)
Ns.EbPlagLink      = SpellLink335(51735)
Ns.ExpArmLink      = SpellLink335(8647)
Ns.FaeFireLink     = SpellLink335(770)
Ns.FireVulLink     = SpellLink335(22959)
Ns.GlyphMarkLink   = SpellLink335(57855)
Ns.HearCrusLink    = SpellLink335(20337)
Ns.HemoLink        = SpellLink335(16511)
Ns.HuntMarkLink    = SpellLink335(1130)
Ns.ImpFaeLink      = SpellLink335(33602)
Ns.ImpHuntMarkLink = SpellLink335(19421)
Ns.ImpScorLink     = SpellLink335(22959)
Ns.InsSwarmLink    = SpellLink335(5570)
Ns.MasPoisLink     = SpellLink335(58410)
Ns.MiseryLink      = SpellLink335(33198)
Ns.MolFuryLink     = SpellLink335(31679)
Ns.RageRivLink     = SpellLink335(51745)
Ns.SavCombLink     = SpellLink335(58684)
Ns.ScorStingLink   = SpellLink335(3043)
Ns.ShaMasLink      = SpellLink335(17800)
Ns.ShaVulLink      = SpellLink335(17800)
Ns.ShadWeaveLink   = SpellLink335(15258)
Ns.StoStriLink     = SpellLink335(17364)
Ns.SunArmLink      = SpellLink335(58567)
Ns.SurvFitLink     = SpellLink335(33853)
Ns.TotWrathLink    = SpellLink335(57722)
Ns.TunStalkLink    = SpellLink335(49202)
Ns.WinChillLink    = SpellLink335(12579)

-- class colors
Ns.Colors = {
	Green = "|cff71ffc9",
	Red = "|cffC41E3A"	,
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
	DemonHunter = "|cffA330C9",
}