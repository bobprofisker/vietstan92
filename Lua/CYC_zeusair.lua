


--helicopters land for x amount of time or forever
--air unit move waypoint -- speed -- alt 
--air unit hover 
--air unit weapons free, return fire, hold fire
--air unit follow, left, right, behind



--depends on CYC_zeus.lua


air = {}
air.unitCounterRed = 1
air.unitCounterBlue = 1
air.factionNameRed = "r"
air.factionNameBlue = "b"
air.delimiter = "."

function air.mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function air.unitSpawner (text,pointVec3Gl) 

			local unitInfo = cvn.mysplit(text, air.delimiter)
			
		if unitInfo[1] == "rafag" then
							local unitName = air.factionNameRed .. "a" .. air.unitCounterRed
										mist.dynAdd(
									{
										country = 'Iran',
										category = 'airplane',
										--name = unitName,
										groupName = unitName,
										units = 
										{
											[1] = 
											{
												["alt"] = 5000,
												["alt_type"] = "BARO",
												["livery_id"] = "IRIAF Sand-Blue",
												["skill"] = "Random",
												["speed"] = 138.88888888889,
												["type"] = "MiG-29A",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												["payload"] = 
												{
																		["pylons"] = 
																{
																	[1] = 
																	{
																		["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
																	}, -- end of [1]
																	[2] = 
																	{
																		["CLSID"] = "{35B698AC-9FEF-4EC4-AD29-484A0085F62B}",
																	}, -- end of [2]
																	[3] = 
																	{
																		["CLSID"] = "{C0FF4842-FBAC-11d5-9190-00A0249B6F00}",
																	}, -- end of [3]
																	[4] = 
																	{
																		["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
																	}, -- end of [4]
																	[5] = 
																	{
																		["CLSID"] = "{C0FF4842-FBAC-11d5-9190-00A0249B6F00}",
																	}, -- end of [5]
																	[6] = 
																	{
																		["CLSID"] = "{35B698AC-9FEF-4EC4-AD29-484A0085F62B}",
																	}, -- end of [6]
																	[7] = 
																	{
																		["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
																	}, -- end of [7]
																}, -- end of ["pylons"]
													["fuel"] = "3376",
													["flare"] = 30,
													["chaff"] = 30,
													["gun"] = 100,
												}, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 8,
													[2] = 9,
													[3] = 1,
													["name"] = "Pontiac91",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)
		air.unitCounterRed = air.unitCounterRed + 1
		
	
		elseif unitInfo[1] == "rafaa" then
			local unitName = air.factionNameRed .. "a" .. air.unitCounterRed
										mist.dynAdd(
									{
										country = 'Iran',
										category = 'airplane',
										--name = unitName,
										groupName = unitName,
										units = 
										{
											[1] = 
											{
												["alt"] = 5000,
												["alt_type"] = "BARO",
												["livery_id"] = "IRIAF Sand-Blue",
												["skill"] = "Random",
												["speed"] = 138.88888888889,
												["type"] = "MiG-29A",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												["payload"] = 
												{
													["pylons"] = 
													{
														[1] = 
														{
															["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
														}, -- end of [1]
														[3] = 
														{
															["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
														}, -- end of [3]
														[4] = 
														{
															["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
														}, -- end of [4]
														[5] = 
														{
															["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
														}, -- end of [5]
														[7] = 
														{
															["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
														}, -- end of [7]
													}, -- end of ["pylons"]
													["fuel"] = "3376",
													["flare"] = 30,
													["chaff"] = 30,
													["gun"] = 100,
												}, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 8,
													[2] = 9,
													[3] = 1,
													["name"] = "Pontiac91",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)
		air.unitCounterRed = air.unitCounterRed + 1
		
	elseif unitInfo[1] == "buh60" then
			local unitName = air.factionNameBlue .. "a" .. air.unitCounterBlue
												mist.dynAdd(
									{
										country = 'USA',
										category = 'helicopter',
										groupName = unitName,
										--name = unitName,
										
										units = 
										{
											[1] = 
											{
												["alt"] = 1,
												["alt_type"] = "RALT",
												["livery_id"] = "standard",
												["skill"] = "Random",
												["speed"] = 0,
												["type"] = "UH-60A",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												["payload"] = 
														{
															["pylons"] = 
															{
															}, -- end of ["pylons"]
															["fuel"] = "1100",
															["flare"] = 30,
															["chaff"] = 30,
															["gun"] = 100,
														}, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 1,
													[2] = 1,
													[3] = 1,
													["name"] = "Enfield11",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)				
		air.unitCounterBlue = air.unitCounterBlue + 1
		
			elseif unitInfo[1] == "bah64" then
			local unitName = air.factionNameBlue .. "a" .. air.unitCounterBlue
												mist.dynAdd(
									{
										country = 'USA',
										category = 'helicopter',
										groupName = unitName,
										--name = unitName,
										
										units = 
										{
											[1] = 
											{
												["alt"] = 1,
												["alt_type"] = "RALT",
												["livery_id"] = "standard",
												["skill"] = "Random",
												["speed"] = 0,
												["type"] = "AH-64D",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												 ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "1157",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 1,
													[2] = 1,
													[3] = 1,
													["name"] = "Enfield11",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)				
		air.unitCounterBlue = air.unitCounterBlue + 1
		
	elseif unitInfo[1] == "bch47" then
			local unitName = air.factionNameBlue .. "a" .. air.unitCounterBlue
												mist.dynAdd(
									{
										country = 'UK',
										category = 'helicopter',
										groupName = unitName,
										--name = unitName,
										
										units = 
										{
											[1] = 
											{
												["alt"] = 1,
												["alt_type"] = "RALT",
												["livery_id"] = "ch-47_green uk",
												["skill"] = "Random",
												["speed"] = 0,
												["type"] = "CH-47D",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												                                         ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "3600",
                                            ["flare"] = 120,
                                            ["chaff"] = 120,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 1,
													[2] = 1,
													[3] = 1,
													["name"] = "Enfield11",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)				
		air.unitCounterBlue = air.unitCounterBlue + 1
		
		
		elseif unitInfo[1] == "bcvn" then
			local unitName = air.factionNameBlue .. "a" .. air.unitCounterBlue
												mist.dynAdd(
									{
										country = 'USA',
										category = 'ship',
										groupName = unitName,
										--name = unitName,
										
										units = 
										{
											[1] = 
											{
												["alt"] = 1,
												["alt_type"] = "RALT",
												["skill"] = "Random",
												["speed"] = 0,
												["type"] = "CVN_73",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												                                         ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "3600",
                                            ["flare"] = 120,
                                            ["chaff"] = 120,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 1,
													[2] = 1,
													[3] = 1,
													["name"] = "Enfield11",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)				
		air.unitCounterBlue = air.unitCounterBlue + 1
		elseif unitInfo[1] == "bb52" then
			local unitName = air.factionNameBlue .. "a" .. air.unitCounterBlue
												mist.dynAdd(
									{
										country = 'USA',
										category = 'airplane',
										groupName = unitName,
										--name = unitName,
										
										units = 
										{
											[1] = 
											{
												["alt"] = 4960,
												["alt_type"] = "RALT",
												["skill"] = "Random",
												["speed"] = 300,
												["type"] = "B-52H",
												["unitId"] = 1000,
												["x"] = pointVec3Gl.x,
												["name"] = unitName,
												["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
													--["CLSID"] = "{6C47D097-83FF-4FB2-9496-EAB36DDF0B05}", -- bombs
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    --["CLSID"] = "{6C47D097-83FF-4FB2-9496-EAB36DDF0B05}", -- bombs
													  ["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}", -- cruise missiles
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
													--["CLSID"] = "{6C47D097-83FF-4FB2-9496-EAB36DDF0B05}", -- bombs
                                                }, -- end of [3]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "141135",
                                            ["flare"] = 192,
                                            ["chaff"] = 1125,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
												["y"] = pointVec3Gl.z,
												["heading"] = 0,
												["callsign"] = 
												{
													[1] = 1,
													[2] = 1,
													[3] = 1,
													["name"] = "Enfield11",
												}, -- end of ["callsign"]
												["onboard_num"] = "9999",
											}, -- end of [1]
										},	
									} -- end of function
									)				
		air.unitCounterBlue = air.unitCounterBlue + 1	
		else
		end
end

function air.bombing (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
	
			
			-- --do some magic code to conv vec3gl to vec2
			local vec2 = mist.utils.makeVec2(pointVec3Gl)
			
			local group = Group.getByName(unitInfo[1])
	
			local target = {}
			target.point = vec2
			target.weaponType = 16 -- 16 is iron bombs
			target.expend = "All" --other options, "All" "Half" "Quarter" "Four" "Two" "One"
			target.attackQty = 1
			target.direction = 100
			target.directionEnabled = true			--enforces target direction to be used
			target.altitude = 500 --min altitude to not go below above ground level (may cause wonky flight and death if set too low)
			target.altitudeEnabled = true -- true if min altitude restrictoin to be enforced
			target.groupAttack = true -- only useful if more than one bomber, will attack together
			local cas = {id = 'Bombing', params = target} -- combine attack type and target for bombing

			local controller = group:getController()
			controller:setTask(cas)
	end

end

function air.refuel (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
			local vec2 = mist.utils.makeVec2(pointVec3Gl)
			
			local group = Group.getByName(unitInfo[1])
			
			Refueling = { 
						  id = 'Refueling', 
						  params = {} 
						}
			local controller = group:getController()
			controller:setTask(Refueling)

	end

end

function air.follow (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil or Group.getByName(unitInfo[3]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 or #Group.getByName(unitInfo[3]):getUnits() < 1 then
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()

					controller:resetTask()
						local groupFlw = Group.getByName(unitInfo[3]):getID()
				
				local position = {x= -150 , y= -5, z=-100}
				
				if unitInfo[4] == nil then 
				elseif unitInfo[4] == 'right' then 
					position = {x= 0 , y= -5, z=100}
				elseif unitInfo[4] == 'front' then 
					position = {x= 150 , y= -5, z=-100}
				elseif unitInfo[4] == 'left' then 
					position = {x= 0 , y= -5, z=-100}
				elseif unitInfo[4] == 'rear' then 
					position = {x= -100 , y= -5, z=0}
				end
				
					Follow = {
							  id = 'Follow',
							  params = {
								groupId = groupFlw,
								pos = position,  --x is x y is up and down or Z ( Z is left and right or y)
								lastWptIndexFlag = false,
								lastWptIndex = 1
							  }    
							}
				
				controller:setTask(Follow)
		
	end


end

function air.land (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()
			controller:resetTask()
		
		local duration = 9999999999999999999999999999
		if unitInfo[3] == nil or tonumber(unitInfo[3]) == false then
		elseif tonumber(unitInfo[3]) then
		duration = unitInfo[3]
		end

			Land = {
				  id= 'Land',
				  params = {
					point = {x = pointVec3Gl.x,y = pointVec3Gl.z},
					durationFlag = true,
					duration = duration
				  }
				}
				
				controller:setTask(Land)
		
	end


end

function air.hover (text, pointVec3Gl)


end

function air.airtoair (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil or Group.getByName(unitInfo[3]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 or #Group.getByName(unitInfo[3]):getUnits() < 1 then
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()

					controller:resetTask()
				local group2Attack = Group.getByName(unitInfo[3]):getID()
											
					AttackGroup = { 
					  id = 'AttackGroup', 
					  params = { 
						groupId = group2Attack,
					  } 
					}			
				
				controller:setTask(AttackGroup)
		
	end


end

function air.move (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()
		local speed = 51.4
		local alt = 304
		if unitInfo[3] == nil or tonumber(unitInfo[3]) == false then
		elseif tonumber(unitInfo[3]) then
			speed = math.floor(unitInfo[3]*0.514)
		end
		if unitInfo[4] == nil or tonumber(unitInfo[4]) == false then
		elseif tonumber(unitInfo[3]) then
			alt = math.floor(unitInfo[4]*0.3048)
		end
		
		--start point where they are
		local startPoint = mist.getLeadPos(Group.getByName(unitInfo[1]))
		--end point where the vec3 is
		local endPoint = mist.utils.makeVec2(pointVec3Gl)
		
		local path = {}
		path[#path + 1] = mist.heli.buildWP(startPoint, TurningPoint, speed, alt, 'agl') 
		path[#path + 1] = mist.heli.buildWP(endPoint, TurningPoint, speed, alt, 'agl') 
		mist.goRoute(group, path)
	end


end

function air.engageZoneGnd (text, pointVec3Gl)
	
	local unitInfo = air.mysplit(text, air.delimiter)
 	
	if Group.getByName(unitInfo[1]) == nil then
	elseif #Group.getByName(unitInfo[1]):getUnits() < 1 then
	else
		local group = Group.getByName(unitInfo[1])
		local controller = group:getController()
		
			if Group.getByName(unitInfo[3]) == nil then
			elseif #Group.getByName(unitInfo[3]):getUnits() < 1 then
			else
					local groupAttack = Group.getByName(unitInfo[3]):getID()
		
				EngageUnit = { 
				  id = 'EngageUnit', 
				  params = { 
					unitId = groupAttack, 
				  } 
				}


				controller:setTask(EngageUnit)
			end
		

	end


end



function air.eventHandler (event) 
	if (26 == event.id) then
			if string.find(event.text, air.delimiter .. "spawn") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.unitSpawner(event.text,pointVec3)
			elseif string.find(event.text, air.delimiter .. "atg") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.bombing(event.text,pointVec3)
			elseif string.find(event.text, air.delimiter .. "hvr") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.hover(event.text,pointVec3)	
			elseif string.find(event.text, air.delimiter .. "rfl") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.refuel(event.text,pointVec3)	
			elseif string.find(event.text, air.delimiter .. "flw") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.follow(event.text,pointVec3)	
			elseif string.find(event.text, air.delimiter .. "lnd") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.land(event.text,pointVec3)
			elseif string.find(event.text, air.delimiter .. "ata") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.airtoair(event.text,pointVec3)
			elseif string.find(event.text, air.delimiter .. "goto") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.move(event.text,pointVec3)
			elseif string.find(event.text, air.delimiter .. "eizg") then 
				local pointVec3 = mist.utils.makeVec3GL(event.pos)
				air.engageZoneGnd(event.text,pointVec3)
			end	
		end
end


do
	mist.addEventHandler(air.eventHandler)
end