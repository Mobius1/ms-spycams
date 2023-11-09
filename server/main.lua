local QBCore  = exports['qb-core']:GetCoreObject()
local Spycams = {}

function SendLog(playerName, citizenid, coords, uuid)
    local time = os.date("%A %d %B %Y at %H:%M")
    local content = (">>> `%s (%s)` placed a spycam at `%.4f, %.4f, %.4f` with id `%s`"):format(playerName, citizenid, coords.x, coords.y, coords.z, uuid)

    PerformHttpRequest(Config.Hook, function(err, text, headers)
        if Config.Debug then
            QBCore.ShowSuccess(GetCurrentResourceName(), ("^2%s (%s) ^7placed a spycam at ^2%.4f, %.4f, %.4f ^7with id ^2%s^7"):format(playerName, citizenid, coords.x, coords.y, coords.z, uuid))
        end
    end, 'POST', json.encode({
        username = 'Spycams',
        content = content
    }), { ['Content-Type'] = 'application/json' })
end

-- Make the spy camera item usable
QBCore.Functions.CreateUseableItem(Config.SpycamItem, function(source, item)
    if Spycams[source] then
        if Spycams[source] == Config.MaxCameras then
            return QBCore.Functions.Notify(source, Lang:t('errors.placed'), "error", 7500)
        end
    end

    TriggerClientEvent('spycams:client:place', source)
end)

-- Make the spy camera tablet item usable
QBCore.Functions.CreateUseableItem(Config.ControlItem, function(source, item)
    if Spycams[source] == 0 then
        return QBCore.Functions.Notify(source, Lang:t('errors.missing'), "error", 7500)
    end

    TriggerClientEvent('spycams:client:connect', source)
end)

QBCore.Functions.CreateCallback('spycams:server:getPlayerSpycams' , function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local PlayerData = Player.PlayerData

    local cams = MySQL.query.await('SELECT uuid, coords, rotation FROM `spycams` WHERE `citizenid` = ?', {
        PlayerData.citizenid
    })
     
    if cams then
        if not Spycams[source] then
            Spycams[source] = 0
        end

        local data = {}

        for i = 1, #cams do
            local cam = cams[i]
            local coords = json.decode(cam.coords)
            local rotation = json.decode(cam.rotation)

            cam.coords = vec3(coords.x, coords.y, coords.z)
            cam.rotation = vec3(rotation.x, rotation.y, rotation.z)

            Spycams[source] = Spycams[source] + 1
        end

        cb(cams)
        return
    end

    cb(false)
end)

-- Check player is allowed to place the spy camera
QBCore.Functions.CreateCallback('spycams:server:canPlace' , function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    cb(not Spycams[source] or (Spycams[source] and Spycams[source] < Config.MaxCameras))
end)

RegisterNetEvent('spycams:server:placed', function(uuid, coords, rotation, onFloor)
    local playerId = source
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end

    if not Spycams[playerId] then
        Spycams[playerId] = 0
    else
        if Spycams[playerId] == Config.MaxCameras then return end
    end

    if Player.Functions.RemoveItem(Config.SpycamItem, 1) then
        local PlayerData = Player.PlayerData

        Spycams[playerId] = Spycams[playerId] + 1
        TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items[Config.SpycamItem], 'remove', 1)

        local pos = ("{\"x\":%.8f,\"y\":%.8f,\"z\":%.8f}"):format(coords.x, coords.y, coords.z)
        local rot = ("{\"x\":%.8f,\"y\":%.8f,\"z\":%.8f}"):format(rotation.x, rotation.y, rotation.z)

        MySQL.insert.await('INSERT INTO `spycams` (citizenid, uuid, coords, rotation) VALUES (?, ?, ?, ?)', {
            PlayerData.citizenid, uuid, pos, rot
        })   
        
        TriggerClientEvent('spycams:client:placed', -1, playerId, uuid, coords, rotation)

        if string.len(Config.Hook) > 0 then
            SendLog(GetPlayerName(playerId), PlayerData.citizenid, coords, uuid)
        end
    end
end)

RegisterNetEvent('spycams:server:removed', function(uuid, destroyed)
    local playerId = source
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end
    if not Spycams[playerId] then return end

    if destroyed then
        if Spycams[playerId] > 0 then
            Spycams[playerId] = Spycams[playerId] - 1
        end
    else
        if Player.Functions.AddItem(Config.SpycamItem, 1) then
            Spycams[playerId] = Spycams[playerId] - 1
            TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items[Config.SpycamItem], 'add', 1)
        end
    end

    TriggerClientEvent('spycams:client:remove', -1, playerId, uuid)

    MySQL.single.await('DELETE FROM spycams WHERE uuid = ?', { uuid })
end)

RegisterNetEvent('spycams:server:destroyed', function(uuid, coords)
    TriggerClientEvent('spycams:client:destroyed', -1, uuid, coords)
end)