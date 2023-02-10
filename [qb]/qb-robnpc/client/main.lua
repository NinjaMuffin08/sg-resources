local QBCore = exports['qb-core']:GetCoreObject()

local robbedRecently = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if IsControlJustPressed(0, 38) or NetworkIsPlayerTalking(PlayerId(-1)) then
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))

            if aiming then
                local playerPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(playerPed, true)
                local tCoords = GetEntityCoords(targetPed, true)

                if DoesEntityExist(targetPed) and IsPedHuman(targetPed) then
                    if robbedRecently then
                        QBCore.Functions.Notify("Cooldowns make the world go round.")
                    elseif IsPedDeadOrDying(targetPed, true) then
                        QBCore.Functions.Notify("Check his pockets...")
                    elseif GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, true) >= Config.RobDistance then
                        QBCore.Functions.Notify("They are too far away")
                    elseif IsPedSittingInAnyVehicle(targetPed, true) then
					    QBCore.Functions.Notify("They are in a car.")
					else
                        robNpc(targetPed)
                    end
                end
            end
        end
    end
end)

function robNpc(targetPed)
    robbedRecently = true
    Citizen.CreateThread(function()
        local dict = 'random@mugging3'
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
        end
        TaskStandStill(targetPed, Config.RobAnimationSeconds * 1000)
        FreezeEntityPosition(targetPed, true)
        TaskPlayAnim(targetPed, dict, 'handsup_standing_base', 8.0, -8, .01, 49, 0, 0, 0, 0)
		SetPlayerWantedLevel(PlayerId(), 2, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
        QBCore.Functions.Notify('robbery_started')
        QBCore.Functions.Progressbar("ROBBING_NPC", "You're threatening this innocent person for their belongings please wait...", (Config.RobAnimationSeconds * 1000), false, true)
        Citizen.Wait(Config.RobAnimationSeconds * 1000)
        TriggerServerEvent('qb-robnpc:server:givemoney', amount)
        FreezeEntityPosition(targetPed, false)
        QBCore.Functions.Notify('robbery_completed', (amount))
    end)
    if Config.ShouldWaitBetweenRobbing then
        Citizen.Wait(math.random(Config.MinWaitSeconds, Config.MaxWaitSeconds) * 1000)
        QBCore.Functions.Notify("You may now rob someone elses...")
    end
    robbedRecently = false
end


