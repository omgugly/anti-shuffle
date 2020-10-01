local exemptTasks				= {2, 160, 197, 470}	--	CTaskExitVehicle, CTaskEnterVehicle, CTaskSetPedInVehicle, CTaskVehiclePassengerExit
local exemptKeys				= {21}		--	Left-Shift (hold it down to temporarily allow swapping seats from passenger to driver)
local stopPassengerShuffle		= true		--	Stop passenger shuffling to driver seat when driver seat is empty

RegisterNetEvent('omgugly:toggleShuffle')
AddEventHandler('omgugly:toggleShuffle', function()
	stopPassengerShuffle = not stopPassengerShuffle
end)

function areExemptKeysReleased()
	local keys = 0
	for i = 1, #exemptKeys do
		if (IsControlReleased(0, exemptKeys[i])) and (IsInputDisabled(2)) and (not isDead) then keys = keys + 1 end
	end
	if (keys == #exemptKeys) then return true
	else return false end
end

function getPedSeat(p, v)
	local seats = GetVehicleModelNumberOfSeats(v)
	for i = -1, seats do
		local t = GetPedInVehicleSeat(v, i)
		if (t == p) then return i end
	end
	return -2
end

function isTaskExempt(p)
	for i = 1, #exemptTasks do
		if (GetIsTaskActive(p, exemptTasks[i])) then return true end
	end
	return false
end

Citizen.CreateThread(function()
	while true do
		local player = PlayerPedId()
		if (IsPedInAnyVehicle(player, false)) then
			if (stopPassengerShuffle) then
				local v = GetVehiclePedIsIn(player, 0)
				if (getPedSeat(player, v) == 0) then
					if (isTaskExempt(player)) then SetPedConfigFlag(player, 184, false) goto ignoreTask end
					if (areExemptKeysReleased()) then
						SetPedConfigFlag(player, 184, true)
					else
						if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
					end
					::ignoreTask::
				end
			else
				if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
			end
		else
			if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
		end
		Citizen.Wait(0)
	end
end)