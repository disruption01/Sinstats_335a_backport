local AddName, Ns = ...
local L = Ns.L


----------------------------
-- Local Helper Functions --
----------------------------

-- Number shorterner
function Ns.ShortNumbers(num, places)
    local ret
    local placeValue = ("%%.%df"):format(places or 0)
    if not num then return 0
    elseif num >= 1000 then ret = placeValue:format(num / 1000) .. "k"
	else ret = num -- hundreds
    end
    return ret
end

function Ns.StatsCompute()

	-- Init
	Ns.combustion, Ns.serenity, Ns.overflowEnergy, Ns.luckOfDraw = 0, 0, 0, 0
	Ns.hitCombo, Ns.shadowForm, Ns.loneWolf, Ns.runePower = 0, 0, 0, 0
	Ns.incanterFlow, Ns.demonSoul, Ns.tigersFury, Ns.momentum = 0, 0, 0, 0
	Ns.touchOfIce, Ns.demonicSynergy, Ns.seethChaos, Ns.equilibrium = 0, 0, 0, 0
	Ns.iridescence, Ns.arcaneSurge, Ns.enlightened, Ns.symbolsDeath = 0, 0, 0, 0
	Ns.ebonMight, Ns.avatar, Ns.battleShout, Ns.defStance, Ns.feralSpirit = 0, 0, 0, 0, 0
	Ns.bestialWrath, Ns.friendFae, Ns.retAura, Ns.inertia, Ns.GenePour = 0, 0, 0, 0, 0
	Ns.thread = 0

	for i = 1, 40 do
		local name, _, count, _, _, _, _, _, _, spellId = UnitBuff("player",i, "HELPFUL")

		if not spellId then break end

		if Ns.Combustion[spellId] then Ns.combustion = Ns.Combustion[spellId][1] end
		if Ns.Serenity[spellId] then Ns.serenity = Ns.Serenity[spellId][1] end
		if Ns.Overflowing[spellId] then Ns.overflowEnergy = count * 2 end
		if Ns.LuckOfTheDraw[spellId] then Ns.luckOfDraw = ((count * 5) / 100 ) end
		if Ns.HitCombo[spellId] then Ns.hitCombo = count end
		if Ns.Shadowform[spellId] then Ns.shadowForm = Ns.Shadowform[spellId][1] end
		if Ns.LoneWolf[spellId] then Ns.loneWolf = Ns.LoneWolf[spellId][1] end
		if Ns.RuneOfPower[spellId] then Ns.runePower = Ns.RuneOfPower[spellId][1] end
		if Ns.DemonSoul[spellId] then Ns.demonSoul = Ns.DemonSoul[spellId][1] end
		if Ns.TigersFury[spellId] then Ns.tigersFury = Ns.TigersFury[spellId][1] end
		if Ns.Momentum[spellId] then Ns.momentum = Ns.Momentum[spellId][1] end
		if Ns.TouchOfIce[spellId] then Ns.touchOfIce = Ns.TouchOfIce[spellId][1] end
		if Ns.SeethChaos[spellId] then Ns.seethChaos = Ns.SeethChaos[spellId][1] end
		if Ns.DemonicSynergy[spellId] then Ns.demonicSynergy = Ns.DemonicSynergy[spellId][1] end
		if Ns.IncanterFlow[spellId] then Ns.incanterFlow = count * 4 end
		if Ns.ElementalEquilibrium[spellId] then Ns.equilibrium = Ns.Equilibrium end
		if Ns.Iridescence[spellId] then Ns.iridescence = Ns.Iridescence[spellId][1] end
		if Ns.ArcaneSurge[spellId] then Ns.arcaneSurge = Ns.ArcaneSurge[spellId][1] end
		if Ns.Enlightened[spellId] then Ns.enlightened = Ns.Enlightened[spellId][1] end
		if Ns.SymbolsDeath[spellId] then Ns.symbolsDeath = Ns.SymbolsDeath[spellId][1] end
		if Ns.EbonMight[spellId] then Ns.ebonMight = Ns.EbonMight[spellId][1] end
		if Ns.Avatar[spellId] then Ns.avatar = Ns.Avatar[spellId][1] end
		if Ns.BattleShout[spellId] then Ns.battleShout = Ns.BattleShout[spellId][1] end
		if Ns.DefStance[spellId] then Ns.defStance = Ns.DefStance[spellId][1] end
		if Ns.FeralSpirit[spellId] then Ns.feralSpirit = Ns.FeralSpirit[spellId][1] end
		if Ns.BestialWrath[spellId] then Ns.bestialWrath = Ns.BestialWrath[spellId][1] end
		if Ns.FriendFae[spellId] then Ns.friendFae = Ns.FriendFae[spellId][1] end
		if Ns.RetAura[spellId] then Ns.retAura = Ns.RetAura[spellId][1] end
		if Ns.Inertia[spellId] then Ns.inertia = Ns.Inertia[spellId][1] end
		if Ns.GenPour[spellId] then Ns.GenePour = Ns.genPour end

		if Ns.Threads[spellId] then
			local aura = C_UnitAuras.GetAuraDataBySpellName("player", name)
			if aura then
				if aura.spellId == 440393 then
					Ns.thread = Ns.thread + (aura.points[1] or 0)
					Ns.thread = Ns.thread + (aura.points[2] or 0)
					Ns.thread = Ns.thread + (aura.points[3] or 0)
					Ns.thread = Ns.thread + (aura.points[4] or 0)
					Ns.thread = Ns.thread + (aura.points[5] or 0)
					Ns.thread = Ns.thread + (aura.points[6] or 0)
					Ns.thread = Ns.thread + (aura.points[7] or 0)
					Ns.thread = Ns.thread + (aura.points[8] or 0)
					Ns.thread = Ns.thread + (aura.points[9] or 0)
				end
			end
		end

	end
end

--------------------------------------
--		Global OnEvent function		--
--------------------------------------
function Ns.OnEventFunc(event, ...)

	if event == "PLAYER_TARGET_CHANGED" then
	-----	
		local exists = UnitExists("target")
		local hostile = UnitCanAttack("player", "target")

		if hostile or not exists then Ns.SinLive() end
	-----
	elseif event == "UPDATE_FACTION" then
	-----
		local currentXP = C_MajorFactions.GetMajorFactionData(2564)
		Ns.percentLoamm = 0
		if currentXP == nil then currentXP = 0 end
		Ns.percentLoamm = currentXP.renownReputationEarned
		Ns.percentLoamm = (Ns.percentLoamm * 0.04)
	-----
	elseif event == "TRAIT_CONFIG_UPDATED" then
		Ns.talentScan()
	-----	
	else
	-----	

	-- SinLive
	local unit = ...
	if unit == "target" then Ns.SinLive() return end

	Ns.StatsCompute()

end -- end events
end -- end function