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

-- spells
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
	Ns.ShatStarLink = "|T"..select(3, GetSpellInfo(370452))..":0|t" .. GetSpellLink(370452) .. "  "
	Ns.SkyReachLink = "|T"..select(3, GetSpellInfo(392991))..":0|t" .. GetSpellLink(392991) .. "  "
	Ns.MystTouchLink = "|T"..select(3, GetSpellInfo(331653))..":0|t" .. GetSpellLink(331653) .. "  "
	Ns.FaeExpLink = "|T"..select(3, GetSpellInfo(395414))..":0|t" .. GetSpellLink(395414) .. "  "
	Ns.RadSparkLink = "|T"..select(3, GetSpellInfo(376103))..":0|t" .. GetSpellLink(376103) .. "  "
	Ns.BetEyesLink = "|T"..select(3, GetSpellInfo(315341))..":0|t" .. GetSpellLink(315341) .. "  "
	Ns.ChaosBrandLink = "|T"..select(3, GetSpellInfo(1490))..":0|t" .. GetSpellLink(1490) .. "  "
	Ns.ColSmashLink = "|T"..select(3, GetSpellInfo(167105))..":0|t" .. GetSpellLink(167105) .. "  "
	Ns.WarBreakerLink = "|T"..select(3, GetSpellInfo(262161))..":0|t" .. GetSpellLink(262161) .. "  "
	Ns.FelSunLink = "|T"..select(3, GetSpellInfo(387402))..":0|t" .. GetSpellLink(387402) .. "  "
	Ns.BrittleLink = "|T"..select(3, GetSpellInfo(374557))..":0|t" .. GetSpellLink(374557) .. "  "
	Ns.EradicLink = "|T"..select(3, GetSpellInfo(196414))..":0|t" .. GetSpellLink(196414) .. "  "
	Ns.FinalReckLink = "|T"..select(3, GetSpellInfo(343721))..":0|t"..GetSpellLink(343721).."   "
	Ns.CharringLink = "|T"..select(3, GetSpellInfo(408665))..":0|t"..GetSpellLink(408665).."   "
	Ns.BarbedShotLink = "|T"..select(3, GetSpellInfo(217200))..":0|t"..GetSpellLink(217200).."   "
	Ns.GhostlyStrikeLink = "|T"..select(3, GetSpellInfo(196937))..":0|t"..GetSpellLink(196937).."   "
	Ns.WanTwilightLink = "|T"..select(3, GetSpellInfo(394083))..":0|t"..GetSpellLink(394083).."   "
	Ns.HuntersMarkLink = "|T"..select(3, GetSpellInfo(257284))..":0|t"..GetSpellLink(257284).."   "
	Ns.ThreadLink = "|T"..select(3, GetSpellInfo(431760))..":0|t"..GetSpellLink(431760).."   "
elseif WOW_PROJECT_ID == 14 then
	Ns.DeathEmbLink = "|T"..select(3, GetSpellInfo(47198))..":0|t"..GetSpellLink(47198).."   "
	Ns.FaeFireLink = "|T"..select(3, GetSpellInfo(91565))..":0|t"..GetSpellLink(91565).."   "
	Ns.EarMoonLink = "|T"..select(3, GetSpellInfo(60433))..":0|t"..GetSpellLink(60433).."   "
	Ns.HuntMarkLink = "|T"..select(3, GetSpellInfo(1130))..":0|t"..GetSpellLink(1130).."   "
	Ns.ScarFeverLink = "|T"..select(3, GetSpellInfo(81130))..":0|t"..GetSpellLink(81130).."   "
	Ns.ExpArmLink = "|T"..select(3, GetSpellInfo(8647))..":0|t"..GetSpellLink(8647).."   "
	Ns.SunArmLink = "|T"..select(3, GetSpellInfo(58567))..":0|t"..GetSpellLink(58567).."   "
	Ns.CursEleLink = "|T"..select(3, GetSpellInfo(1490))..":0|t"..GetSpellLink(1490).."   "
	Ns.BeaSlayLink = "|T"..select(3, GetSpellInfo(20557))..":0|t"..GetSpellLink(20557).."   "
	Ns.MolFuryLink = "|T"..select(3, GetSpellInfo(31679))..":0|t"
	Ns.BrittleLink = "|T"..select(3, GetSpellInfo(81326))..":0|t"..GetSpellLink(81326).."   "
	Ns.SavCombLink = "|T"..select(3, GetSpellInfo(58413))..":0|t"
	Ns.MasPoisLink = "|T"..select(3, GetSpellInfo(93068))..":0|t"..GetSpellLink(93068).."   "
	Ns.BloFrenLink = "|T"..select(3, GetSpellInfo(30070))..":0|t"..GetSpellLink(30070).."   "
	Ns.NoEscapeLink = "|T"..select(3, GetSpellInfo(53298))..":0|t"
	Ns.ShadFlameLink = "|T"..select(3, GetSpellInfo(76768))..":0|t"..GetSpellLink(17800).."   "
	Ns.VindiLink = "|T"..select(3, GetSpellInfo(26017))..":0|t"..GetSpellLink(26017).."   "
	Ns.LightBreathLink = "|T"..select(3, GetSpellInfo(24844))..":0|t"..GetSpellLink(24844).."   "
end

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