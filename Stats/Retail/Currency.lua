local AddName, Ns = ...
local L = Ns.L

------------------------------
--		Options Equates		--
------------------------------
local Both, Level, Honor, Shadowflame, Ingenuity, Spark, Splinter, Normal, Enchanted = 3, 1, 2, 1, 2, 1, 2, 1, 2
local Gigantic, Plump = 1, 2

----------------------------------
--		Text Return Formats		--
----------------------------------
local Double_Rating_Format = { "%.0f", "%.0f", "%.0f/%.0f", }
local Base_Casting_Format = { "%.2f", "%.2f", "%.2f/%.2f", }

--------------------------
--		Currency		--
--------------------------

-- Money
function Ns.FunctionList.Gold(HUD, data, options, ...)

	local money = GetMoney()
	local formattedMoney = (GetCoinTextureString(money))

	HUD:UpdateText(data, formattedMoney)
end
------------------------------------------------

-- WoW Token
function Ns.FunctionList.WowToken(HUD, data, options, ...)

	C_WowTokenPublic.UpdateMarketPrice()
	local token = C_WowTokenPublic.GetCurrentMarketPrice() or 0
	token = floor(token / 10000)
	token = BreakUpLargeNumbers(token)

	if options.Display_Short then
		token = C_WowTokenPublic.GetCurrentMarketPrice() or 0
		token = floor(token / 10000)
		token = Ns.ShortNumbers(token)
	end

	--local formattedToken = "|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t " .. token

	HUD:UpdateText(data, token)
end
------------------------------------------------

-- Honor
function Ns.FunctionList.Honor(HUD, data, options, ...)

	local EB = options.Level_HonorPoints
	local honorLevel = UnitHonorLevel("player")
	local honorPoints = C_CurrencyInfo.GetCurrencyInfo(1792)--UnitHonor("player")
	local ratedHonor = C_CurrencyInfo.GetCurrencyInfo(1891)
	local ratedTotal, hpDisplay = 0, 0
	local returnText

	if honorPoints.name and tonumber(honorPoints.quantity) then hpDisplay = honorPoints.quantity else hpDisplay = 0 end
	if ratedHonor.name and tonumber(ratedHonor.quantity) then ratedTotal = ratedHonor.quantity end

	if options.Display_Rated then hpDisplay = ratedTotal end

	if Ns.Band(EB, Level) then returnText = honorLevel end
	if Ns.Band(EB, Honor) then returnText = hpDisplay end
	if Ns.Band(EB, Both) then returnText = honorLevel .. "/" .. hpDisplay end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Dragon Isles Supplies
function Ns.FunctionList.DragonSupplies(HUD, data, options, ...)

	local dragonSupplies = C_CurrencyInfo.GetCurrencyInfo(2003)
	local dsDisplay = 0

	if dragonSupplies.name and tonumber(dragonSupplies.quantity) then dsDisplay = dragonSupplies.quantity
	else dsDisplay = 0 end

	HUD:UpdateText(data, dsDisplay)
end
------------------------------------------------

-- Flightstones
function Ns.FunctionList.Flightstones(HUD, data, options, ...)

	local flightstones = C_CurrencyInfo.GetCurrencyInfo(2245)
	local fsDisplay = 0

	if flightstones.name and tonumber(flightstones.quantity) then fsDisplay = flightstones.quantity
	else fsDisplay = 0 end

	HUD:UpdateText(data, fsDisplay)
end
------------------------------------------------

-- Renascent Dreams
function Ns.FunctionList.Renascent(HUD, data, options, ...)

	local renascent = C_CurrencyInfo.GetCurrencyInfo(2796)
	local renascentDisplay = 0

	if renascent.name and tonumber(renascent.quantity) then renascentDisplay = renascent.quantity
	else renascentDisplay = 0 end

	HUD:UpdateText(data, renascentDisplay)
end
------------------------------------------------

-- Dreamsurge Coalescence
function Ns.FunctionList.DreamSurge(HUD, data, options, ...)

	local countTotal = GetItemCount(207026, true)

	HUD:UpdateText(data, (countTotal))
end
------------------------------------------------

-- Bloody Tokens
function Ns.FunctionList.BloodyTokens(HUD, data, options, ...)

	local bloodyTokens = C_CurrencyInfo.GetCurrencyInfo(2123)
	local bloodyDisplay = 0

	if bloodyTokens.name and tonumber(bloodyTokens.quantity) then bloodyDisplay = bloodyTokens.quantity
	else bloodyDisplay = 0 end

	HUD:UpdateText(data, bloodyDisplay)
end
------------------------------------------------

-- Storm Sigil
function Ns.FunctionList.StormSigil(HUD, data, options, ...)

	local stormSigil = C_CurrencyInfo.GetCurrencyInfo(2122)
	local sigilDisplay = 0

	if stormSigil.name and tonumber(stormSigil.quantity) then sigilDisplay = stormSigil.quantity
	else sigilDisplay = 0 end

	HUD:UpdateText(data, sigilDisplay)
end
------------------------------------------------

