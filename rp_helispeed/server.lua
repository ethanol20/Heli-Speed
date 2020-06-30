RegisterServerEvent('SyncSpeed')
AddEventHandler('SyncSpeed', function(id, speed)
	TriggerClientEvent('SyncClient', -1, id, speed)
end)

