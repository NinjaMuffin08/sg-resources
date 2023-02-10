local players = {}

exports('Message', function(background, color, icon, title, playername, message, target, image)
	TriggerServerEvent('sgrpChat:ServerMessage', background, color, icon, title, playername, message, target, image)
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('sgrpChat:onPlayerSpawn')
end)

RegisterNetEvent("sgrpChat:getAllPlayers")
AddEventHandler("sgrpChat:getAllPlayers", function()
	local coords = GetEntityCoords(PlayerPedId())
	local closePlayers = {}
	local allPlayers = GetActivePlayers()
	local playerCount = 1
	local pedID = PlayerPedId()

	for i = 1, #allPlayers do
		local playerId = allPlayers[i]
		local playerPed = GetPlayerPed(playerId)
		local playerCoords = GetEntityCoords(playerPed)

		table.insert(closePlayers, GetPlayerServerId(playerId))
		playerCount += 1
	end

	TriggerServerEvent("sgrpChat:SetClosePlayers", closePlayers)
end)

RegisterNetEvent("sgrpChat:checkDeathStatus")
AddEventHandler("sgrpChat:checkDeathStatus", function()
	local ped = GetPlayerPed(-1)
	TriggerServerEvent('sgrpChat:deathStatus', IsEntityDead(ped))
end)

RegisterNetEvent("sgrpChat:Notification")
AddEventHandler("sgrpChat:Notification", function(info, text)
	exports['sgrpNotify']:Alert(info.title, text, info.time, info.type)
end)

Citizen.CreateThread(function()

	if Config.JobChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.JobCommand, 'JOB message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableSurvivor then
		TriggerEvent('chat:addSuggestion', '/'..Config.SurvivorCommand, 'Survivor message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.AllowPlayersToClearTheirChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.ClearChatCommand, 'Clear chat', {})
	end

	if Config.EnableHideChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.HideChatCommand, 'Hide chat', {})
	end

	if Config.EnableStaffCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommand, 'Send a message as staff', {
			{ name="message", help="message to send" },
		})
	end

	if Config.AllowStaffsToClearEveryonesChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.ClearEveryonesChatCommand, "Clear everyone's chat", {})
	end

	if Config.EnableStaffOnlyCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.StaffOnlyCommand, 'Staff only chat', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableAdvertisementCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AdvertisementCommand, 'Make an advertisement', {
			{ name="ad", help="advertisement message" },
		})
	end

	if Config.EnableAnonymousCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AnonymousCommand, 'Send an anonymous message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableTwitchCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.TwitchCommand, 'Twitch message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableYoutubeCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.YoutubeCommand, 'YouTube message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableTwitterCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.TwitterCommand, 'Twitter message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnablePoliceCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.PoliceCommand, 'Police message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableAmbulanceCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AmbulanceCommand, 'Ambulance message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.TimeOutPlayers then
		TriggerEvent('chat:addSuggestion', '/'..Config.TimeOutCommand, 'Mute player', {
			{ name="id", help="id of the player to mute" },
			{ name="time", help="time in minutes" }
		})

		TriggerEvent('chat:addSuggestion', '/'..Config.RemoveTimeOutCommand, 'Unmute player', {
			{ name="id", help="id of the player to unmute" }
		})
	end

	if Config.EnableMe then
		TriggerEvent('chat:addSuggestion', '/'..Config.MeCommand, 'Send a me message', {
			{ name="action", help="me action" }
		})
	end

	if Config.EnableTry then
		TriggerEvent('chat:addSuggestion', '/'..Config.TryCommand, 'Send a try message', {
			{ name="action", help="try action" }
		})
	end

	if Config.EnableDo then
		TriggerEvent('chat:addSuggestion', '/'..Config.DoCommand, 'Send a do message', {
			{ name="action", help="do action" }
		})
	end
end)