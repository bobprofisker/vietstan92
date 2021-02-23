    --  Name:                           CYC_onCallCas.lua
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\hindsas\\Saved Games\\DCS.openbeta\\Missions\\Vietstan92\\Lua\\CYC_sickAItrainer.lua'))()
    --  Dependencies:                   Mist.lua, CYC_do.lua
    --  Description:
    --      Creates firefights on the ground between units on the ground and enemy to replicate modern firefights, adds in jtac style 9 line (simplified) to hit units until the fight is over, enemy withdraws etc
    --  Usage:
    --      1. 
	
--[[List of outstanding work to do

-- 1. Unit spawner, on wyapoint, later on random points or within zones that are set
	2. units periodically fight it out, but often just hold fire or shoot near the other units
	3. units get a jtac, or faca, and targets marked by smokes that get sort of close but not bang on, laser sometimes 
	4. some form of comms 
	units get given tasking by an awac depending on who is in the air, told to push to a location and push to a button
	i.e. check in, check out
	5. group asking for jtac missions 

]]--
ocs = {}


function ocs.radio ()

end 

function ocs.unitSpawner (vec2Gl)

end 


do
    radioSubMenu = missionCommands.addSubMenu ("On call CAS")

end
