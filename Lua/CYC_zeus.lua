    --  Name:                           CYC_zeus.lua
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\hindsas\\Saved Games\\DCS.openbeta\\Missions\\Vietstan92\\Lua\\CYC_sickAItrainer.lua'))()
    --  Dependencies:                   Mist.lua, CYC_do.lua
    --  Description:
    --      Creates firefights on the ground between units on the ground and enemy to replicate modern firefights, adds in jtac style 9 line (simplified) to hit units until the fight is over, enemy withdraws etc
    --  Usage:
    --      1. 
	
--[[List of outstanding work to do

-- 1. 
	2. aircraft
	3. liveries
	4. everything to dyn add table
	5. units get named specifically b or r 1,2,3 etc
	6. a list of tables that store which units exist and means the numbers dont get too hight
	7. side specific notify
	8. Weapons on LHA-1, CVN 71
	9. Remove spawns from other airbase
	10. check smoke change colour
	11. set coniditon of unit

]]--
cas = {}
cas.delimiter = "-" -- this is the thing we use to delimit commands
radio = {}
cas.laserTable = {}
cas.laserCounter = 1
cas.thisStore = ""
cas.unitCounterBlue = 1
cas.factionNameBlue = "USA gnd "
cas.unitCounterRed = 1
cas.factionNameRed = "IRAN gnd "





----------------
----------------
--This section is the new completed functions, which work with any unit and delimiter


----------------
----------------



function cas.unitSpawner (text,pointVec3Gl) 
	
	local unitInfo = cvn.mysplit(text, cas.delimiter)
		

	if unitInfo[1] == "btank" then
					local unitName = cas.factionNameBlue .. cas.unitCounterBlue
								mist.dynAdd(
							{
								country = 'USA',
								category = 'vehicle',
								--name = unitName,
								units = 
								{
									[1] = 
									{
										x = pointVec3Gl.x,
										y = pointVec3Gl.z,
										type = 'M-1 Abrams',
										livery_id = "desert",
									},
								}, -- end of units
							} -- end of function
							)
			cas.unitCounterBlue = cas.unitCounterBlue + 1
		elseif unitInfo[1] == "barmy" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "barmy", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)			
				
	elseif unitInfo[1] == "bapc" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bapc", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bcar" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bcar", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "btopup" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "btopup", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "brover" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "brover", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
elseif unitInfo[1] == "bengine" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bengine", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "btruck" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "btruck", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "baaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "baaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bmanpad" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bmanpad", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "braaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "braaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bflak" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bflak", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "binf" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "binf", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "bmlrs" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bmlrs", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "barty" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "barty", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
				
			----- END OF BLUE REGULAR FORCES
				----- START OF RED REGULAR FORCES
				
				
				
				
	elseif unitInfo[1] == "rtank" then
					local unitName = cas.factionNameRed .. cas.unitCounterRed
								mist.dynAdd(
							{
								country = 'Iran',
								category = 'vehicle',
								--name = unitName,
								units = 
								{
									[1] = 
									{
										x = pointVec3Gl.x,
										y = pointVec3Gl.z,
										type = 'T-72B',
										livery_id = "desert",
									},
								}, -- end of units
							} -- end of function
							)
			cas.unitCounterRed = cas.unitCounterRed + 1
	elseif unitInfo[1] == "rapc" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rapc", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "rarmy" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rarmy", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "rmlrs" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rmlrs", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
		elseif unitInfo[1] == "rarty" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rarty", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
		elseif unitInfo[1] == "rscud" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rscud", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
				
	elseif unitInfo[1] == "rcar" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rcar", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "rtruck" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rtruck", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "raaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "raaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "rmanpad" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rmanpad", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "rraaa" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rraaa", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "rflak" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rflak", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
	elseif unitInfo[1] == "rinf" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rinf", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)

	----- END OF RED REGULAR FORCES		
			----- START OF BLUE SAM SITES
			
	elseif unitInfo[1] == "bpatriot" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bpatriot", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)		
	elseif unitInfo[1] == "bhawk" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "bhawk", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)

			----- END OF BLUE SAM SITES		
			----- START OF RED SAM SITES		
	elseif unitInfo[1] == "rsatwo" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rsatwo", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)
								
	elseif unitInfo[1] == "rsasix" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rsasix", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "rsaten" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rsaten", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "rsaeleven" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rsaeleven", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
				mist.teleportToPoint(fightSpawn)	
	elseif unitInfo[1] == "rsarapier" then
				local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "rsarapier", 
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
		 
			if unitInfo[2] == nil then
				trigger.action.explosion(pointVec3, 1)
				trigger.action.effectSmokeBig(pointVec3, 5, 0)
			elseif unitInfo[2] == "bomb" then
				trigger.action.explosion(pointVec3, 1)
			else
				trigger.action.effectSmokeBig(pointVec3, 5, 0)
			end

	
end

function cas.smoke (text,pointVec3Gl)

	local unitInfo = cvn.mysplit(text, cas.delimiter)
		 
			if unitInfo[3] == nil then
				trigger.action.smoke(pointVec3Gl,2)
			elseif unitInfo[3] == "g" then
				trigger.action.smoke(pointVec3Gl,0)
			elseif unitInfo[3] == "r" then
				trigger.action.smoke(pointVec3Gl,1)
			elseif unitInfo[3] == "w" then
				trigger.action.smoke(pointVec3Gl,2)
			elseif unitInfo[3] == "o" then
				trigger.action.smoke(pointVec3Gl,3)
			elseif unitInfo[3] == "b" then
				trigger.action.smoke(pointVec3Gl,4)
			else
				trigger.action.smoke(pointVec3Gl,2)
			end

end 

function cas.remove(text,pointVec3)

	local unitInfo = cvn.mysplit(text, cas.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
	
			
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


