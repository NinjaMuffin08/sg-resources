return {
	[1] = {
		--groups = 'police',
		moneytype = 'money',
		type = 'vehicle',
		label = 'Premium Deluxe Motorsports',
		coord = vec3(-31.42,-1106.44,26.422),
		purchase = vec4(-31.88,-1091.17,25.74,337.1),
		spawn = vec4(-46.166618347168,-1095.1260986328,25.746654510498,149.61434936523),
		spin = true,
		restock = vec4(-49.725978851318,-1077.2698974609,27.09181022644,68.993782043457),
		cashier = vec3(-55.57,-1097.97,26.42),
		blip = {
			id = 402, colour = 69, scale = 0.8
		},
		price = 3000000,
		supplieritem = shared.Storeitems.VehicleShop,
		camerasetting = {offset = vec3(0.0,-1.2,0.0), fov = 25},
		showcase = {
			[1] = {
				coord = vec3(-36.91731262207,-1103.2255859375,26.42), 
				label = 'Spot 1',
				position = vec4(-39.272773742676,-1102.9514160156,25.754877090454,291.85345458984),
			},
			[2] = {
				coord = vec3(-43.74,-1097.87,26.42), 
				label = 'Spot 2',
				position = vec4(-41.56,-1096.429,25.75,131.42),
			},
			[3] = {
				coord = vec3(-47.055,-1096.91,26.42), 
				label = 'Spot 3',
				position = vec4(-49.671222686768,-1098.3825683594,25.754959106445,309.06005859375),
			},
		}
	},
	[2] = {
		--groups = 'police',
		moneytype = 'money',
		type = 'vehicle',
		label = 'Premium Deluxe Motorsports Patoche',
		coord = vec3(-1248.3510742188,-350.24868774414,37.33287),
		purchase = vec4(-1231.9196777344,-349.27304077148,36.66028213501,30.436424255371),
		spawn = vec4(-1256.2485351563,-366.36083984375,36.495769500732,355.48330688477),
		spin = true,
		restock = vec4(-1241.8355712891,-328.19290161133,37.422836303711,297.9235534668),
		cashier = vec3(-1252.7078857422,-348.5173034668,36.90762),
		blip = {
			id = 402, colour = 69, scale = 0.8
		},
		price = 3000000,
		supplieritem = MultiCategory(
			{['boats'] = true, ['planes'] = true}, -- blacklisted types
			{
				--['boats'] = true
			}, -- whitelisted types, if you want to whitelist only, doing whitelist will disable category table below
			Vehicles.Annis,
			Vehicles.Shitzu
		),
		camerasetting = {offset = vec3(0.0,1.0,0.0), fov = -10},

		showcase = {
			[1] = {
				coord = vec3(-1262.4072265625,-356.31912231445,37.01580), 
				label = 'Spot 1',
				position = vec4(-1263.5510253906,-353.92984008789,36.510929107666,208.12538146973),
			},
			[2] = {
				coord = vec3(-1267.3598632813,-357.88278198242,37.1833), 
				label = 'Spot 2',
				position = vec4(-1267.8084716797,-356.44583129883,36.697582244873,219.08364868164),

			},
			[3] = {
				coord = vec3(-1267.1409912109,-361.76306152344,36.941), 
				label = 'Spot 3',
				position = vec4(-1269.6141357422,-362.91970825195,37.11107635498,297.50491333008),
			},
		}
	},
	[3] = { -- boat shop
		--groups = 'police',
		moneytype = 'money',
		type = 'vehicle',
		label = 'Premium Boat Shop',
		coord = vec3(-752.83978271484,-1510.9036865234,5.0079083),
		purchase = vec4(-797.05767822266,-1503.3923339844,0.41423982381821,104.68099975586),
		spawn = vec4(-810.53790283203,-1517.4093017578,-0.052975848317146,282.99340820313),
		spin = true,
		restock = vec4(-742.36212158203,-1498.0222167969,5.022264957428,115.97137451172),
		cashier = vec3(-759.65838623047,-1515.3922119141,4.976915),
		blip = {
			id = 402, colour = 69, scale = 0.8
		},
		price = 3000000,
		supplieritem = MultiCategory(
			{}, -- blacklisted types
			{['boats'] = true} -- whitelisted types, if you want to whitelist only, doing whitelist will only show whats in whitelisted
		),
		camerasetting = {offset = vec3(0.0,0.7,0.0), fov = 1}
	},
}
