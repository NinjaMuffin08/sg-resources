QBCore = nil

local QBCore = exports['qb-core']:GetCoreObject()

-- Oxy Run
RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money.cash >= Config.StartOxyPayment then
		Player.Functions.RemoveMoney('cash', Config.StartOxyPayment)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money to start an oxy run")
	end
end)

RegisterServerEvent('oxydelivery:receivemoney-bands')
AddEventHandler('oxydelivery:receivemoney-bands', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	TriggerClientEvent('QBCore:Notify', src, "You were handed $ "..Config.BandsPayment)
	--TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment, length = 10000})
	Player.Functions.RemoveItem('bands', 10)
	Player.Functions.AddMoney('cash',Config.BandsPayment)
end)

RegisterServerEvent('oxydelivery:receivemoney-nobands')
AddEventHandler('oxydelivery:receivemoney-nobands', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	TriggerClientEvent('QBCore:Notify', src, "You were handed $ "..Config.NoBandsPayment)
	--TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment, length = 10000})
	Player.Functions.AddMoney('cash', Config.NoBandsPayment)
end)

QBCore.Functions.CreateCallback('qb-oxyrun:server:HasItem', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("bands")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)