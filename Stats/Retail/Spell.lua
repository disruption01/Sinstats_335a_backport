local AddName, Ns = ...
local L = Ns.L

------------------------------
--		Options Equates		--
------------------------------
local Both, Enhanced, Base = 3, 1, 2

----------------------------------
--		Text Return Formats		--
----------------------------------
local Double_Rating_Format = { "%.0f", "%.0f", "%.0f/%.0f", }

--------------------------
--		Physical		--
--------------------------
-- Intellect
function Ns.FunctionList.Intellect(HUD, data, options, ...)

	local EB = options.Enhanced_Base
	local _, stat, _, negBuff = UnitStat("Player", 4)
	local debuffColor = ""
	local returnText

	if negBuff < 0 then debuffColor = "|cffC41E3A" end

	if Ns.Band(EB, Enhanced) then returnText = debuffColor .. stat end
	if Ns.Band(EB, Base) then returnText = stat end
	if Ns.Band(EB, Both) then returnText = debuffColor .. stat .. "|r/" .. stat end

	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end

-- Spell Power
function Ns.FunctionList.SpellPower(HUD, data, options, ...)

	local EB, enhancedStat, baseStat = options.Enhanced_Base
	local statFormat = Double_Rating_Format[EB]
	local spellPower = 0
	local holySchool = GetSpellBonusDamage(2)
	local fireSchool = GetSpellBonusDamage(3)
	local natureSchool = GetSpellBonusDamage(4)
	local frostSchool = GetSpellBonusDamage(5)
	local shadowSchool = GetSpellBonusDamage(6)
	local arcaneSchool = GetSpellBonusDamage(7)

	spellPower = max(holySchool, fireSchool, natureSchool, frostSchool, shadowSchool, arcaneSchool)
	local basePower = spellPower
	spellPower = spellPower + (spellPower * Ns.shatteringStar) + (spellPower * Ns.radiantSpark) + (spellPower * Ns.chaosBrand) + (spellPower * Ns.felSunder) + (spellPower * Ns.serenity) +
				(spellPower * Ns.luckOfDraw) + (spellPower * Ns.shadowForm) + (spellPower * Ns.runePower) + (spellPower * (Ns.incanterFlow/100)) + (spellPower * (Ns.eradication/100)) +
				(spellPower * Ns.touchOfIce) + (spellPower * Ns.demonicSynergy) + (spellPower * (Ns.equilibrium/100)) + (spellPower * (Ns.InstinctArcana/100)) + (spellPower * (Ns.iridescence/100)) +
				(spellPower * Ns.charringEmbers) + (spellPower * Ns.ebonMight) + (spellPower * Ns.friendFae/100) + (spellPower * Ns.wanTwilight/100)

	if Ns.Band(EB, Enhanced) then enhancedStat = spellPower end
	if Ns.Band(EB, Base) then baseStat = basePower end

	HUD:UpdateText(data, format(statFormat, enhancedStat and enhancedStat or baseStat, baseStat))
end

-- Spell Damage
function Ns.FunctionList.DMGModSpell(HUD, data, options, ...)

	local spellMod = 0
	local verDamage = GetVersatilityBonus(29) + GetCombatRatingBonus(29)
	local color = ""
	local decimals

	if options.Decimals_DmgModSpell == 0 then decimals = "%.0f%%"
	elseif options.Decimals_DmgModSpell == 1 then decimals = "%.1f%%"
	elseif options.Decimals_DmgModSpell == 2 then decimals = "%.2f%%"
	else decimals = "%.3f%%" end

	spellMod = (Ns.shatteringStar * 100) + (Ns.radiantSpark * 100) + (Ns.chaosBrand * 100) + (Ns.felSunder * 100) + (Ns.serenity * 100) +
			   (Ns.luckOfDraw * 100) + verDamage + (Ns.shadowForm * 100) + (Ns.runePower * 100) + Ns.incanterFlow + Ns.tigersFury +
				Ns.eradication + (Ns.touchOfIce * 100) + (Ns.demonicSynergy * 100) + Ns.equilibrium + Ns.InstinctArcana + Ns.iridescence +
				Ns.arcaneSurge + Ns.enlightened + (Ns.charringEmbers * 100) + (Ns.ebonMight * 100) + Ns.friendFae + Ns.wanTwilight + Ns.retAura
	spellMod = spellMod + 100

	if spellMod <= 0 then spellMod = 100 end
	if spellMod > 100 then color = Ns.greenText end

	HUD:UpdateText(data, color .. (decimals):format(spellMod))
end

-- Healing Power
function Ns.FunctionList.Healing(HUD, data, options, ...)

---@diagnostic disable-next-line: unbalanced-assignments
	local EB, enhancedStat, baseStat = options.Enhanced_Base
	local statFormat = Double_Rating_Format[EB]
	local healPower = GetSpellBonusHealing()

	healPower = healPower + (healPower * Ns.serenity) + (healPower * Ns.luckOfDraw)

	if Ns.Band(EB, Enhanced) then enhancedStat = healPower end
	if Ns.Band(EB, Base) then baseStat = healPower end

	HUD:UpdateText(data, format(statFormat, enhancedStat and enhancedStat or baseStat, baseStat))
end

-- Mana Regen
function Ns.FunctionList.ManaRegen(HUD, data, options, ...)

	local EB = options.Enhanced_Base
	local regenBase, regenCasting = GetManaRegen()
	local returnText, decimals
	regenBase = regenBase * 5
	regenCasting = (regenCasting * 5)

	if options.Decimals_ManaRegen == 0 then decimals = "%.0f"
	elseif options.Decimals_ManaRegen == 1 then decimals = "%.1f"
	elseif options.Decimals_ManaRegen == 2 then decimals = "%.2f"
	else decimals = "%.3f" end

	if Ns.Band(EB, Enhanced) then returnText = (decimals):format(regenBase) end
	if Ns.Band(EB, Base) then returnText = (decimals):format(regenCasting) end
	if Ns.Band(EB, Both) then returnText = (decimals):format(regenBase) .. " (" .. (decimals):format(regenCasting) .. ")" end

	HUD:UpdateText(data, returnText)
end