-- Elemental Overflow
function Ns.FunctionList.EleOverflow(HUD, data, options, ...)

	local eleOverflow = C_CurrencyInfo.GetCurrencyInfo(2118)
	local eoDisplay = 0

	if eleOverflow.name and tonumber(eleOverflow.quantity) then eoDisplay = eleOverflow.quantity
	else eoDisplay = 0 end

	HUD:UpdateText(data, eoDisplay)
end
------------------------------------------------

-- Valor points
function Ns.FunctionList.ValorPoints(HUD, data, options, ...)

	local valor = C_CurrencyInfo.GetCurrencyInfo(1191)
	local valorDisplay = 0

	if valor.name and tonumber(valor.quantity) then valorDisplay = valor.quantity
	else valorDisplay = 0 end

	HUD:UpdateText(data, valorDisplay)
end
------------------------------------------------

-- Paracausal flakes
function Ns.FunctionList.Flakes(HUD, data, options, ...)

	local flakes = C_CurrencyInfo.GetCurrencyInfo(2594)
	local flDisplay = 0

	if flakes.name and tonumber(flakes.quantity) then flDisplay = flakes.quantity
	else flDisplay = 0 end

	HUD:UpdateText(data, flDisplay)
end
------------------------------------------------

-- Conquest
function Ns.FunctionList.Conquest(HUD, data, options, ...)

	local conquest = C_CurrencyInfo.GetCurrencyInfo(1602)
	local conquestDisplay = 0

	if conquest.name and tonumber(conquest.quantity) then conquestDisplay = conquest.quantity
	else conquestDisplay = 0 end

	HUD:UpdateText(data, conquestDisplay)
end
------------------------------------------------

-- Timewarped Badges
function Ns.FunctionList.Timewarped(HUD, data, options, ...)

	local timewarped = C_CurrencyInfo.GetCurrencyInfo(1166)
	local twDisplay = 0

	if timewarped.name and tonumber(timewarped.quantity) then twDisplay = timewarped.quantity
	else twDisplay = 0 end

	HUD:UpdateText(data, twDisplay)
end
------------------------------------------------

-- Trader's Tender
function Ns.FunctionList.TraderTender(HUD, data, options, ...)

	local trader = C_CurrencyInfo.GetCurrencyInfo(2032)
	local traderDisplay = 0

	if trader.name and tonumber(trader.quantity) then traderDisplay = trader.quantity
	else traderDisplay = 0 end

	HUD:UpdateText(data, traderDisplay)
end
------------------------------------------------

-- Mysterious Fragment
function Ns.FunctionList.Mysterious(HUD, data, options, ...)

	local frag = C_CurrencyInfo.GetCurrencyInfo(2657)
	local fragDisplay = 0

	if frag.name and tonumber(frag.quantity) then fragDisplay = frag.quantity
	else fragDisplay = 0 end

	HUD:UpdateText(data, fragDisplay)
end
------------------------------------------------

-- Whelpling Crest
function Ns.FunctionList.WhelplingCrest(HUD, data, options, ...)

	local EB = options.Normal_Enchanted
	local returnText

	local crest = C_CurrencyInfo.GetCurrencyInfo(2806)
	local enchantedCrest = GetItemCount(Ns.Crest.Whelp[3], true)
	local crestDisplay = 0
	local max = crest.maxQuantity or 0
	local earn = crest.totalEarned or 0
	local capColor = ""

	if crest.name and tonumber(crest.quantity) then crestDisplay = crest.quantity
	else crestDisplay = 0 end

	if options.Display_Max and earn == max then capColor = Ns.redText end

	if Ns.Band(EB, Normal) then returnText = crestDisplay end
	if Ns.Band(EB, Enchanted) then returnText = enchantedCrest end
	if Ns.Band(EB, Both) then returnText = crestDisplay .. "/" .. enchantedCrest end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, capColor .. returnText)
end
------------------------------------------------

-- Drake Crest
function Ns.FunctionList.DrakeCrest(HUD, data, options, ...)

	local crest = C_CurrencyInfo.GetCurrencyInfo(2807)
	local crestDisplay = 0
	local max = crest.maxQuantity or 0
	local earn = crest.totalEarned or 0
	local capColor = ""

	if crest.name and tonumber(crest.quantity) then crestDisplay = crest.quantity
	else crestDisplay = 0 end

	if options.Display_Max and earn == max then capColor = Ns.redText end

	HUD:UpdateText(data, capColor .. crestDisplay)
end
------------------------------------------------

-- Wyrm Crest
function Ns.FunctionList.WyrmCrest(HUD, data, options, ...)

	local EB = options.Normal_Enchanted
	local returnText

	local crest = C_CurrencyInfo.GetCurrencyInfo(2809)
	local enchantedCrest = GetItemCount(Ns.Crest.Wyrm[3], true)
	local crestDisplay = 0
	local max = crest.maxQuantity or 0
	local earn = crest.totalEarned or 0
	local capColor = ""

	if crest.name and tonumber(crest.quantity) then crestDisplay = crest.quantity
	else crestDisplay = 0 end

	if options.Display_Max and earn == max then capColor = Ns.redText end

	if Ns.Band(EB, Normal) then returnText = crestDisplay end
	if Ns.Band(EB, Enchanted) then returnText = enchantedCrest end
	if Ns.Band(EB, Both) then returnText = crestDisplay .. "/" .. enchantedCrest end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, capColor .. returnText)
