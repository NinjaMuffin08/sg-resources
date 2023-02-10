local QBCore = exports['qb-core']:GetCoreObject()
local Triggers = {}
local EMSJobStarted = false
local CurrentCustomer           = nil
local CurrentEMSCustomerBlip   = nil
local DestinationBlip           = nil
local CustomerIsEnteringVehicle = false
local CustomerEnteredVehicle    = false
local TargetCoords              = nil
local LastCoords				= nil
local distance = nil
local Waiter = 2
local PedToHeal = nil
local PedHash = nil
local ragdoll = false
local ConfigJob = {}
local JobName = nil
local Random = 0
local message = false
Citizen.CreateThread(function()	
	QBCore.Functions.TriggerCallback('AmbulanceRun:GetTriggers', function(Data) Triggers = Data end)	
	while Triggers == nil do
		Citizen.Wait(10)	
    end
	if Config.Zone and Config.Zone ~= vector4(0,0,0,0) then
        StartAmbulancethreadPnj()
    end
end)
function StartAmbulancethreadPnj()
    local Waiter
    local distance
    local ped
    local isPedLoaded
    local gang = Config.pedhash
	local playerPed = PlayerPedId()
	local boxZonePed = BoxZone:Create(vector3(vector3(Config.Zone.x,Config.Zone.y,Config.Zone.z)), 100, 100, {
		name = "Ambulance Job Ped",
		debugPoly = false,
		heading = 70,
		minZ = Config.Zone.z - 20,
		maxZ = Config.Zone.z + 20,
	})
	local boxZonePress = BoxZone:Create(vector3(vector3(Config.Zone.x,Config.Zone.y,Config.Zone.z)), 2, 2, {
		name = "Ambulance Job",
		debugPoly = false,
		heading = 70,
		minZ = Config.Zone.z - 2,
		maxZ = Config.Zone.z + 2,
	})
	boxZonePed:onPlayerInOut(function(isPointInside)
		if isPointInside then
			if not isPedLoaded then
				RequestModel(GetHashKey(gang))
				while not HasModelLoaded(GetHashKey(gang)) do
					Wait(1)
				end
				ped = CreatePed(4, gang, Config.Zone, false, true)
				FreezeEntityPosition(ped, true)	
				SetEntityInvincible(ped, true)
				SetBlockingOfNonTemporaryEvents(ped, true)                    
				isPedLoaded = true
			end
		else
			if isPedLoaded then
				DeleteEntity(ped)
				SetModelAsNoLongerNeeded(GetHashKey(ped))
				isPedLoaded = false
			end
		end
	end)
	boxZonePress:onPlayerInOut(function(isPointInside)
		if isPointInside then
			local title
			if not EMSJobStarted then
				title = "Start Run"
			else
				title = "Stop Run"
			end
			exports['qb-menu']:openMenu({
				{
					header = title,
					icon = 'fa-regular fa-truck-medical',
					params = {
						event = 'AmbulanceRun:startRun',
						args = {}
					}
				},
			})	
		end
	end)
