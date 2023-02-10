Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
* **This companion script allows players to use an item to create a specific animal and have it follow you. Use the item again to despawn the animal. Animations are included for some companions if possible. (GTA V does not have animations for every ped). I have set it up that the items are linked to your characters citizenid, this means that when your pet gets stolen, the thief can't spawn the animal. This script is perfect to be used as a donation reward since it adds something cool to your server without being pay-to-win.**
* **Pressing 'H' opens the menu.**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)

# Installation
* **Install qb-companions**
* **Add the items to your shared**
* **Add the lines of code to your qb-inventory**

# Shared.lua items
```lua
-- COMPANIONS
["pet_shepherd"] 				= {["name"] = "pet_shepherd", 					["label"] = "Pet Shepherd", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_shepherd.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
["pet_cat"] 					= {["name"] = "pet_cat", 						["label"] = "Pet Cat", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_cat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Cat go miauw miauw!"},
["pet_pug"] 					= {["name"] = "pet_pug", 						["label"] = "Pet Pug", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_pug.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
["pet_retriever"] 				= {["name"] = "pet_retriever", 					["label"] = "Pet Retriever", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_retriever.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
["pet_rat"] 					= {["name"] = "pet_rat", 						["label"] = "Pet Rat", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "This rat is missing a toe!"},
["pet_rottweiler"] 				= {["name"] = "pet_rottweiler", 				["label"] = "Pet Rottweiler", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rottweiler.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
["pet_westy"] 					= {["name"] = "pet_westy", 						["label"] = "Pet Westy", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_westy.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
["pet_poodle"] 					= {["name"] = "pet_poodle", 					["label"] = "Pet Poodle", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_poodle.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
["pet_rabbit"] 					= {["name"] = "pet_rabbit", 					["label"] = "Pet Rabbit", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rabbit.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
["pet_chicken"] 				= {["name"] = "pet_chicken", 					["label"] = "Pet Chicken", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_chicken.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Soon to be KFC"},
["pet_husky"] 					= {["name"] = "pet_husky", 						["label"] = "Pet Husky", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_husky.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
["pet_mtlion"] 					= {["name"] = "pet_mtlion", 					["label"] = "Pet Lionh34rt", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_mtlion.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Big cat"},
```

# Add the following to qb-inventory/server/main.lua under the GiveItem command
```lua
elseif itemData["name"] == "pet_shepherd" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_cat" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_pug" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_retriever" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_rat" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_mtlion" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_rottweiler" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_westy" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_poodle" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_rabbit" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_chicken" then
    info.owner = Player.PlayerData.citizenid
elseif itemData["name"] == "pet_husky" then
    info.owner = Player.PlayerData.citizenid
```

# Insert this into your ms-peds config
```lua
{
    model = `cs_tracydisanto`,
    coords = vector4(562.32, 2740.83, 42.78, 183.55),  -- Companion shop
    gender = 'male'
},
{
    model = `a_c_cat_01`,
    coords = vector4(561.41, 2740.8, 42.78, 170.98),  -- Companion shop
    gender = 'male'
},
{
    model = `a_c_shepherd`,
    coords = vector4(563.28, 2740.01, 42.62, 134.87),  -- Companion shop
    gender = 'male'
},
```