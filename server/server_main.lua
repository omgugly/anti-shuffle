RegisterCommand('antishuffle', function(source, args, rawCommand)
    local _source = source
	TriggerClientEvent('omgugly:toggleShuffle', _source)
end)

RegisterCommand('entryslide', function(source, args, rawCommand)
    local _source = source
	TriggerClientEvent('omgugly:toggleSlide', _source)
end)
