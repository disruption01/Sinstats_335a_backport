local AddName, Ns = ...
local L = Ns.L

------------------------------
--		Options Equates		--
------------------------------
local Both, World, Realm, Equipped, Max, Level, Honor, Percentage, Rating = 3, 1, 2, 1, 2, 1, 2, 1, 2
local Season, Expansion = 1, 2

----------------------
--		Misc		--
----------------------

-- Target Speed
function Ns.FunctionList.TargetSpeed(HUD, data, options, ...)

	local speedColor = ""
	local targetSpeed = GetUnitSpeed("target") / 7 * 100

	if targetSpeed == 0 or targetSpeed == 100 then speedColor = ""
	elseif targetSpeed < 100 then speedColor = "|cffC41E3A"
	elseif targetSpeed > 100 then speedColor = "|cff71FFC9" end

	HUD:UpdateText(data, speedColor .. string.format("%d%%", ("%.0f"):format(targetSpeed)))
end
------------------------------------------------

-- Durability
function Ns.FunctionList.Durability(HUD, data, options, ...)
	local Durability, Current, Full, Percent
	local LowestCurrent, LowestFull, t1, t2, t3 = 500, 0, 0, 0, 100
	for i=1,19 do
		Current, Full = GetInventoryItemDurability(i)
		if Current and Full then
			Percent = floor(100*Current/Full + 0.5)
			if (Percent < t3) then
				t3 = Percent
			end
			if (Current < LowestCurrent) then
				LowestCurrent = Current
				LowestFull = Full
			end
			t1 = t1 + Current
			t2 = t2 + Full
		end
	end
	if t2 == 0 then
		Durability = "N/A"
	else
		Durability = floor(t1 * 100 / t2)
	end
	local Text = ""
	if type(Durability) == "number" then
		if Durability > 50 then
			Text = string.format("|cff%2xff00", ((Durability > 50) and (255 - 2.55*Durability) or (2.55*Durability)), Durability) .. Text
		else
			Text = string.format("|cffff%2x00", (2.55*Durability), Durability) .. Text
		end
		Text = Text..Durability.."%"
	end

	HUD:UpdateText(data, Text)
end
------------------------------------------------

-- Repair cost
function Ns.FunctionList.RepairCost(HUD, data, options, ...)

	local totalCost = 0

	for slotName, slotID in pairs(Enum.InventoryType) do
		local itemDurability
		local repairCost

		itemDurability = C_TooltipInfo.GetInventoryItem("player", slotID)

		if itemDurability then TooltipUtil.SurfaceArgs(itemDurability) ; repairCost = itemDurability.repairCost end
		if repairCost and repairCost > 0 then totalCost = totalCost + repairCost end
	end

	HUD:UpdateText(data, GetCoinTextureString(totalCost))
end
------------------------------------------------

-- Item Level
function Ns.FunctionList.ItemLevel(HUD, data, options, ...)

	local EB = options.Equipped_Overall
	local overall, equipped = GetAverageItemLevel()
	local returnText, decimals

	if options.Decimals_iLVL == 0 then decimals = "%.0f"
	elseif options.Decimals_iLVL == 1 then decimals = "%.1f"
	elseif options.Decimals_iLVL == 2 then decimals = "%.2f"
	else decimals = "%.3f" end

	if Ns.Band(EB, Equipped) then returnText = (decimals):format(equipped) end
	if Ns.Band(EB, Max) then returnText = (decimals):format(overall) end
	if Ns.Band(EB, Both) then returnText = (decimals):format(equipped) .. "/" .. (decimals):format(overall) end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- PvP iLvl
function Ns.FunctionList.PvPiLvl(HUD, data, options, ...)

	local pvp = select(3, GetAverageItemLevel())
	local decimals

	if options.Decimals_pvpiLVL == 0 then decimals = "%.0f"
	elseif options.Decimals_pvpiLVL == 1 then decimals = "%.1f"
	elseif options.Decimals_pvpiLVL == 2 then decimals = "%.2f"
	else decimals = "%.3f" end

	HUD:UpdateText(data, (decimals):format(pvp))
end
------------------------------------------------

-- Global Cooldown
local gcd, oldgcd = 0, 0
function Ns.FunctionList.GlobalCD(HUD, data, options, ...)

	_, gcd = GetSpellCooldown(61304)
	local decimals

	if gcd == 0 then gcd = oldgcd
	else oldgcd = gcd end

	if options.Decimals_Gcd == 0 then decimals = "%.0f"
	elseif options.Decimals_Gcd == 1 then decimals = "%.1f"
	elseif options.Decimals_Gcd == 2 then decimals = "%.2f"
	else decimals = "%.3f" end

	HUD:UpdateText(data, (decimals):format(gcd))
end
------------------------------------------------

-- Ping
function Ns.FunctionList.Lag(HUD, data, options, ...)

	local EB = options.World_Realm
	local _, _, lagRealm, lagWorld = GetNetStats()
	local lagColor = ""
	local returnText

	if lagWorld <= 90 or lagRealm <= 90 then lagColor = "|cff71FFC9"
	elseif (lagWorld >= 90 and lagWorld < 200) or  (lagRealm >= 90 and lagRealm < 200) then lagColor = "|cffFF7C0A"
	elseif lagWorld >= 200 or lagRealm >= 200 then lagColor = "|cffC41E3A" end

	if Ns.Band(EB, World) then returnText = lagColor .. floor(lagWorld) end
	if  Ns.Band(EB, Realm) then returnText = lagColor .. floor(lagRealm) end
	if  Ns.Band(EB, Both) then returnText = lagColor .. floor(lagWorld) .. "/" .. floor(lagRealm) end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- FPS
