    --  Name:                           CYC_tankers.lua
    --  Author:                         Tony
	-- assert(loadfile('C:\\Users\\hindsas\\Saved Games\\DCS.openbeta\\Missions\\Vietstan92\\Lua\\CYC_tank.lua'))()
    --  Dependencies:                   Mist.lua, CYC_do.lua
    --  Description:
    --      Allows you to tell refueling tankers to fly around and orbit in other pots
    --  Usage:
    --      1. Uncomment, or add, any .lua files you wish to run
    --      2. 
    --      3.
	
--[[List of outstanding work to do
    1. 
]]--
--Pre reqs for the CYC_MissionPlan.lua function

--tanker groups must be named Tanker 1    2,3,4,5,6 etc to function 
--radio frequency should be 253 MHz and tacan will go up from 10Y to 10+x Y

tanker = {}
tanker.name = "Tanker 1"

function notify(message, displayFor) --activiy notify function
    trigger.action.outText(message, displayFor)
end

function tanker.orbitPoint(pointVec3,name)

	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = mist.utils.makeVec2(pointVec3),
						   altitude = 4572, --15,000ft
								} 
							}	

		--Group.getByName(name):getController():popTask()--push/pop task is the other one
		Group.getByName(name):getController():pushTask(orbit)--push/pop task is the other one
		notify("Tanker relocating.",2)
			Tanker = { 
			  id = 'Tanker', 
			  params = { 
						} 
						}
	Group.getByName(name):getController():pushTask(Tanker)
end

function tanker.eventHandler (event) 
	if (26 == event.id) then
		--CYC_carrier.lua START of SECTION this sectoin should be kept if using CYC_carrier.lua
			if string.find (event.text, "fuel") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					tanker.orbitPoint(pointVec3,"Tanker 1")  
		end
	end
end

do
	mist.addEventHandler(tanker.eventHandler)
end --