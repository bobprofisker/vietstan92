    --  Name:                           CYC_sickAItrainer
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\username\\Saved Games\\DCS.openbeta\\Missions\\In dev\\t45\\Lua\\ACT_loadModules.lua'))()
    --  Dependencies:                   Mist.lua, CYC_do.lua
    --  Description:
    --      Lists all co ordinates and times of waypoint markers 
    --  Usage:
    --      1. Uncomment, or add, any .lua files you wish to run
    --      2. place f10 markers for waypoints named wp2t103000 etc and it will print them via  
    --      3. wp1 is auto and always bulls
	
--[[List of outstanding work to do
   
	7. Takes speeds from ToT at your given ground speed and works out the ToT for each waypoint
	8. Updates the ToT based on a hack time that you can change and it re calculates the ToT
	10. If waypoints aren't ordered 1 - etc then can start from later number 
	11. Only shows the waypoints to the group who hit the F10 menu
]]--
dogfight = {}

function dogfight.spawnF4()
	mist.cloneGroup("F4",true)
end

function dogfight.spawn29()
	mist.cloneGroup("Mig29",true)
end

function dogfight.spawnMig23()
	mist.cloneGroup("Mig23",true)
end

function dogfight.spawnHawk()
	mist.cloneGroup("Hawk",true)
end

function dogfight.spawnMig19()
	mist.cloneGroup("Mig-19",true)
end

function dogfight.Mirage()
	mist.cloneGroup("Mirage",true)
end

function dogfight.F5()
	mist.cloneGroup("F5",true)
end

function dogfight.su27()
	mist.cloneGroup("su27",true)
end


do
    radioSubMenu = missionCommands.addSubMenu ("Dogfight trainer spawner")
	radioFight3 = missionCommands.addCommand ("Hawk", radioSubMenu, dogfight.spawnHawk)
	radioFight4 = missionCommands.addCommand ("Mig19", radioSubMenu, dogfight.spawnMig19)
	radioFight2 = missionCommands.addCommand ("Mig23", radioSubMenu, dogfight.spawnMig23)
	radioFight6 = missionCommands.addCommand ("F5", radioSubMenu, dogfight.F5)
	radioFight = missionCommands.addCommand ("F4", radioSubMenu, dogfight.spawnF4)	
	radioFight5 = missionCommands.addCommand ("Mirage", radioSubMenu, dogfight.Mirage)
	radioFight7 = missionCommands.addCommand ("su27", radioSubMenu, dogfight.su27)
	radioFight = missionCommands.addCommand ("Mig29", radioSubMenu, dogfight.spawn29)
end
