Config = {}

Config.Icons = { --Icons for jobs in the menu. Use job name(Case sensitive). Can use FontAwsome or Bootstrap Icons
    ['police'] = 'bi bi-shield-shaded',
    ['ambulance'] = 'fas fa-ambulance',
    ['tow'] = 'bi bi-truck-flatbed',
    ['taxi'] = 'fas fa-taxi',
    ['lawyer'] = 'bi bi-briefcase',
    ['judge'] = 'fas fa-gavel',
    ['realestate'] = 'bi bi-house',
    ['cardealer'] = 'fas fa-car',
    ['mechanic'] = 'bi bi-tools',
    ['reporter'] = 'bi bi-newspaper',
    ['trucker'] = 'fas fa-truck-moving',
    ['garbage'] = 'fas fa-recycle',
	['tastyeats'] = 'fas fa-tastyeats',
	['bandido'] = 'fas fa-bandido',
	['mandem'] = 'fas fa-mandem',
	['bloods'] = 'fas fa-bloods',
	['hookahlounge'] = 'fas fa-hookahlounge',
	['skyclub'] = 'fas fa-skyclub',
	['gardener'] = 'fas fa-gardener',
	['courier'] = 'fas fa-courier',
	['gang'] = 'fas fa-gang',
	['dj'] = 'fas fa-dj',
	['cookies'] = 'fas fa-cookies',
	['parkingenforcer'] = 'fas fa-parkingenforcer',
	['popsdiner'] = 'fas fa-popsdiner',
	['tequilala'] = 'fas fa-tequilala',
	['reapers'] = 'fas fa-reapers',
	['engine'] = 'fas fa-engine',
	['harmonyrepairs'] = 'fas fa-harmonyrepairs',
	['burgershot'] = 'fas fa-burgershot',
	['catcafe'] = 'fas fa-catcafe',
	['pizzathis'] = 'fas fa-pizzathis',
	['vanilla'] = 'fas fa-vanilla',
	['bus'] = 'fas fa-bus',
}

Config.DefaultIcon = "fas fa-briefcase" --The default icon shown if the job isn't defined above

Config.BlackListedJobs = { --jobs that won't automatically be added to the multijob menu. EG Can use cityhall jobs if you want them to go to city hall each time
    'unemployed',
    'examplejob2'
}

Config.Keybind = "F4" --Keybind used to open the menu