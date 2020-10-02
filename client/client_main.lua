Citizen.CreateThread(function()
	RegisterNetEvent('omgugly:toggleShuffle')
	AddEventHandler('omgugly:toggleShuffle', function()
		stopPassengerShuffle = not stopPassengerShuffle
		TriggerEvent('chat:addMessage', {
			color = {63, 63, 255},
			multiline = true,
			args = {"Anti-Shuffle", (function() if (stopPassengerShuffle) then return "Enabled; preventing seat shuffle" else return "Disabled; allowing seat shuffle" end end)()}
		})
	end)

	RegisterNetEvent('omgugly:toggleSlide')
	AddEventHandler('omgugly:toggleSlide', function()
		allowEntrySlide = not allowEntrySlide
		TriggerEvent('chat:addMessage', {
			color = {63, 63, 255},
			multiline = true,
			args = {"Entry-Slide", (function() if (allowEntrySlide) then return "Enabled; allowing entry slide" else return "Disabled; preventing entry slide" end end)()}
		})
	end)
	
	if (enableSeatCommand) then
		RegisterNetEvent('omgugly:seat')
		AddEventHandler('omgugly:seat', function(seat)
			seat = tonumber(seat) - 2 or 0
			local player, v = PlayerPedId(), 0
			if (seat < -1) then TriggerEvent('chat:addMessage', {
				color = {63, 63, 255},
				multiline = true,
				args = {"Seat", "Invalid seat number"}
			}) goto complete end
			if (IsPedInAnyVehicle(player, 1)) then
				v = GetVehiclePedIsIn(player, 0)
				if (seat == getPedSeat(player, v)) then TriggerEvent('chat:addMessage', {
					color = {63, 63, 255},
					multiline = true,
					args = {"Seat", "You are already in that seat"}
				}) goto complete end
				if not (AreAnyVehicleSeatsFree(v)) then goto noseat end
				if (seat <= (GetVehicleModelNumberOfSeats(GetEntityModel(v)) - 2)) then
					if (IsVehicleSeatFree(v, seat)) then
						SetPedIntoVehicle(player, v, seat)
						goto complete
					else goto fullseat end
				else TriggerEvent('chat:addMessage', {
					color = {63, 63, 255},
					multiline = true,
					args = {"Seat", "Invalid seat number"}
				}) end
				goto complete
				::fullseat::
				TriggerEvent('chat:addMessage', {
					color = {63, 63, 255},
					multiline = true,
					args = {"Seat", "That seat is occupied"}
				})
				goto complete
				::noseat::
				TriggerEvent('chat:addMessage', {
					color = {63, 63, 255},
					multiline = true,
					args = {"Seat", "There are no free seats"}
				})
				goto complete
			else
				TriggerEvent('chat:addMessage', {
					color = {63, 63, 255},
					multiline = true,
					args = {"Seat", "You are not in a vehicle"}
				})
			end
			::complete::
		end)
	end
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

Citizen.CreateThread(function()
	while true do
		local player = PlayerPedId()
		if (stopPassengerShuffle) then
			if (not GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, true) end
			if (IsPedInAnyVehicle(player, false)) then
				local v = GetVehiclePedIsIn(player, 0)
				if (getPedSeat(player, v) == 0) then
					if (not areExemptKeysReleased()) then
						if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
					end
				end
				if (GetIsTaskActive(player, 165)) and (not allowEntrySlide) then
					if (GetSeatPedIsTryingToEnter(player) == -1) then
						if (GetPedConfigFlag(player, 184, 1)) then
							SetPedIntoVehicle(player, v, 0)
							SetVehicleCloseDoorDeferedAction(v, 0)
						end
					end
				end
			end
		else
			if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
		end
		Citizen.Wait(0)
	end
end)
