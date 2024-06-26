local AddName, Ns = ...
local L = Ns.L


----------------------
--		SinLive		--
----------------------
function Ns.SinLive(self)

	Ns.shatteringStar, Ns.skyreach, Ns.radiantSpark, Ns.betweenEyes = 0, 0, 0, 0
	Ns.chaosBrand, Ns.mysticTouch, Ns.colossusSmash, Ns.razorIce = 0, 0, 0, 0
	Ns.felSunder, Ns.faeExposure, Ns.brittle, Ns.eradication = 0, 0, 0, 0
	Ns.charringEmbers, Ns.finalReck, Ns.judgement, Ns.barbedShot = 0, 0, 0, 0
	Ns.ghostlyStrike, Ns.wanTwilight, Ns.huntersMark = 0, 0, 0

	for i = 1, 40 do
	local _, _, dcount, _, _, _, caster, _, _, debuffId = UnitDebuff("target", i)
	local _, _, pcount, _, _, _, _, _, _, petId = UnitBuff("pet",i, "HELPFUL")

	if Ns.BarbedShot[petId] then Ns.barbedShot = Ns.BarbedShot[petId][1] * pcount end

	if not debuffId then break end

		if Ns.ShatteringStar[debuffId] and Ns.classFilename == "EVOKER" then Ns.shatteringStar = Ns.ShatteringStar[debuffId][1] end
		if Ns.ChaosBrand[debuffId] then Ns.chaosBrand = Ns.ChaosBrand[debuffId][1] end
		if Ns.MysticTouch[debuffId] then Ns.mysticTouch = Ns.MysticTouch[debuffId][1] end
		if Ns.Brittle[debuffId] then Ns.brittle = Ns.Brittle[debuffId][1] end

		if caster == "player" then
			if Ns.FinalReckoning[debuffId] then Ns.finalReck = Ns.FinalReckoning[debuffId][1] end
			if Ns.Judgement[debuffId] then Ns.judgement = Ns.Judgement[debuffId][1] end
			if Ns.CharringEmbers[debuffId] then Ns.charringEmbers = Ns.CharringEmbers[debuffId][1] end
			if Ns.ColossusSmash[debuffId] then Ns.colossusSmash = Ns.ColossusSmash[debuffId][1] end
			if Ns.RazorIce[debuffId] then Ns.razorIce = dcount * 3 / 100 end
			if Ns.FelSunder[debuffId] then Ns.felSunder = dcount / 100 end
			if Ns.FaeExposure[debuffId] then Ns.faeExposure = Ns.FaeExposure[debuffId][1] end
			if Ns.Skyreach[debuffId] then Ns.skyreach = Ns.Skyreach[debuffId][1] end
			if Ns.RadiantSpark[debuffId] then Ns.radiantSpark = dcount * 10 / 100 end
			if Ns.BetweenEyes[debuffId] then Ns.betweenEyes = Ns.BetweenEyes[debuffId][1] end
			if Ns.GhostlyStrike[debuffId] then Ns.ghostlyStrike = Ns.GhostlyStrike[debuffId][1] end
			if Ns.WaningTwilight[debuffId] then Ns.wanTwilight = Ns.WaningTwilight[debuffId][1] end
		end

		-- health percentage-based debuffs
		local health = UnitHealth("target")
		local maxHealth = UnitHealthMax("target")
		local percentHealth = (health / maxHealth) * 100
		if Ns.HuntersMark[debuffId] and percentHealth >= 80 then
			Ns.huntersMark = Ns.HuntersMark[debuffId][1]
		end

		if Ns.classFilename == "WARLOCK" then
			if Ns.Eradication[debuffId] then Ns.eradication = Ns.EradicationTalent end
		end
	end
end