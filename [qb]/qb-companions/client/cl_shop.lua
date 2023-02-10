local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-companions:client:OpenShop', function()
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Pet Store", {
        label = "Pet Store",
        slots = 7,
        items = {
            [1] = {
                name = "pet_shepherd",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "pet_cat",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "pet_pug",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "pet_retriever",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "pet_rat",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 5,
            },
            [6] = {
                name = "pet_rottweiler",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 6,
            },
            [7] = {
                name = "pet_westy",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 7,
            },
            [8] = {
                name = "pet_poodle",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 8,
            },
            [9] = {
                name = "pet_rabbit",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 9,
            },
            [10] = {
                name = "pet_chicken",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 10,
            },
            [11] = {
                name = "pet_husky",
                price = 4000,
                amount = 1,
                info = {
                    owner = citizenid
                },
                type = "item",
                slot = 11,
            }
        }
    })
end)

CreateThread(function()
    -- Target for store
    exports['qb-target']:AddBoxZone("CompanionShop", vector3(562.32, 2740.83, 42.78), 0.6, 0.6, {
        name = "CompanionShop",
        heading = 183.35,
        debugPoly = false,
        minZ = 41.78,
        maxZ = 43.58,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-companions:client:OpenShop",
                icon = 'fas fa-cart-plus',
                label = 'Open Shop'
            }
        },
        distance = 1.0,
    })
    -- Blip
    local blip = AddBlipForCoord(562.32, 2740.83, 42.78)
	SetBlipSprite(blip, 141)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 44)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Pet Store")
	EndTextCommandSetBlipName(blip)
end)