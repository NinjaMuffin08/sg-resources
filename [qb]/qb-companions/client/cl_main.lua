local QBCore = exports['qb-core']:GetCoreObject()

local companion = nil
local animModel = nil
local spawned = false
local inVehicle = false

-- Spawns the companion for a given model name
-- @param modelName string - Name of the animal ped model
local spawnAnimal = function(modelName)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local plyCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    companion = CreatePed(28, model, plyCoords.x, plyCoords.y, plyCoords.z-1, GetEntityHeading(PlayerPedId()), 0, 1)
    local netId = NetworkGetNetworkIdFromEntity(companion)
    animModel = modelName
    spawned = true

    SetBlockingOfNonTemporaryEvents(companion, true)
    SetPedFleeAttributes(companion, 0, 0)
    SetPedRelationshipGroupHash(companion, `k9`)
    SetEntityHealth(companion, 300)
    SetPedArmour(companion, 100)
    SetEntityInvincible(companion, true) -- comment this if you don't want invincible animals :>
    NetworkRegisterEntityAsNetworked(companion)
    GiveWeaponToPed(companion, `WEAPON_ANIMAL`, 200, true, true);
    while not NetworkGetEntityIsNetworked(companion) do Wait(10) end
    SetModelAsNoLongerNeeded(modelName)
    TaskFollowToOffsetOfEntity(companion, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
    SetPedKeepTask(companion, true)
end

-- This function deletes the animal
local deleteAnimal = function()
    local netId = NetworkGetNetworkIdFromEntity(companion)
    NetworkRequestControlOfNetworkId(netId)
    while not NetworkHasControlOfNetworkId(netId) do Wait(10) end
    DeleteEntity(companion)
    companion = nil
    animModel = nil
    spawned = false
end

-- This function finds the closest vehicle that the playerPed is looking at
-- @return vehicleHandle vehicleHandle - The vehicle handle of the closest vehicle
local getNearestVeh = function()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

RegisterNetEvent('qb-companions:client:ToggleCompanion', function(animal)
    TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    local progressBarMessage = "Picking Up Companion.."
    if not spawned then progressBarMessage = "Placing Companion.." end
    QBCore.Functions.Progressbar("toggle_companion", progressBarMessage, 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if not spawned then
            spawnAnimal(animal)
        else
            deleteAnimal()
        end
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-companions:client:Follow', function()
    if companion then
        -- PED DO WHISTLE
        RequestAnimDict("rcmnigel1c")
        while not HasAnimDictLoaded("rcmnigel1c") do Wait(10) end
        TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)
        -- COMPANION FOLLOW
        TaskFollowToOffsetOfEntity(companion, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
        SetPedKeepTask(companion, true)
    end
end)

RegisterKeyMapping('companionMenu', 'Companion Menu', 'keyboard', 'k')
RegisterCommand('companionMenu', function()
    if spawned then
        local menu = {
            {
                header = "< Companion Menu",
                txt = "ESC or click to close",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
        }
        if inVehicle then
            menu[#menu+1] = {
                header = "Take from vehicle",
                txt = "",
                params = {
                    event = "qb-companions:client:TakeFromVehicle"
                }
            }
        else
            menu[#menu+1] = {
                header = "Follow",
                txt = "",
                params = {
                    event = "qb-companions:client:Follow"
                }
            }
            menu[#menu+1] = {
                header = "Put In Vehicle",
                txt = "",
                params = {
                    event = "qb-companions:client:PutInVehicle"
                }          
            }
            menu[#menu+1] = {
                header = "Animations",
                txt = "",
                params = {
                    event = "qb-companions:client:menu:Animations"
                }
            }
            menu[#menu+1] = {
                header = "Pick Up",
                txt = "Pick up your companion!",
                params = {
                    event = "qb-companions:client:ToggleCompanion"
                }
            }
        end

        exports['qb-menu']:openMenu(menu)
    end
end)

RegisterNetEvent('qb-companions:client:menu:Animations', function()
    if spawned then
        local menu = {
            {
                header = "< Go Back",
                txt = "",
                params = {
                    isCommand = true,
                    event = "companionMenu"
                }
            },
            {
                header = "Clear Animation",
                txt = "",
                params = {
                    event = "qb-companions:client:ClearAnimation",
                }
            }
        }
        if Animations[animModel] then
            for k, v in pairs(Animations[animModel]) do
                menu[#menu+1] = {
                    header = k,
                    txt = "",
                    params = {
                        event = "qb-companions:client:Animation",
                        args = {
                            animation = k
                        }
                    }
                }
            end
        end
        exports['qb-menu']:openMenu(menu)
    end
end)

RegisterNetEvent('qb-companions:client:ClearAnimation', function()
    if companion ~= nil then
        ClearPedTasksImmediately(companion)
        TaskFollowToOffsetOfEntity(companion, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
        SetPedKeepTask(companion, true)
    end
end)

RegisterNetEvent('qb-companions:client:Animation', function(data)
    if companion ~= nil then
        local animation = Animations[animModel][data.animation]
        local animDict = animation.animationDict
        local animTask = animation.task

        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end

        Wait(500)
        TaskPlayAnim(companion, animDict, animTask, 8.0, 0.0, -1, 0, 0, 0, 0, 0)
        if animation.taskWait then
            Wait(animation.taskWait)
            TaskPlayAnim(companion, animDict, animation.taskExit, 8.0, 0.0, -1, 0, 0, 0, 0, 0)
        end
        SetPedKeepTask(companion, false)
        -- RE OPEN MENU
        TriggerEvent('qb-companions:client:menu:Animations')
    end
end)

RegisterNetEvent('qb-companions:client:PutInVehicle', function()
    if companion ~= nil then
        local closestVehicle = getNearestVeh()
        local companionCoords = GetEntityCoords(companion)
        if #(GetEntityCoords(PlayerPedId()) - companionCoords) < 1.5 then
            if closestVehicle ~= 0 then
                local vehClass = GetVehicleClass(closestVehicle)
                if GetVehicleDoorAngleRatio(closestVehicle, 5) > 0 and TrunkClasses[vehClass] then
                    local netId = NetworkGetNetworkIdFromEntity(companion)
                    NetworkRequestControlOfNetworkId(netId)
                    while not NetworkHasControlOfNetworkId(netId) do Wait(10) end
                    DeleteEntity(companion)
                    inVehicle = true
                    Wait(250)
                    SetVehicleDoorShut(closestVehicle, 5, false)
                    QBCore.Functions.Notify('You placed your companion in the vehicle..', 'success', 2500)
                else
                    QBCore.Functions.Notify('Is the trunk closed?', 'error', 2500)
                end
            else
                QBCore.Functions.Notify('You need to do this from behind the vehicle..', 'error', 2500)
            end
        end
    end
end)

RegisterNetEvent('qb-companions:client:TakeFromVehicle', function()
    if inVehicle then
        local vehicle = getNearestVeh()
        if vehicle ~= nil then
            -- OPEN TRUNK
            SetVehicleDoorOpen(vehicle, 5, false, true)
            Wait(500)
            local vehCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.0, 0)
            -- SPAWN
            local model = GetHashKey(animModel)
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(10) end
            companion = CreatePed(28, model, vehCoords.x, vehCoords.y, vehCoords.z-1, GetEntityHeading(PlayerPedId()), 0, 1)
            spawned = true
            SetBlockingOfNonTemporaryEvents(companion, true)
            SetPedFleeAttributes(companion, 0, 0)
            SetPedRelationshipGroupHash(companion, `k9`)
            SetEntityHealth(companion, 300)
            SetPedArmour(companion, 100)
            SetEntityInvincible(companion, true) -- comment this if you don't want invincible animals :>
            NetworkRegisterEntityAsNetworked(companion)
            GiveWeaponToPed(companion, `WEAPON_ANIMAL`, 200, true, true);
            while not NetworkGetEntityIsNetworked(companion) do Wait(10) end
            SetModelAsNoLongerNeeded(modelName)
            TaskFollowToOffsetOfEntity(companion, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
            SetPedKeepTask(companion, true)
            inVehicle = false
            -- SET FOLLOW
            TaskFollowToOffsetOfEntity(companion, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
            SetPedKeepTask(companion, true)
            -- CLOSE TRUNK
            SetVehicleDoorShut(vehicle, 5, false)
        else
            QBCore.Functions.Notify('You need to do this from behind the vehicle..', 'error', 2500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        if spawned then
            SetPedMoveRateOverride(companion, 10.0)
        else
            Wait(2000)
        end
    end
end)