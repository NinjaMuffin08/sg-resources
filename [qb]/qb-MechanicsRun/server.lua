local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('MechanicsRun:GetTriggers', function(source, cb)
	cb(Triggers)
end)

if Config.UseCommand and Config.UseCommand ~= '' then
    RegisterCommand(Config.UseCommand, function(source, args, user)
        local _source = source
        TriggerClientEvent('MechanicsRun:startRun',_source)
    end)
end

if Config.UseItem and Config.UseItem ~= '' then
    QBCore.Functions.CreateUseableItem(Config.UseItem, function(source)
        TriggerClientEvent('MechanicsRun:startRun',source)
    end)
end
RegisterServerEvent('MechanicsRun:GiveMoney')
AddEventHandler('MechanicsRun:GiveMoney',function(amount)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Name = "Mechanics"

    if xPlayer ~= nil then
        xPlayer.Functions.AddMoney('cash', amount)
        if Config.Webhook ~= nil then
            if Config.Webhook ~= "" and Config.Webhook ~= false then
                TriggerEvent('qb-log:server:CreateLog', "Mechanics", Name, 65280, xPlayer.PlayerData.name.." "..Config.Translation[Config.Language]["Webhook"]..amount.." "..Config.currency)
            end
        end
        if Config.JobMoney and Config.JobMoney > 0 then
            exports['qb-management']:AddMoney(Config.JobRequire, amount)
        end
    end
end)