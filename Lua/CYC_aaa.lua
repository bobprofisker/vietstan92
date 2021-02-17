    --  Name:                           CYC_aaa.lua
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\username\\Saved Games\\DCS.openbeta\\Missions\\In dev\\t45\\Lua\\ACT_loadModules.lua'))()
    --  Dependencies:                   Mist.lua, CYC_do.lua
    --  Description:
    --      Carrier function that allows you to drive the carrier around the map via marks on the F10 map
	--		Also plays sound files to the units for deck and helps provide carrier info and recovery / launch times
    --  Usage:
    --      1. You need to load all of the sound files into the mission with the correct names to ensure they actually play
	-- 		2. You need to create the carrier and name it exactly as below, set freq, tacan and ICLS as below as well (or edit)
--[[List of outstanding work to do
   --loop creation 
	
	
	--Pre requisites
	A bunch of things are needed in the mission editor for this to work

		 AAA-N

		 AAA-S

		 AAA-E
			
		 AAA-W

		 AAA-NE

		 AAA-SE

		 AAA-SW

		 AAA-NW
		 
		 --all AAA units are a Zu23 facing in that heading and a truck behind it, normally russian
		 
		 EAAA-1 
		 --this is a tall building, the static water tower the reason for this is to spawn the guy high up at an angle 
		 
		 TAAA-1
		 --this is a unit to be shot at, i.e. bog standard M4 infantry dude works best MUST be opposite coalition to the guns so typically USA
		 
		 --zones
		 a zone called 
		 
		 flakZone
		 
		 must exist

]]--


	

-- Declaration
aaa = {}

function notify(message, displayFor) --activiy notify function
    trigger.action.outText(message, displayFor)
end

notify("CYC_aaa loaded",2)

function aaa.createAAAzone()
	
	for tName, tData in pairs(mist.DBs.zonesByName) do
		if string.find(tData.name, 'flakZone') then
		
		for i = 1, 20 do
		local zone = trigger.misc.getZone(tData.name)
		local newAAAsite = mist.getRandPointInCircle(zone.point, zone.radius)
		newAAAsite = mist.utils.makeVec3GL(newAAAsite)
		aaa.groundAttack(newAAAsite)
	end
		
		
		end
	end


end


function aaa.groundAttack(pointVec3) -- spawn in a AAA site that will fire into the air randomly
if mist.isTerrainValid(pointVec3 , {"Land",}) == true then
	local direction = math.random(1,8) -- value 1-8 for each point in the compass, N E S W NE SE SW NW
	local unitX = 0
	local unitY = 0
	if (direction == 1) then --works
		getGroupName = "AAA-N"
		addX = 10
		addY = 0
		unitX = -3
	elseif (direction == 2) then -- works
		getGroupName = "AAA-S"
		addX = -10
		addY = 0
		unitX = 3
	elseif (direction == 3) then --works
		getGroupName = "AAA-E"
		addX = 0
		addY = 15
		unitX = 0
		unitY = -3.5
	elseif (direction == 4) then --works
		getGroupName = "AAA-W"
		addX = 0
		addY = -15
		unitX = 0
		unitY = 3.2		
	elseif (direction == 5) then --works
		getGroupName = "AAA-NE"
		addX = 10
		addY = 10
		unitX = -2.3
		unitY = -2.3
	elseif (direction == 6) then --works
		getGroupName = "AAA-SE"
		addX = -10
		addY = 10
		unitX = 2.1
		unitY = -2.10	
	elseif (direction == 7) then --works
		getGroupName = "AAA-SW"
		addX = -10
		addY = -10
		unitX = 2
		unitY = 2		
	elseif (direction == 8) then
		getGroupName = "AAA-NW"
		addX = 10
		addY = -10
		unitX = -2
		unitY = 2	
	else -- if somehow all this fails fire out to sea West
		getGroupName = "AAA-W"
		addX = 0
		addY = -10
		unitY = 3			
	end
	
	local EAAA = pointVec3
	
	local varsAAA = 
		 {
		 groupId = mist.getNextGroupId(),
		 groupName = getGroupName, 
		 point = EAAA, 
		 action = 'clone',
		 }
		
		 mist.teleportToPoint(varsAAA)
	
	EAAA.x = pointVec3.x + addX
	EAAA.z = pointVec3.z + addY
	
	--RUSSIA gnd x(odd)
	
	local varsEAAA = 
		 {
		 groupId = mist.getNextGroupId(),
		 groupName = "EAAA-1", 
		 point = EAAA,
		 action = 'clone',
		 }
		 
	mist.teleportToPoint(varsEAAA)
	--USA gnd x
	TAAA = EAAA
	TAAA.x = EAAA.x + unitX	
	TAAA.z = EAAA.z + unitY
	
	local varsTAAA = 
		 {
		 groupId = mist.getNextGroupId(),
		 groupName = "TAAA-1", 
		 point = TAAA, 
		 action = 'clone',
		 }
		 
	local target = mist.teleportToPoint(varsTAAA)
	aaa.imortal(target)

	end
end


--randomise the heading of the spawned unit for one of 8 directions 
--work out where to spawn this unit 

function aaa.imortal(target)
	--local targetID = Group.getByName("USA gnd 2"):getUnit(1):getID()
	group = Group.getByName(target["name"])
    local controller = group:getController()
    local setImmortal = { id = 'SetImmortal', params = {value = true}}
    controller:setCommand(setImmortal)
    controller:setOption(0, 4) --hold fire
end
