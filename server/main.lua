local QBCore  = exports['qb-core']:GetCoreObject()
local Players = {}

-- Make the spy camera item usable
QBCore.Functions.CreateUseableItem(Config.SpycamItem, function(source, item)
    if Players[source] then
        if Players[source] == Config.MaxCameras then
            return QBCore.Functions.Notify(source, Lang:t('errors.placed'), "error", 7500)
        end
    end

    TriggerClientEvent('spycams:client:place', source)
end)

-- Make the spy camera tablet item usable
QBCore.Functions.CreateUseableItem(Config.ControlItem, function(source, item)
    if Players[source] == 0 then
        return QBCore.Functions.Notify(source, Lang:t('errors.missing'), "error", 7500)
    end

    TriggerClientEvent('spycams:client:connect', source)
end)

-- Check player is allowed to place the spy camera
QBCore.Functions.CreateCallback('spycams:server:canPlace' , function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    cb(not Players[source] or (Players[source] and Players[source] < Config.MaxCameras))
end)

RegisterNetEvent('spycams:server:placed', function()
    local playerId = source
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end

    if not Players[playerId] then
        Players[playerId] = 0
    else
        if Players[playerId] == Config.MaxCameras then return end
    end

    if Player.Functions.RemoveItem(Config.SpycamItem, 1) then
        Players[playerId] = Players[playerId] + 1
        TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items[Config.SpycamItem], 'remove', 1)
    end
end)

RegisterNetEvent('spycams:server:removed', function(destroyed)
    local playerId = source
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end
    if not Players[playerId] then return end

    if destroyed then
        if Players[playerId] > 0 then
            Players[playerId] = Players[playerId] - 1
        end
    else
        if Player.Functions.AddItem(Config.SpycamItem, 1) then
            Players[playerId] = Players[playerId] - 1
            TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items[Config.SpycamItem], 'add', 1)
        end
    end
end)

RegisterNetEvent('spycams:server:destroyed', function(coords)
    TriggerClientEvent('spycams:client:destroyed', -1, coords)
end)