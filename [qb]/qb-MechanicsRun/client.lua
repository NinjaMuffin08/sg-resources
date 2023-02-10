local QBCore = exports['qb-core']:GetCoreObject()
local Triggers = {}
local JobMechanicStarted,checkpoint,checkpoint2,message = false,false,false,false
local currentMission,currentBlip,distance,car,hashcar,ped,hashped,blip
Citizen.CreateThread(function()	
	QBCore.Functions.TriggerCallback('MechanicsRun:GetTriggers', function(Data) Triggers = Data end)	
	while Triggers == nil do
		Citizen.Wait(10)	
    end
	if Config.Zone and Config.Zone ~= vector4(0,0,0,0) then
		if Config.Blip then
			blip = AddBlipForCoord(Config.Zone)
			SetBlipSprite(blip, 402)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.65)
			SetBlipAsShortRange(blip, true)
			SetBlipColour(blip, 3)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(Config.Translation[Config.Language]["Blip"])
			EndTextCommandSetBlipName(blip)
		end
        StartMechanicsThreadPnj()
    end
end)
function StartMechanicsThreadPnj()
    local Waiter
    local distance
    local ped
    local isPedLoaded
    local gang = Config.pedhash
	local playerPed = PlayerPedId()
	local boxZonePed = BoxZone:Create(vector3(vector3(Config.Zone.x,Config.Zone.y,Config.Zone.z)), 100, 100, {
		name = "Mechanics Job Ped",
		debugPoly = false,
		heading = 70,
		minZ = Config.Zone.z - 20,
		maxZ = Config.Zone.z + 20,
	})
	local boxZonePress = BoxZone:Create(vector3(vector3(Config.Zone.x,Config.Zone.y,Config.Zone.z)), 2, 2, {
		name = "Mechanics Job",
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
			if not JobMechanicStarted then
				title = "Start Run"
			else
				title = "Stop Run"
			end
			exports['qb-menu']:openMenu({
				{
					header = title,
					icon = 'fa-regular fa fa-briefcase',
					params = {
						event = 'MechanicsRun:startRun',
						args = {}
					}
				},
			})	
		end
	end)
end
function StartMechanicThread()
	local Waiter = 7
    local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		while JobMechanicStarted do
		if currentMission == nil then
            local PlayerPos = GetEntityCoords(playerPed)
            while not CheckVehiculeMechanic() do
                Citizen.Wait(7)
                DrawSub(Config.Translation[Config.Language]["InCar"],1000)
            end
            while currentMission == nil do  
                currentMission = GenerateCoordsOnRoad(PlayerPos, 2000)
                Citizen.Wait(7)
            end
            currentBlip = AddBlipForCoord(currentMission.x, currentMission.y,currentMission.z)
            SetBlipAsFriendly(currentBlip, 1)
            SetBlipColour(currentBlip, 2)
            SetBlipCategory(currentBlip, 3)
            SetBlipRoute(currentBlip, true)
            PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
            Citizen.Wait(300)
            PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
            showPictureNotification("CHAR_CHEF",Config.Translation[Config.Language]["CallCustomer"],Config.Translation[Config.Language]["Customer"],nil)
            Citizen.Wait(300)
            PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0)
        elseif currentMission ~= nil then
            if not checkpoint then
                local playcoords = GetEntityCoords(playerPed)
                if CheckVehiculeMechanic() then
                    distance = GetDistanceBetweenCoords(playcoords, currentMission, true)
                    if distance > 300 then
                        Waiter = 1000
                    elseif distance < 300 and distance > 50 then
                        Waiter = 500
                        if not DoesEntityExist(car) then
                            hashped = Config.peds[GetRandomIntInRange(1, #Config.peds)]
                            hashcar = Config.cars[GetRandomIntInRange(1, #Config.cars)]
                            LoadModelDictionary(hashped)
                            LoadModelDictionary(hashcar)
                            car = CreateVehicle(hashcar,currentMission, 0, true, true)
                            SetVehicleDoorsLocked(car, 2)
                            SetVehicleDoorOpen(car, 4, false, false)
                            SetVehicleEngineHealth(car,0)
                            ped = CreatePed(4, hashped, currentMission.x+2, currentMission.y+2, currentMission.z, 90, true, true)
                            SetPedAlertness(ped, 0)
                            SetPedDropsWeaponsWhenDead(ped, false)
							RequestAnimDict("anim@special_peds@casino@vince@wall@cas_vince_ig3")
							while not HasAnimDictLoaded("anim@special_peds@casino@vince@wall@cas_vince_ig3") do
								Wait(0)
							end
							TaskPlayAnim(ped, "anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_quality_me_time", -1.0, -1.0, -1, 1, 1, -1, -1, -1)
                        end
                    elseif distance < 50 and distance > 20 then
                        Waiter = 7
                        if not DoesEntityExist(car) then
							hashped = Config.peds[GetRandomIntInRange(1, #Config.peds)]
                            hashcar = Config.cars[GetRandomIntInRange(1, #Config.cars)]
                            LoadModelDictionary(hashped)
                            LoadModelDictionary(hashcar)
                            car = CreateVehicle(hashcar,currentMission, 0, true, true)
                            SetVehicleDoorsLocked(car, 2)
                            SetVehicleDoorOpen(car, 4, false, false)
                            SetVehicleEngineHealth(car,0)
                            ped = CreatePed(4, hashped, currentMission.x+2, currentMission.y+2, currentMission.z, 90, true, true)
                            SetPedAlertness(hashped, 0)
                            SetPedDropsWeaponsWhenDead(ped, false)
							RequestAnimDict("anim@special_peds@casino@vince@wall@cas_vince_ig3")
							while not HasAnimDictLoaded("anim@special_peds@casino@vince@wall@cas_vince_ig3") do
								Wait(0)
							end
							TaskPlayAnim(ped, "anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_quality_me_time", -1.0, -1.0, -1, 1, 1, -1, -1, -1)
                        end
                    elseif distance < 20 then  
                        Waiter = 7
                        if not DoesEntityExist(car) then
                            hashped = Config.peds[GetRandomIntInRange(1, #Config.peds)]
                            hashcar = Config.cars[GetRandomIntInRange(1, #Config.cars)]
                            LoadModelDictionary(hashped)
                            LoadModelDictionary(hashcar)
                            car = CreateVehicle(hashcar,currentMission, 0, true, true)
                            SetVehicleDoorsLocked(car, 2)
                            SetVehicleDoorOpen(car, 4, false, false)
                            SetVehicleEngineHealth(car,0)
                            ped = CreatePed(4, hashped, currentMission.x+2, currentMission.y+2, currentMission.z, 90, true, true)
                            SetPedAlertness(hashped, 0)
                            SetPedDropsWeaponsWhenDead(ped, false)
                            RequestAnimDict("anim@special_peds@casino@vince@wall@cas_vince_ig3")
							while not HasAnimDictLoaded("anim@special_peds@casino@vince@wall@cas_vince_ig3") do
								Wait(0)
							end
							TaskPlayAnim(ped, "anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_quality_me_time", -1.0, -1.0, -1, 1, 1, -1, -1, -1)
                        end 
                       checkpoint = true
                    end
                else
                    DrawSub(Config.Translation[Config.Language]["InCar"],3000)
                end
            elseif checkpoint and not checkpoint2 then
                local playcoords = GetEntityCoords(playerPed)
                local capot = GetEntityBoneIndexByName(car, 'engine')
                local capotDistance = GetWorldPositionOfEntityBone(car, capot)
                distance = GetDistanceBetweenCoords(playcoords, capotDistance, true)
                DrawSub(Config.Translation[Config.Language]["Wait"],1000)
                if distance > 150 then
                    ClearCurrentMechanicMission()
                elseif distance < 150 and distance > 50 then
                    Waiter = 1000
                elseif distance < 50 and distance > 20 then
                    Waiter = 1000
                elseif distance < 20 and distance > 2 then
                    if DoesBlipExist(currentBlip) then
                        RemoveBlip(currentBlip)
                    end
                    Waiter = 7
                    DrawMarker(2, capotDistance.x, capotDistance.y, capotDistance.z+1.5, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0,128,0, 50, false, true, 2, nil, nil, false)
					if message then
						message = false
						exports['qb-core']:HideText()
					end
				elseif distance < 2 then
					DrawMarker(2, capotDistance.x, capotDistance.y, capotDistance.z+1.5, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0,128,0, 50, false, true, 2, nil, nil, false)
					if not message then
						message = true
						exports['qb-core']:DrawText(Config.Translation[Config.Language]["Repair"],"left") 
					end
					if IsControlJustReleased(1, 38) then
						exports['qb-core']:HideText()
						if Config.ProgressBar then
							QBCore.Functions.Progressbar('MechanicsRun',Config.Translation[Config.Language]["Repair2"], Config.RepairTime, false, true, {
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
						RequestAnimDict("mini@repair")
							while not HasAnimDictLoaded("mini@repair") do
								Wait(0)
							end
						TaskPlayAnim(playerPed, "mini@repair", "fixing_a_ped", -1.0, -1.0, -1, 1, 1, -1, -1, -1)
						FreezeEntityPosition(playerPed,true)
						Wait(Config.RepairTime)
						FreezeEntityPosition(playerPed,false)
						ClearPedTasks(playerPed)
						SetVehicleEngineHealth(car, 1000.0)
						SetVehicleFixed(car)
						SetVehicleDeformationFixed(car)
					end
				end
                if GetVehicleEngineHealth(car) > 200 then
                    SetVehicleDoorsLocked(car, 0)
                    SetVehicleDoorShut(car, 4, false, false)
                    TaskEnterVehicle(ped, car, 20000, -1, 1.5, 1, 0)
                    checkpoint2 = true
                end
            elseif checkpoint2 then
                DrawSub(Config.Translation[Config.Language]["LeaveCustomer"],1000)
                if IsPedSittingInVehicle(ped, car) then
					QBCore.Functions.Notify(Config.Translation[Config.Language]["Money"]..Config.Money.." "..Config.currency,"success")
					TriggerServerEvent(Triggers.AddMoney,Config.Money)
                    ClearCurrentMechanicMission()
                end
            end
        end
		Citizen.Wait(Waiter)
		end
	end)
end
RegisterNetEvent('MechanicsRun:startRun')
AddEventHandler('MechanicsRun:startRun', function()
	StartOrStopMechanicJob()
end)
function StartOrStopMechanicJob()
    if JobMechanicStarted then
        StopMechanicJob()
    else
        if CheckVehiculeMechanic() or not Config.CheckVehicle or Config.Zone ~= false then
            if Config.JobRequire ~= false then
				QBCore.Functions.GetPlayerData(function(PlayerData)
					if PlayerData.job.name == Config.JobRequire then
						StartMechanicJob()
					else
						QBCore.Functions.Notify(Config.Translation[Config.Language]["JobCheck"],"error")
					end
				end)
            else
                StopMechanicJob()
            end
        else
            QBCore.Functions.Notify(Config.Translation[Config.Language]["VehicleCheck"],"error")
        end
    end
end
function StartMechanicJob()
	ClearCurrentMechanicMission()
	ShowLoadingPromt(Config.Translation[Config.Language]["StartRun"], 5000, 3)
	JobMechanicStarted = true
	StartMechanicThread()
end
function StopMechanicJob()
	ShowLoadingPromt(Config.Translation[Config.Language]["StopRun"], 5000, 3)
	ClearCurrentMechanicMission()
	JobMechanicStarted = false
end
function ClearCurrentMechanicMission()
    if DoesBlipExist(currentBlip) then
        RemoveBlip(currentBlip)
    end
    SetPedAsNoLongerNeeded(ped)
	SetEntityAsNoLongerNeeded(car)
    checkpoint,checkpoint2 = false,false
    currentMission,distance,car,hashcar,ped,hashped = nil,nil,nil,nil,nil,nil
end
function CheckVehiculeMechanic()
    local playerPed = PlayerPedId()
    local vehicle 
    local checkveh = false
	if Config.CheckVehicle then
		vehicle = Config.VehicleAuthorised
		for i, v in ipairs(vehicle) do
			if IsVehicleModel(GetVehiclePedIsIn(playerPed, false), v) then
				checkveh = true
			end
		end
    	return checkveh
	else
		return IsPedInAnyVehicle(playerPed, false)
	end
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
function GenerateCoordsOnRoad(ActualPosition, DeltaPosition)
	local MinusOrNot, NewX, NewY, TempX, TempY
	TempX = math.random(600, DeltaPosition)
	MinusOrNot = math.random(1,2)
	NewX = (MinusOrNot == 1) and TempX or (TempX * -1)
	NewX = ActualPosition.x + NewX
	TempY = math.random(600, DeltaPosition) 
	MinusOrNot = math.random(1,2)
	NewY = (MinusOrNot == 1) and TempY or (TempY * -1)
	NewY = ActualPosition.y + NewY
	local found, NewPos =  GetClosestVehicleNode(NewX, NewY, ActualPosition.z, 0, 3, 0)
	if found then 
		if NewPos.x < -1500.0 and NewPos.x > -3000.0 and NewPos.y > 2500.0 and NewPos.y < 3600.0 then --  Military base
			return nil
		else
			return NewPos
		end
	else 
		return nil
	end
end
function LoadModelDictionary(Model)
	while(not HasModelLoaded(Model)) do
		RequestModel(Model)
		Citizen.Wait(7)
	end
end