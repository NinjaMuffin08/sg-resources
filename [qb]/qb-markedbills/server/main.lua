QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["markedbills"] = math.random(1, 1),
}


RegisterServerEvent("qb-cokedealer:server:sellcokeItems")
AddEventHandler("qb-cokedealer:server:sellcokeItems", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "remove")
                end
            end
        end
        Player.Functions.AddItem("bands", price, "Swapped your bills")
        TriggerClientEvent('QBCore:Notify', src, "You have wswapped your bills")
    end
end)


QBCore.Functions.CreateCallback('qb-cokedealer:server:getSellPrice', function(source, cb)
    local retval = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    retval = retval + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                end
            end
        end
    end
    cb(retval)
end)
