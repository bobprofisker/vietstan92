    --  Name:                           CYC_sickAItrainer
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\hindsas\\Saved Games\\DCS.openbeta\\Missions\\Vietstan92\\Lua\\CYC_sickAItrainer.lua'))()
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
mudfight = {}
dogfight.unitTable = {}
dogfight.globalIncVar = 1
dogfight.loopVal = 1

mudfight.unitTable = {}
mudfight.globalIncVar = 1
mudfight.loopVal = 1

function dogfight.newAirSpawn()
	dogfight.globalIncVar = dogfight.globalIncVar + 1
end

function mudfight.newGndSpawn()
	mudfight.globalIncVar = mudfight.globalIncVar + 1
end

function dogfight.spawnF4()
	mist.cloneGroup("F4",true)
	dogfight.newAirSpawn()
end

function dogfight.spawnMig23()
	mist.cloneGroup("Mig23",true)
	dogfight.newAirSpawn()
end

function dogfight.spawn21()
	mist.cloneGroup("Mig21",true)
	dogfight.newAirSpawn()
end

function dogfight.spawnMig19()
	mist.cloneGroup("Mig-19",true)
	dogfight.newAirSpawn()
end

function dogfight.su27()
	mist.cloneGroup("su27",true)
	dogfight.newAirSpawn()
end

--local ref = mist.utils.makeVec3(mist.DBs.missionData.bullseye.blue, 0)

function mudfight.sam(vec3,samType)	
	if samType == "2" then
		local samSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "SAMSA2", 
				 point = vec3, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(samSpawn)
			 mudfight.newGndSpawn()
	elseif samType == "3" then
		local samSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "SAMSA3", 
				 point = vec3, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(samSpawn)
			 mudfight.newGndSpawn()
	elseif samType == "6" then
		local samSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "SAMSA6", 
				 point = vec3, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(samSpawn)
			 mudfight.newGndSpawn()
	elseif samType == "10" then
		local samSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "SAMSA10", 
				 point = vec3, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(samSpawn)
			 mudfight.newGndSpawn()
	end
end




function dogfight.reset()
	
		for i = dogfight.loopVal, dogfight.globalIncVar do
			nameString = "AGGRESSORS air " .. i
			if Group.getByName(nameString):isExist() == true then
				Group.getByName(nameString):destroy()
			end
			notify("Reset all air units",2)
			dogfight.loopVal = dogfight.loopVal + 1 
		end

end

function mudfight.reset()
	
		for i = mudfight.loopVal, mudfight.globalIncVar do
			nameString = "RUSSIA gnd " .. i
			if Group.getByName(nameString):isExist() == true then
				Group.getByName(nameString):destroy()
			end
			notify("Reset all ground units",2)
			mudfight.loopVal = mudfight.loopVal + 1 
		end

end

do
    radioSubMenu = missionCommands.addSubMenu ("Trainer spawner")
	radioFight4 = missionCommands.addCommand ("Mig19", radioSubMenu, dogfight.spawnMig19)
	radioFight3 = missionCommands.addCommand ("Mig21", radioSubMenu, dogfight.spawn21)
	radioFight2 = missionCommands.addCommand ("Mig23", radioSubMenu, dogfight.spawnMig23)
	radioFight = missionCommands.addCommand ("F4", radioSubMenu, dogfight.spawnF4)	
	radioFight7 = missionCommands.addCommand ("su27", radioSubMenu, dogfight.su27)
	radioFight = missionCommands.addCommand ("Reset all air", radioSubMenu, dogfight.reset)
	radioFight = missionCommands.addCommand ("Reset all ground", radioSubMenu, mudfight.reset)
end
