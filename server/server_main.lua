RegisterCommand('antishuffle', function(source, args, rawCommand)
    local _source = source
	TriggerClientEvent('omgugly:toggleShuffle', _source, args)
end)
