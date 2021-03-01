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
cas.unitName = "USA gnd 1"
radio = {}

function cas.radio ()

end 

function cas.unitSpawner (pointVec3Gl)
		local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "fighttest", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(fightSpawn)
			 --cas.newGndSpawn()
end 

function cas.unitSpawnerRed (pointVec3Gl)
		local fightSpawn = 
				 {
				 groupId = mist.getNextGroupId(),
				 groupName = "fighttestred", 
				 point = pointVec3Gl, 
				 action = 'clone',
				 }	
			 mist.teleportToPoint(fightSpawn)
			 --cas.newGndSpawn()
end 


function cas.unitMover (pointVec3Gl)		
	local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
    local controller = group:getController()
	controller:resetTask()
	--Controller.resetTask(Controller self) 
	
	
	-- local _groupVec3 = Group.getByName(cas.unitName):getUnit(1):getPoint() 
	-- local path = {} --build the waypoint to, from for the unit
	-- path[#path + 1] = mist.ground.buildWP (_groupVec3, nil, 1)
    -- path[#path + 1] = mist.ground.buildWP (pointVec3Gl, nil, 1) 
    -- mist.goRoute(cas.unitName, path)
	 vars = 
 {
 group = group, 
 point = pointVec3Gl,
 }
 mist.groupToRandomPoint(vars )
		
end 

function cas.unitDetector (pointVec3Gl)

end 

function cas.unitShooter (vec2)
	local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
    local controller = group:getController()

    local fireTask = { 
        id = 'FireAtPoint', 
        params = {
        point = vec2,
        radius = 100,
        expendQty = 5,
        expendQtyEnabled = true, 
        }
    }
    controller:setTask(fireTask)
end 

function cas.unitHoldFire ()
		local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
		local con = group:getController()	
		con:setOption(0, 4) --hold fire
end 

function cas.unitFire ()
		local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
		local con = group:getController()	
		con:setOption(0, 2) -- fire
end 

function cas.unitExploder (pointVec3Gl)
	trigger.action.explosion(pointVec3Gl, 1)
	
end 

function cas.unitSmoker (pointVec3Gl)
	trigger.action.effectSmokeBig(pointVec3Gl, 5, 0)
end 

function cas.unitImmortal ()
		local group = Group.getByName(cas.unitName)                            --User provides rounds, ammo
		local controller = group:getController()
    local setImmortal = { id = 'SetImmortal', params = {value = true}}
    controller:setCommand(setImmortal)
end 


function cas.unitBurning (pointVec3Gl)
 -- local smokeFire = 
	 -- {
		 -- type = "Big smoke", 
		 -- country = "USA", 
		 -- category = "Effects", 
		 -- x = pointVec3Gl.x, 
		 -- y = pointVec3Gl.z,
		 -- name = "SmokeSmallFire", 
		 -- groupId = mist.getNextGroupId(), 
		 -- clone = false, 
		 -- dead = false, 
		 -- heading = 0,
	 -- }
	timer.scheduleFunction(cas.unitExploder,pointVec3Gl, timer.getTime() + 10)
	timer.scheduleFunction(cas.unitSmoker,pointVec3Gl, timer.getTime() + 10)
end 

function cas.unitSmoke (pointVec3Gl)
	trigger.action.smoke(pointVec3Gl,3)
end 

function cas.unitDestroyer (pointVec3Gl)

end 

		--this sectoin should be kept if using CYC_MissionPlan.lua
function plan.eventHandler (event) 
	if (26 == event.id) then
				if string.find (event.text, "`blue`") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					 cas.unitSpawner(pointVec3)
				elseif string.find (event.text, "`red`") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					cas.unitSpawnerRed(pointVec3) 
				--end of section onCallCAS
				
				elseif string.find (event.text, "`fire`") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					 cas.unitBurning(pointVec3)
				elseif string.find (event.text, "`shoot`") then 
					cas.unitShooter(mist.utils.makeVec2(event.pos))
				elseif string.find (event.text, "`move`") then 
					cas.unitMover(event.pos) 
				elseif string.find (event.text, "`hold`") then 
					cas.unitHoldFire() 
				elseif string.find (event.text, "`fire`") then 
					cas.unitFire()
				elseif string.find (event.text, "`inv`") then 
					cas.unitImmortal()
				elseif string.find (event.text, "`smoke`") then 
					cas.unitSmoke(event.pos)
				end
	end
end

function radio.playVoice(event)
	
	
		if (26 == event.id) then
				if string.find (event.text, "#") then
					radioMessage = event.text:sub(2)
					STTS.TextToSpeech(radioMessage,"264","AM","1.0","SRS",2)
				end
	end
	
	
	
end

do
	mist.addEventHandler(plan.eventHandler)
	mist.addEventHandler(radio.playVoice)
end
