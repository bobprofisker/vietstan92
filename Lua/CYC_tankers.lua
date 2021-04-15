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
    1. racetrack between two fuel waypoints
]]--
--Pre reqs for the CYC_MissionPlan.lua function

--tanker groups must be named Tanker 1    2,3,4,5,6 etc to function 
--radio frequency should be 253 MHz and tacan will go up from 10Y to 10+x Y

tanker = {}
tanker.delimiter = "."
tanker.oneName = "probeone" --can't have numerical values in for some reason
tanker.twoName = "probetwo" --can't have numerical values in for some reason
tanker.threeName = "boomone" --can't have numerical values in for some reason
tanker.fourName = "boomtwo" --can't have numerical values in for some reason

function tanker.mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end



function notify(message, displayFor) --activiy notify function
    trigger.action.outText(message, displayFor)
end

function tanker.orbitPoint(pointVec3,text)

	local unitInfo = tanker.mysplit(text, tanker.delimiter)
	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then		
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()
		controller:resetTask()
		-- 3rd value is height 
			--if 3rd nil default
		if unitInfo[3] == nil then
			unitInfo[3] = 4572
		elseif tonumber(unitInfo[3]) then
			unitInfo[3] = math.floor(unitInfo[3]*0.3048)
			--then do nothing as this is a valid number
		else 
			unitInfo[3] = 4572
		end

		local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = mist.utils.makeVec2(pointVec3),
						   altitude = unitInfo[3],
								} 
							}	

		--Group.getByName(name):getController():popTask()--push/pop task is the other one
		controller:pushTask(orbit)--push/pop task is the other one


			Tanker = { 
			  id = 'Tanker', 
			  params = { 
						} 
						}
		controller:pushTask(Tanker)
		
			if unitInfo[1] == tanker.oneName then	
				notify("Arco 1 relocating  260 MHz (Chan 7 or 19)",30)
				notify("Arco 1 Drogue. Tacan on 10 X (PBT).",30)
			elseif unitInfo[1] == tanker.twoName then
					notify("Arco 2 relocating  260 MHz (Chan 7 or 19)",30)
					notify("Arco 2 Drogue. Tacan on 20 X (CVN).",30)
			elseif unitInfo[1] == tanker.threeName then
					notify("Shell  3 relocating  260 MHz (Chan 7 or 19)",30)
					notify("Shell 3 Boom. Tacan on 30 X (BMT).",30)
			elseif unitInfo[1] == tanker.fourName then
					notify("Shell  4 relocating  260 MHz (Chan 7 or 19)",30)
					notify("Shell 4 Boom. Tacan on 40 X (INC).",30)
			else
			end
		
	end
end 




function tanker.eventHandler (event) 
	if (26 == event.id) then
		--CYC_carrier.lua START of SECTION this sectoin should be kept if using CYC_carrier.lua
			if string.find (event.text, tanker.delimiter .. "fuel") then 
					local pointVec3 = mist.utils.makeVec3GL(event.pos)
					tanker.orbitPoint(pointVec3,event.text)  
		end
	end
end

do
	mist.addEventHandler(tanker.eventHandler)
end --