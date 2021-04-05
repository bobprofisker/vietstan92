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

function mudfight.eventHandler (event) 
		if (26 == event.id) then
		--CYC_carrier.lua START of SECTION this sectoin should be kept if using CYC_carrier.lua
				if string.find (event.text, "cas") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					aaa.createAAAzone()  
				-- --end of section on call CAS CYC_ocas.lua
				
				-- Start of section on CYC_tankers.lua
				elseif string.find (event.text, "fuel") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					tanker.orbitPoint(pointVec3,"Tanker 1")  
				--end of section on call CAS CYC_ocas.lua
				
				--start of sectoin on CYC_sickAItrainer.lua
				elseif string.find (event.text, "sa2") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					mudfight.sam(pointVec3,"2") 
				elseif string.find (event.text, "sa3") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					mudfight.sam(pointVec3,"3")  
				elseif string.find (event.text, "sa6") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					mudfight.sam(pointVec3,"6") 
				elseif string.find (event.text, "sa10") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					mudfight.sam(pointVec3,"10") 
				end
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
	
--event handler stuff

		mist.addEventHandler(mudfight.eventHandler)
	
end
