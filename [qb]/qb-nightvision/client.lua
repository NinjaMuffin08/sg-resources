QBCore = nil

Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        Citizen.Wait(100) 
    end
end)
nightvision = false

RegisterNetEvent('qb-nightvision:toggle')
AddEventHandler('qb-nightvision:toggle', function()
	local ChangeClothes = true
	local ped = PlayerPedId()
	if nightvision == false then
		nightvision = true
		if ChangeClothes == true then
			loadAnimDict("mp_masks@standard_car@ds@")
			TaskPlayAnim(PlayerPedId(), "mp_masks@standard_car@ds@", "put_on_mask", 2.0, 2.0, 800, 51, 0, false, false, false)
			SetPedComponentVariation(ped, 1, 132, 0, 0)
			Citizen.Wait(1000)
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "nightvision", 0.25)
			SetNightvision(true)
		end
		
	elseif nightvision == true then
		if ChangeClothes == true then
			loadAnimDict("mp_masks@standard_car@ds@")
			TaskPlayAnim(PlayerPedId(), "mp_masks@standard_car@ds@", "put_on_mask", 2.0, 2.0, 800, 51, 0, false, false, false)
			SetPedComponentVariation(ped, 1, 0, 0, 0)
			Citizen.Wait(1000)
			SetNightvision(false)
			nightvision = false
		
		end
	end

end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