end
------------------------------------------------

-- Aspect Crest
function Ns.FunctionList.AspectCrest(HUD, data, options, ...)

	local EB = options.Normal_Enchanted
	local returnText

	local crest = C_CurrencyInfo.GetCurrencyInfo(2812)
	local enchantedCrest = GetItemCount(Ns.Crest.Aspect[3], true)
	local crestDisplay = 0
	local max = crest.maxQuantity or 0
	local earn = crest.totalEarned or 0
	local capColor = ""

	if crest.name and tonumber(crest.quantity) then crestDisplay = crest.quantity
	else crestDisplay = 0 end

	if options.Display_Max and earn == max then capColor = Ns.redText end

	if Ns.Band(EB, Normal) then returnText = crestDisplay end
	if Ns.Band(EB, Enchanted) then returnText = enchantedCrest end
	if Ns.Band(EB, Both) then returnText = crestDisplay .. "/" .. enchantedCrest end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, capColor .. returnText)
end
------------------------------------------------

-- Spark of Awakening
function Ns.FunctionList.SparkDreams(HUD, data, options, ...)

	local EB = options.Splint_Spark
	local returnText
	local spark = GetItemCount(Ns.Spark.Awake, true)
	local splinter = GetItemCount(Ns.Spark.splAwake, true)

	if Ns.Band(EB, Spark) then returnText = spark end
	if Ns.Band(EB, Splinter) then returnText = splinter end
	if Ns.Band(EB, Both) then returnText = spark .. " (" .. splinter .. ")" end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Antique Bronze Bullion
function Ns.FunctionList.Bullion(HUD, data, options, ...)

	local bullion = GetItemCount(213089, true)


	HUD:UpdateText(data, bullion)
end
------------------------------------------------

-- Bronze
function Ns.FunctionList.Bronze(HUD, data, options, ...)

	local bronze = C_CurrencyInfo.GetCurrencyInfo(2778)
	local bronzeDisplay = 0

	if bronze.name and tonumber(bronze.quantity) then bronzeDisplay = bronze.quantity
	else bronzeDisplay = 0 end

	if options.Decimals_Bronze == 0 then
		bronzeDisplay = BreakUpLargeNumbers(bronzeDisplay)
	elseif options.Decimals_Bronze == 1 then
		bronzeDisplay = Ns.ShortNumbers(bronzeDisplay, 0)
	elseif options.Decimals_Bronze == 2 then
		bronzeDisplay = Ns.ShortNumbers(bronzeDisplay, 1)
	else
		bronzeDisplay = Ns.ShortNumbers(bronzeDisplay, 2)
	end

	HUD:UpdateText(data, bronzeDisplay)
end
------------------------------------------------

-- Threads (Pandaria Remix)
function Ns.FunctionList.Threads(HUD, data, options, ...)

	local threads = Ns.thread

	if options.Decimals_Threads == 0 then
		threads = BreakUpLargeNumbers(threads)
	elseif options.Decimals_Threads == 1 then
		threads = Ns.ShortNumbers(threads, 0)
	elseif options.Decimals_Threads == 2 then
		threads = Ns.ShortNumbers(threads, 1)
	else
		threads = Ns.ShortNumbers(threads, 2)
	end

	HUD:UpdateText(data, threads)
end
------------------------------------------------

-- Emerald Dewdrop
function Ns.FunctionList.DewDrop(HUD, data, options, ...)

	local dewdrop = C_CurrencyInfo.GetCurrencyInfo(2650)
	local dewdropDisplay = 0

	if dewdrop.name and tonumber(dewdrop.quantity) then dewdropDisplay = dewdrop.quantity
	else dewdropDisplay = 0 end

	HUD:UpdateText(data, dewdropDisplay)
end
------------------------------------------------

-- Gigantic Seed
function Ns.FunctionList.GigaSeed(HUD, data, options, ...)

	local EB = options.Giga_Plump
	local returnText
	local giga = GetItemCount(Ns.Seeds.Gigantic, true)
	local plump = GetItemCount(Ns.Seeds.Plump, true)

	if Ns.Band(EB, Gigantic) then returnText = giga end
	if Ns.Band(EB, Plump) then returnText = plump end
	if Ns.Band(EB, Both) then returnText = giga .. "/" .. plump end
	if returnText == nil then returnText = 0 end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Gigantic Seed
function Ns.FunctionList.PlumpSeed(HUD, data, options, ...)

	local seed = GetItemCount(Ns.Seeds.Plump, true)

	HUD:UpdateText(data, seed)
end
------------------------------------------------

-- Seedbloom
function Ns.FunctionList.SeedBloom(HUD, data, options, ...)

	local seed = GetItemCount(Ns.Seeds.Bloom, true)

	HUD:UpdateText(data, seed)
end
------------------------------------------------

