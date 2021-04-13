    --  Name:                           CYC_airbase.lua
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\username\\Saved Games\\DCS.openbeta\\Missions\\In dev\\t45\\Lua\\ACT_loadModules.lua'))()
    --  Dependencies:                   Mist.lua
    --  Description:
    --      Plays an ATIS file for the airbase at incirlik, file must be in the mission on start
	--		also allows you to play a warning air raid klaxon / siren

--[[List of outstanding work to do
   1. ,make it work
	
]]--
-- Declaration
airbase = {}

airbase.radioF = 275500000 -- the actual frequency of the ATIS in Hz 
--124000000
--275500000

--trigger.action.radioTransmission("l10n/DEFAULT/tankstates.ogg", trigger.misc.getZone("radio").point, radio.modulation.AM, false, airbase.radioF, 200, "radio1")
trigger.action.radioTransmission("l10n/DEFAULT/atis.ogg", trigger.misc.getZone("radio-incirlik").point, 0, true, airbase.radioF, 200,"radio-incirlik")