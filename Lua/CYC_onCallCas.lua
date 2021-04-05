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
cas = {}
cas.delimiter = "-" -- this is the thing we use to delimit commands
radio = {}
cas.laserTable = {}
cas.laserCounter = 1
cas.thisStore = ""





----------------
----------------
--This section is the new completed functions, which work with any unit and delimiter


----------------
----------------



function cas.unitSpawner (text,pointVec3Gl) 
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
		
	notify(unitInfo[1],2)
	notify(unitInfo[2],2)

	if unitInfo[1] == "bluetank" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluetank", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "bluearmy" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluearmy", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)			
				
	elseif unitInfo[1] == "blueapc" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueapc", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluecar" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluecar", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluetopup" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluetopup", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "bluerover" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluerover", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
elseif unitInfo[1] == "blueengine" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueengine", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluetruck" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluetruck", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "blueaaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueaaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluemanpad" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluemanpad", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "blueraaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueraaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "blueflak" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueflak", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "blueinf" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "blueinf", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluemlrs" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluemlrs", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bluearty" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluearty", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
				
			----- END OF BLUE REGULAR FORCES
				----- START OF RED REGULAR FORCES
				
				
				
				
	elseif unitInfo[1] == "redtank" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redtank", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redapc" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redapc", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "redarmy" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redarmy", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "redmlrs" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redmlrs", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
		elseif unitInfo[1] == "redarty" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redarty", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "redscud" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redscud", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
	elseif unitInfo[1] == "redcar" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redcar", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redtruck" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redtruck", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redaaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redaaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redmanpad" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redmanpad", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redraaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redraaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redflak" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redflak", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "redinf" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redinf", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)

	----- END OF RED REGULAR FORCES		
			----- START OF BLUE SAM SITES
			
	elseif unitInfo[1] == "bluepatriot" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluepatriot", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)		
	elseif unitInfo[1] == "bluehawk" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bluehawk", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)

			----- END OF BLUE SAM SITES		
			----- START OF RED SAM SITES		
	elseif unitInfo[1] == "redsatwo" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redsatwo", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
								
	elseif unitInfo[1] == "redsasix" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redsasix", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "redsaten" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redsaten", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "redsaeleven" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redsaeleven", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "redsarapier" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "redsarapier", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	else
		--do nada (not cuddles and not sexually)
	end
		
		-- local fightSpawn = 
				 -- {
				 -- groupId = mist.getNextGroupId(),
				 -- groupName = "fighttest", 
				 -- point = pointVec3Gl, 
				 -- action = 'clone',
				 -- }	
			 -- mist.teleportToPoint(fightSpawn)
			 -- --cas.newGndSpawn()
						 
end 



