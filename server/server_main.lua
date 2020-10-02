Citizen.CreateThread(function()
	RegisterCommand('antishuffle', function(source, args, rawCommand)
		local _source = source
		TriggerClientEvent('omgugly:toggleShuffle', _source)
	end)

	RegisterCommand('entryslide', function(source, args, rawCommand)
		local _source = source
		TriggerClientEvent('omgugly:toggleSlide', _source)
	end)
	
	if (enableSeatCommand) then
		RegisterCommand('seat', function(source, args, rawCommand)
			local _source = source
			TriggerClientEvent('omgugly:seat', _source, args[1])
		end)
	end
end)
