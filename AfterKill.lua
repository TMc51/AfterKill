local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")

local trash = {
	[1] = "PWNT!",
	[2] = "OWNED!",
	[3] = "GOTCHA!",
	[4] = "Got 'em!",
	[5] = "Who's yo daddy?",
	[6] = "Oops, I did it again.",
	[7] = "BooYah!",
	[8] = "Maybe next time.  ...NOT!",
}

local emo = {
	[1]  = "THREATEN",
	[2]  = "CACKLE",
	[3]  = "GAZE",
	[4]  = "GLARE",
	[5]  = "GRIN",
	[6]  = "MOURN",
	[7]  = "VIOLIN",
	[8]  = "TAUNT",
}

local tracker
local playerid

local function SetUpTracker()
		tracker = CreateFrame("Frame")
		tracker:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		tracker:SetScript("OnEvent", function(_, _, _, event, _, guid, _, _, _, _, destName,  destFlags)
				if event == "PARTY_KILL" then --and guid==playerid and bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
					--SendChatMessage(trash[random(1,8)], "SAY", NIL)
					DoEmote(emo[random(1,8)], "none")
				end
		end)
end

EventFrame:SetScript("OnEvent", function(self, event, ...)
		if event == "PLAYER_LOGIN" then
				playerid = UnitGUID("player")
				SetUpTracker()
		end
end)

SLASH_AK1 = '/AK'
local function handler(msg)
	if msg == 'on' then
		tracker:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		print("AfterKill is now enabled.")
	
elseif
		msg == 'off' then
			tracker:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			print("AfterKill is now disabled.")
	
else
		print("Only '/ak on', and '/ak off' are valid commands.")
	end
end
SlashCmdList["AK"] = handler