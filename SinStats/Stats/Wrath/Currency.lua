local AddName, Ns = ...
local L = Ns.L

---------------------
-- Options Equates --
---------------------
local Both, Heroism, Valor, StoneKeeper, Marks, Honor, Arena = 3, 1, 2, 1, 2, 1, 2

-- Money
function Ns.FunctionList.Money(HUD, data, options, ...)

	local money = GetMoney()
	local formattedMoney = (GetCoinTextureString(money))

	HUD:UpdateText(data, formattedMoney)
end
------------------------------------------------

-- WoW Token
function Ns.FunctionList.WowToken(HUD, data, options, ...)

	HUD:UpdateText(data, "N/A")
end
------------------------------------------------

-- Emblem of Frost
function Ns.FunctionList.FrostEmblem(HUD, data, options, ...)

	local frost = GetItemCount(49426, true) or 0

	HUD:UpdateText(data, frost)
end
------------------------------------------------

-- Defiler's Scourgestone
function Ns.FunctionList.ScourgeStone(HUD, data, options, ...)

	local stone = 0 -- Defiler's Scourgestone is not part of original 3.3.5a

	HUD:UpdateText(data, stone)
end
------------------------------------------------

-- Primordial Saronite
function Ns.FunctionList.Saronite(HUD, data, options, ...)

	local countTotal = GetItemCount(49908, true)

	HUD:UpdateText(data, (countTotal))
end
------------------------------------------------

-- Heroism & Valor
function Ns.FunctionList.Emblems(HUD, data, options, ...)

	local EB = options.Heroism_Valor
	local heroism = GetItemCount(40752, true) or 0
	local valor = GetItemCount(40753, true) or 0
	local returnText

	if Ns.Band(EB, Heroism) then returnText = heroism end
	if Ns.Band(EB, Valor) then returnText = valor end
	if Ns.Band(EB, Both) then returnText = heroism .. "/" .. valor end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Sidereal Essence
function Ns.FunctionList.Sidereal(HUD, data, options, ...)

	local sidereal = 0 -- Sidereal Essence is not part of original 3.3.5a

	HUD:UpdateText(data, sidereal)
end
------------------------------------------------

-- Emblem of Triumph
function Ns.FunctionList.Triumph(HUD, data, options, ...)

	local triumph = GetItemCount(47241, true) or 0

	HUD:UpdateText(data, triumph)
end
------------------------------------------------

-- Emblem of Conquest
function Ns.FunctionList.Conquest(HUD, data, options, ...)

	local conquest = GetItemCount(45624, true) or 0

	HUD:UpdateText(data, conquest)
end
------------------------------------------------

-- Wintergrasp currency
function Ns.FunctionList.StoneShard(HUD, data, options, ...)

	local EB = options.Shards_Marks
	local shards = GetItemCount(43228, true) or 0
	local marks = GetItemCount(43589, true) or 0
	local returnText

	if Ns.Band(EB, StoneKeeper) then returnText = shards end
	if Ns.Band(EB, Marks) then returnText = marks end
	if Ns.Band(EB, Both) then returnText = shards .. "/" .. marks end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- PvP Points
function Ns.FunctionList.PvP(HUD, data, options, ...)

	local EB = options.Honor_Arena
	local honor = (GetHonorCurrency and GetHonorCurrency()) or 0
	local arena = (GetArenaCurrency and GetArenaCurrency()) or 0
	local returnText

	if Ns.Band(EB, Honor) then returnText = honor end
	if Ns.Band(EB, Arena) then returnText = arena end
	if Ns.Band(EB, Both) then returnText = honor .. "/" .. arena end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------