function cas.unitMover (text,pointVec3Gl)		
	-- local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
	

	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
		notify(unitInfo[1],2)
		notify(unitInfo[2],2)
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()
		
	-- if unitInfo[4] == nil then
		-- local vel = 100
	-- elseif tonumber(unitInfo[4]) == nil then
		-- local vel = 100
	-- else 
		-- local vel = tonumber(unitInfo[4])
	-- end
	local vel = 100
	if unitInfo[3] == nil then
	elseif unitInfo[4] == nil then
		 if unitInfo[3] == "slow" then
			vel = 2
		 elseif unitInfo[4] == "slow" then
			vel = 2
		 elseif unitInfo[3] == "fast" then
			vel = 8
		elseif unitInfo[4] == "fast" then
			vel = 8
		 end
	end
	
		controller:resetTask()
		--Controller.resetTask(Controller self) 
		
		
		-- local _groupVec3 = Group.getByName(cas.unitName):getUnit(1):getPoint() 
		-- local path = {} --build the waypoint to, from for the unit
		-- path[#path + 1] = mist.ground.buildWP (_groupVec3, nil, 1)
		-- path[#path + 1] = mist.ground.buildWP (pointVec3Gl, nil, 1) 
		-- mist.goRoute(cas.unitName, path)
		
		if unitInfo[3] == "road" then
			
			vars = 
			 {
			 group = group, 
			 point = pointVec3Gl,
			 speed = vel,
			 }
			 mist.groupToRandomPoint(vars)
		else
		
			vars = 
				 {
				 group = group, 
				 point = pointVec3Gl,
				 disableRoads = true,
				 speed = vel,
				 }
				 mist.groupToRandomPoint(vars)
		end
	 end
end 


function cas.unitSafe(text,pointVec3Gl)		
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
	

	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
				
		notify(unitInfo[1],2)
		notify(unitInfo[2],2)

		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()                           --User provides rounds, ammo	
		controller:setOption(0, 4) -- hold
		
		
	end	
		
end

function cas.unitHot(text,pointVec3Gl)		
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
	

	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
				
		notify(unitInfo[1],2)
		notify(unitInfo[2],2)

		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()                           --User provides rounds, ammo	
		controller:setOption(0, 2) -- fire
		
		
	end	
		
end 

function cas.unitLaser(text,pointVec3Gl)
	-- local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
	if unitInfo[3] == nil then
			unitInfo[3] = "1688"
	elseif tonumber(unitInfo[3]) then
		--if this passes we need to do nothing unitInfo 3 is already a valid laser code as its a number
	else
		unitInfo[3] = "1688"
	end
	
	notify(unitInfo[1],2)
	notify(unitInfo[2],2)
	notify(unitInfo[3],2)
	
	local group = Group.getByName(unitInfo[1])
	local target = pointVec3Gl
	local ray = Spot.createLaser(group, {x = 0, y = 1, z = 0}, target, tonumber(unitInfo[3]))
	
		
	notify("Laser on code " .. unitInfo[3],2)
	
	cas.laserTable[tonumber(cas.laserCounter)] = ray
	cas.laserCounter = cas.laserCounter+1
	
end

function cas.unitLaserOff(text,pointVec3Gl)

	for key, value in ipairs(cas.laserTable) do
			--value.destroy()
			Spot.destroy(value)
	   end
	 notify("All Lasers Off",2)
	cas.laserCounter = 1
	cas.laserTable = nil
	cas.laserTable = {}
end 

function cas.unitShooter(text,pointVec3)
	-- local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
	
			 notify(unitInfo[1],2)
			 notify(unitInfo[2],2)
			
			-- --do some magic code to conv vec3gl to vec2
			local vec2 = mist.utils.makeVec2(pointVec3)
			
			local group = Group.getByName(unitInfo[1])

			local controller = group:getController()
			
			local expend = 5
			local distance = 10
			
			if unitInfo[3] == nil then
			else
				expend = tonumber(unitInfo[3]) 
			end
			if unitInfo[4] == nil then
			else
				distance = tonumber(unitInfo[4])
			end

			local fireTask = { 
				id = 'FireAtPoint', 
				params = {
				point = vec2,
				radius = distance,
				expendQty = expend,
				expendQtyEnabled = true, 
				}
			}
			controller:setTask(fireTask)
	end

end

function cas.unitInv(text,pointVec3)
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
	
			 notify(unitInfo[1],2)
			 notify(unitInfo[2],2)
			
			-- --do some magic code to conv vec3gl to vec2
			local group = Group.getByName(unitInfo[1])
			local controller = group:getController()
			
			if unitInfo[3] == nil then
				local setImmortal = { id = 'SetImmortal', params = {value = false}}
				controller:setCommand(setImmortal)
			elseif unitInfo[3] == "on" then
				local setImmortal = { id = 'SetImmortal', params = {value = true}}
				controller:setCommand(setImmortal)
			else
				local setImmortal = { id = 'SetImmortal', params = {value = false}}
				controller:setCommand(setImmortal)
			end

	end

end

function cas.effect(text,pointVec3)

	local unitInfo = cvn.mysplit(text, cas.delimiter)
 		 notify(unitInfo[1],2)
		 
			if unitInfo[2] == nil then
				trigger.action.explosion(pointVec3, 1)
				trigger.action.effectSmokeBig(pointVec3, 5, 0)
			elseif unitInfo[2] == "bomb" then
				notify(unitInfo[2],2)
				trigger.action.explosion(pointVec3, 1)
			else
				trigger.action.effectSmokeBig(pointVec3, 5, 0)
			end

	
end

function cas.smoke (text,pointVec3Gl)
	notify("Smoke on the deck",2)
	trigger.action.smoke(pointVec3Gl,3)
end 

function cas.remove(text,pointVec3)

	local unitInfo = cvn.mysplit(text, cas.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
	
			 notify(unitInfo[1],2)
			 notify(unitInfo[2],2)
			
			-- --do some magic code to conv vec3gl to vec2
			local group = Group.getByName(unitInfo[1])
			Group.destroy(group)

	end

	
end


		
function plan.eventHandler (event) 
	if (26 == event.id) then

				
			if string.find(event.text, cas.delimiter .. "spawn") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitSpawner(event.text,pointVec3)
			elseif string.find(event.text, cas.delimiter .. "laser") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitLaser(event.text,pointVec3)
			elseif string.find(event.text, cas.delimiter .. "off") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitLaserOff(event.text,pointVec3)
								
			elseif string.find(event.text, cas.delimiter .. "fire") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitShooter(event.text,pointVec3)

			elseif string.find(event.text, cas.delimiter .. "smoke") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.smoke(event.text,pointVec3)		
			elseif string.find(event.text, cas.delimiter .. "safe") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitSafe(event.text,pointVec3)
			elseif string.find(event.text, cas.delimiter .. "hot") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitHot(event.text,pointVec3)		
			elseif string.find(event.text, cas.delimiter .. "inv") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitInv(event.text,pointVec3)		
			elseif string.find(event.text, cas.delimiter .. "effect") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.effect(event.text,pointVec3)	
			elseif string.find(event.text, cas.delimiter .. "remove") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.remove(event.text,pointVec3)					
													
									
			elseif string.find(event.text, cas.delimiter .. "move") then
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				cas.unitMover(event.text,pointVec3)			
			end	
		end
end


function radio.playVoice(event)
	
	
		if (26 == event.id) then
				if string.find (event.text, "]]]]]]") then
					radioMessage = event.text:sub(2)
					STTS.TextToSpeech(radioMessage,"264","AM","1.0","SRS",2)
				end
	end
	
	
	
end

function radio.playVoice9Line(radioMessage,channel)
				local radioMessage = radioMessage or ""
				local channel = channel or "264"
					STTS.TextToSpeech(radioMessage,channel,"AM","1.0","SRS",2)
end

do
	mist.addEventHandler(plan.eventHandler)
	mist.addEventHandler(radio.playVoice)
end

--Fake 9 line type of thing

-- have a wider function that controls 6 of the push button frequencies , PB 10,11,12,13,14,15
-- if someone checks in as CAS generate a mark attack point
-- make a zone around this
-- tell them on awac general frequency to push radio x i.e. 10, 11 ....
-- when they check in on frequency tell them where to go
-- pick units, weapons, play time
-- spawn units in
-- wait for them to get into the zone
-- describe the wider setting, enemy troops, friendlies, how targets will be marked
-- pick show of force, gun, explosive
-- mark targets and get them to attack over and over with simple 9 line
--when check out or play time reached end engagement, de spawn units