function Ns.FunctionList.FPS(HUD, data, options, ...)

	local framerate = GetFramerate()
	local fpsColor = ""
	local returnText

	if framerate < 30 then fpsColor = "|cffC41E3A"
	elseif framerate > 30 and framerate < 50 then fpsColor = "|cffFF7C0A"
	elseif framerate > 50 then fpsColor = "|cff71FFC9" end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, fpsColor .. floor(framerate))
end
------------------------------------------------

-- Renown
function Ns.FunctionList.Renown(HUD, data, options, ...)

	local dragonscale = C_CurrencyInfo.GetCurrencyInfo(2021)
	local tuskarr = C_CurrencyInfo.GetCurrencyInfo(2087)
	local centaur = C_CurrencyInfo.GetCurrencyInfo(2002)
	local valdrakken = C_CurrencyInfo.GetCurrencyInfo(2088)
	local dsDisplay, tusDisplay, centDisplay, valDisplay = 0, 0, 0, 0
	local displayValdrakken, displayCentaur, displayTuskarr, displayDragonscale = "", "", "", ""
	local sepOne, sepTwo, sepThree = "/", "/", "/"

	if dragonscale.name and tonumber(dragonscale.quantity) then dsDisplay = dragonscale.quantity; displayDragonscale = dsDisplay
	else dsDisplay = 0 end
	if tuskarr.name and tonumber(tuskarr.quantity) then tusDisplay = tuskarr.quantity; displayTuskarr = tusDisplay
	else tusDisplay = 0 end
	if centaur.name and tonumber(centaur.quantity) then centDisplay = centaur.quantity; displayCentaur = centDisplay
	else centDisplay = 0 end
	if valdrakken.name and tonumber(valdrakken.quantity) then valDisplay = valdrakken.quantity; displayValdrakken = valDisplay
	else valDisplay = 0 end

	if options.Hide_Reputation then
		if dragonscale == 25 then displayDragonscale = ""; sepOne = "" end
		if tuskarr == 30 then displayTuskarr = "" end
		if (centaur == 25) and (valdrakken == 30) then sepTwo = "" end
		if centaur == 25 then displayCentaur = "" end
		if valdrakken == 30 then displayValdrakken = ""; sepThree = "" end
	end

	HUD:UpdateText(data, displayDragonscale .. sepOne .. displayTuskarr .. sepTwo .. displayCentaur .. sepThree .. displayValdrakken)
end
------------------------------------------------

-- Loamm Niffen
function Ns.FunctionList.LoammNiffen(HUD, data, options, ...)

	local loamm = C_CurrencyInfo.GetCurrencyInfo(2402)
	local currentXP = C_MajorFactions.GetMajorFactionData(2564)
	local loammDisplay = 0
	local returnText

	if currentXP == nil then currentXP = 0 end

	local percent = currentXP.renownReputationEarned

	if loamm.name and tonumber(loamm.quantity) then loammDisplay = loamm.quantity
	else loammDisplay = 0 end

	percent = (percent * 0.04)

	returnText = loammDisplay

	if options.Display_Percentage then returnText = loammDisplay .. " (" .. ("%.0f%%"):format(percent) .. ")" end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Dream Wardens
function Ns.FunctionList.DreamWardens(HUD, data, options, ...)

	local wardens = C_CurrencyInfo.GetCurrencyInfo(2653)
	local currentXP = C_MajorFactions.GetMajorFactionData(2574)
	local wardensDisplay = 0
	local returnText

	if currentXP == nil then currentXP = 0 end

	local percent = currentXP.renownReputationEarned

	if wardens.name and tonumber(wardens.quantity) then wardensDisplay = wardens.quantity
	else wardensDisplay = 0 end

	percent = (percent * 0.04)

	returnText = wardensDisplay

	if options.Display_Percentage then returnText = wardensDisplay .. " (" .. ("%.0f%%"):format(percent) .. ")" end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Mythic Plus rating
function Ns.FunctionList.MythicPlus(HUD, data, options, ...)

	local EB = options.Season_Exp
	local expRating = C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion()
	local rating = C_ChallengeMode.GetOverallDungeonScore()
	local color = C_ChallengeMode.GetDungeonScoreRarityColor(rating)
	local colorBest = C_ChallengeMode.GetDungeonScoreRarityColor(expRating)
	local coloredRating, coloredBest = "", ""
	local returnText

	if color then coloredRating = color:WrapTextInColorCode(rating) end
	if colorBest then coloredBest = colorBest:WrapTextInColorCode(expRating) end

	if Ns.Band(EB, Season) then returnText = coloredRating end
	if Ns.Band(EB, Expansion) then returnText = coloredBest end
	if Ns.Band(EB, Both) then returnText = coloredRating .. "|r/" .. coloredBest end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Threat
function Ns.FunctionList.Threat(HUD, data, options, ...)

	local EB = options.Percent_Rating
	local _, _, threatpct, _, threatvalue = UnitDetailedThreatSituation("player", "target")
	local returnText
	local threatColor = ""

	if threatpct == nil then threatpct = 0 end
	if threatvalue == nil then threatvalue = 0 end

	if threatpct <= 59 then threatColor = Ns.greenText
	elseif threatpct >= 60 and threatpct < 100 then threatColor = Ns.orangeText
	elseif threatpct == 100 then threatColor = Ns.redText end

	if Ns.Band(EB, Percentage) then returnText = threatColor .. ("%.0f%%"):format(threatpct) end
	if Ns.Band(EB, Rating) then returnText = threatColor .. ("%.0f"):format(threatvalue) end
	if Ns.Band(EB, Both) then returnText = threatColor .. ("%.0f%%"):format(threatpct) .. " |r(" .. ("%.0f"):format(threatvalue) .. ")" end

	if returnText == nil then returnText = "" end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------
