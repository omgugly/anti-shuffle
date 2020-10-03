Citizen.CreateThread(function()
	RegisterCommand('antishuffle', function(source, rawCommand)
		TriggerClientEvent('omgugly:toggleShuffle', source)
	end)

	RegisterCommand('entryslide', function(source, rawCommand)
		TriggerClientEvent('omgugly:toggleSlide', source)
	end)
	
	if (enableSeatCommand) then
		RegisterCommand('seat', function(source, rawCommand)
			TriggerClientEvent('omgugly:seat', source)
		end)
	end
end)