end
function StartAmbulanceThread()
	local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		while EMSJobStarted do 
			local PlayerPos = GetEntityCoords(playerPed)
			if CurrentCustomer == nil then
				if IsPedInAnyVehicle(playerPed, false) and (CheckVehiculeEMS() or not Config.CheckVehicle) then
					DrawSub(Config.Translation[Config.Language]["Drive"], 3000)
					if IsPedInAnyVehicle(playerPed, false) and GetEntitySpeed(playerPed) > 0 then
						local waitUntil = GetGameTimer() + GetRandomIntInRange(Config.TimeMin, Config.TimeMax)
						while EMSJobStarted and waitUntil > GetGameTimer() do
							DrawSub(Config.Translation[Config.Language]["Drive"], 3000)
							Citizen.Wait(500)
						end
						if EMSJobStarted and IsPedInAnyVehicle(playerPed, false) and GetEntitySpeed(playerPed) > 0 then
							while CurrentCustomer == nil do                                
								CurrentCustomer = Config.Run.destination[GetRandomIntInRange(1,#Config.Run.destination)]
								Citizen.Wait(2)
							end
							if CurrentCustomer ~= nil then
								CurrentEMSCustomerBlip = AddBlipForCoord(CurrentCustomer)
								SetBlipAsFriendly(CurrentEMSCustomerBlip, 1)
								SetBlipColour(CurrentEMSCustomerBlip, 2)
								SetBlipCategory(CurrentEMSCustomerBlip, 3)
								SetBlipRoute(CurrentEMSCustomerBlip, true)
								showPictureNotification("CHAR_CALL911",Config.Translation[Config.Language]["Found"],Config.Translation[Config.Language]["Central"],nil)
								PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
								Citizen.Wait(175)
								PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
								Citizen.Wait(300)
								PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
								Citizen.Wait(175)
								PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
							end
						end
					end
				else
					DrawSub(Config.Translation[Config.Language]["InCar"],Waiter)
					Waiter = 1000
				end
			else
				distance = GetDistanceBetweenCoords(PlayerPos, CurrentCustomer, true)
				if distance > 300 then
					Waiter = 5000
				elseif distance < 200 and distance > 20 then
					Waiter = 1000
					if PedToHeal == nil then
						PedHash = GetHashKey(Config.Run.peds[GetRandomIntInRange(1,#Config.Run.peds)])
						RequestModel(PedHash)
						while not HasModelLoaded(PedHash) do
							RequestModel(PedHash)
							Citizen.Wait(1)
						end
						PedToHeal = CreatePed(4,PedHash, CurrentCustomer, 0, true, true)
						ragdoll = true
						ragdollThread()
					end
				elseif distance < 20 and distance > 3 then
					Waiter = 2
					DrawMarker(2, CurrentCustomer.x,CurrentCustomer.y,CurrentCustomer.z+2, 90.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 52, 62, 235, 50, false, true, 2, nil, nil, false)
					DrawSub(Config.Translation[Config.Language]["Save"],Waiter)
					if message then
						message = false
						exports['qb-core']:HideText()
					end
				elseif distance < 3 then
					Waiter = 2
					if not message then
						message = true
						exports['qb-core']:DrawText(Config.Translation[Config.Language]["PressForSave"],"left") 
					end
					DrawMarker(2, CurrentCustomer.x,CurrentCustomer.y,CurrentCustomer.z+2, 90.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 52, 62, 235, 50, false, true, 2, nil, nil, false)
					DrawSub(Config.Translation[Config.Language]["Save"],Waiter)
					if IsControlJustReleased(0,38) then
						exports['qb-core']:HideText()
						RequestAnimDict("mini@cpr@char_a@cpr_str")
						while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
							Wait(0)
						end
						TaskPlayAnim(playerPed, "mini@cpr@char_a@cpr_str", "cpr_pumpchest", 1.0, 1.0, 15000, 1, 1, -1, -1, -1)
						FreezeEntityPosition(playerPed, true)
						if Config.ProgressBar then
							QBCore.Functions.Progressbar('AmbulanceRun', Config.Translation[Config.Language]["Saving"], 15000, false, true, {
								disableMovement = false,
								disableCarMovement = false,
								disableMouse = false,
								disableCombat = false
								}, {}, {}, {}, function()
									-- This code runs if the progress bar completes successfully
								end, function()
									-- This code runs if the progress bar gets cancelled
							end)
						end
						Wait(15000)
						ragdoll = false
						SetEntityInvincible(PedToHeal, false)
						SetEntityHealth(PedToHeal, 100)
						ReviveInjuredPed(PedToHeal)
						FreezeEntityPosition(playerPed, false)
						ClearPedTasks(playerPed)
						QBCore.Functions.Notify(Config.Translation[Config.Language]["Money"]..Config.Money.." "..Config.currency,"success")
						TriggerServerEvent(Triggers.AddMoney,Config.Money)
						RequestAmbientAudioBank("GENERIC_HI")
						PlayAmbientSpeech1(PedToHeal,"GENERIC_HI","SPEECH_PARAMS_STANDARD")
						showPictureNotification("CHAR_CHAT_CALL",Config.Translation[Config.Language]["thanks"],Config.Translation[Config.Language]["Customer"],nil)
						SetPedAsNoLongerNeeded(PedToHeal)
						ClearCurrentEMSMission()
					end
				end
			end
			Citizen.Wait(Waiter)
		end
	end)
end
RegisterNetEvent('AmbulanceRun:startRun')
AddEventHandler('AmbulanceRun:startRun', function()
	StartOrStopEMSJob()
end)
function StartOrStopEMSJob()
    if EMSJobStarted then
        StopEMSJob()
    else
        if CheckVehiculeEMS() or not Config.CheckVehicle or Config.Zone ~= false then
            if Config.JobRequire ~= false then
				QBCore.Functions.GetPlayerData(function(PlayerData)
					if PlayerData.job.name == Config.JobRequire then
						StartEMSJob()
					else
						QBCore.Functions.Notify(Config.Translation[Config.Language]["JobCheck"],"error")
					end
				end)
            else
                StartEMSJob()
            end
        else
            QBCore.Functions.Notify(Config.Translation[Config.Language]["VehicleCheck"],"error")
        end
    end
end
function StartEMSJob()
	ClearCurrentEMSMission()
	ShowLoadingPromt(Config.Translation[Config.Language]["StartRun"], 3000, 3)
	EMSJobStarted = true
	StartAmbulanceThread()
end

function StopEMSJob()
	ClearCurrentEMSMission()
	ShowLoadingPromt(Config.Translation[Config.Language]["StopRun"], 3000, 3)
	EMSJobStarted = false
end
function CheckVehiculeEMS()
    local playerPed = PlayerPedId()
    local vehicles = Config.VehicleAuthorised
    local checkveh = false 
    local usedVehicle = GetVehiclePedIsIn(playerPed, false)
    for i, v in ipairs(vehicles) do
        if IsVehicleModel(usedVehicle, v) then
            checkveh = true
        end
    end
    return checkveh
end
function ClearCurrentEMSMission()
	if DoesBlipExist(CurrentEMSCustomerBlip) then
		RemoveBlip(CurrentEMSCustomerBlip)
	end
	if DoesBlipExist(DestinationBlip) then
		RemoveBlip(DestinationBlip)
	end
	PedToHeal,PedHash,CurrentCustomer,CurrentEMSCustomerBlip,DestinationBlip,TargetCoords,LastCoords = nil,nil,nil,nil,nil,nil,nil
	ragdoll,CustomerIsEnteringVehicle,CustomerEnteredVehicle = false,false,false
end
function ragdollThread()
	Citizen.CreateThread(function()
		while ragdoll do
			SetPedToRagdoll(PedToHeal, 1000, 1000, 0, 0, 0, 0)
			Citizen.Wait(2)
		end
	end)
end
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 320
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		BeginTextCommandBusyString("STRING")
		AddTextComponentString(msg)
		EndTextCommandBusyString(type)
		Citizen.Wait(time)

		RemoveLoadingPrompt()
	end)
end
function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true)
end
function DrawSub(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time, 1)
end