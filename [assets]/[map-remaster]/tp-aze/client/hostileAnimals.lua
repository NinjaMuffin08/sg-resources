local maxBadAnimals = 15

local badanimalmodelhash = {
  0xCE5FF074,
  0x573201B8,
  0x644AC75E,
  0xD86B5A95,
  0x431FC24C,
  0x6AF51FAF,
  0x4E8F95A2,
  0x1250D7BA,
  0xE71D5E68,
  0xB11BAB56,
  0x431D501C,
  0x6D362854,
  0xDFB55C81,
  0xC3B52966,
  0x349F33E1,
  0xC2D06F53,
  0x9563221D,
  0xAD7844BB,
  0x8BBAB455,
  0x2FD800B7,
  0x3C831724,
  0x471BE4B2,
  0x8D8AC8B9,
  0x06C3F072,
  0xA148614D, 
}
-- Total count of hashes for animalmodelhash
local hashTotal = 25

-- Determines how far animals have to be from player to despawn
local despawnDistance = 750
-- Determines how far away from the player until animals can spawn
local minSpawnDistance = 70
-- Determines the maximum spawn radius animals can spawn around the player
local maxSpawnRadius = 500

--The Main Code--
players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
	--[[local playercount = 0;
	for i, ped in pairs(players) do
		playercount = playercount + 1
	end
	maxBadAnimals = 5
	Citizen.Trace("Maximum spawnable badanimals: " .. maxBadAnimals .. "\n")--]]
end)

badanimals = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		AddRelationshipGroup("badanimals")
		SetRelationshipBetweenGroups(5, GetHashKey("badanimals"), GetHashKey("PLAYER"))
		SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("badanimals"))
		SetRelationshipBetweenGroups(5, GetHashKey("badanimals"), GetHashKey("zombies"))
		
		-- spawn bad animals
		BadAnimalSpawner()
		
		for i, badanimal in pairs(badanimals) do
			if not DoesEntityExist(badanimal) then
				table.remove(badanimals, i)
			end
			
			playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			pedX, pedY, pedZ = table.unpack(GetEntityCoords(badanimal, true))
			if IsPedDeadOrDying(badanimal, 1) then
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 5.0)then
					DisplayHelpText("Press ~INPUT_CONTEXT~ to harvest animal.")
					if IsControlJustReleased(1, 51) then -- INPUT_CELLPHONE_DOWN
						if DoesEntityExist(GetPlayerPed(-1)) then
							RequestAnimDict("pickup_object")
							while not HasAnimDictLoaded("pickup_object") do
							Citizen.Wait(1)
							end
							TaskPlayAnim(PlayerPedId(), "pickup_object", "pickup_low", 8.0, -8, -1, 49, 0, 0, 0, 0)
							Citizen.Wait(2000)
							ClearPedSecondaryTask(GetPlayerPed(-1))
							DeleteEntity(badanimal)
							table.remove(badanimals, i)
							ShowNotification("You harvested raw meat from dead animal")
						end
					end
				end
			end
			
			if IsPedDeadOrDying(badanimal, 1) then
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) > 75.0)then
					DeleteEntity(badanimal)
					table.remove(badanimals, i)
				end
			else
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY = table.unpack(GetEntityCoords(badanimal, true))

				if pedX < playerX - despawnDistance or pedX > playerX + despawnDistance or pedY < playerY - despawnDistance or pedY > playerY + despawnDistance then
					-- Set badanimal as no longer needed for despawning
					DeleteEntity(badanimal)
					table.remove(badanimals, i)
				end
			end
		end
	end
end)

function BadAnimalSpawner()
	if #badanimals < maxBadAnimals then
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
		-- load all the skins 
		for i, skinhash in pairs(badanimalmodelhash) do
			RequestModel(skinhash)
			while not HasModelLoaded(skinhash) do
				Citizen.Wait(100)
			end
		end
		
		repeat
			Citizen.Wait(1)

			newX = x + math.random(-maxSpawnRadius, maxSpawnRadius)
			newY = y + math.random(-maxSpawnRadius, maxSpawnRadius)

			--for _, player in pairs(players) do
				player = PlayerId()
				Citizen.Wait(1)
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
				if newX > playerX - minSpawnDistance and newX < playerX + minSpawnDistance or newY > playerY - minSpawnDistance and newY < playerY + minSpawnDistance then
					canSpawn = false
					break
				else
					canSpawn = true
				end
			--end
		until canSpawn
		
		
		-- set a random skin
		hashint = math.random(1, hashTotal)
		badanimal = CreatePed(4, badanimalmodelhash[hashint], newX, newY, z - 500, 0.0, false, false)
		
		-- Adds the blips for Zombies
		--SetEntityCoords(entity, X, Y, Z, xAxis, yAxis, zAxis, p7)
		blip = AddBlipForEntity(badanimal)
		SetBlipSprite(blip, 442)
		SetBlipAsShortRange(blip, true)
		
		SetPedSeeingRange(badanimal, 50.0)
		SetPedHearingRange(badanimal, 150.0)
		SetPedFleeAttributes(badanimal, 0, 0)
		SetPedCombatAttributes(badanimal, 46, 1)
		SetPedCombatAttributes(badanimal, 5, 1)
		SetPedCombatAbility(badanimal, 100)
		SetPedCombatRange(badanimal, 2)
		SetPedCombatMovement(badanimal, 3)
		SetPedRelationshipGroupHash(badanimal, GetHashKey("badanimals"))
		SetPedDiesInWater(badanimal, true)
		SetPedDiesWhenInjured(badanimal, true)
		
		x, y, z = table.unpack(GetEntityCoords(badanimal, true))
		TaskWanderStandard(badanimal, 1.0, 10)
		
		table.insert(badanimals, badanimal)
	end
end