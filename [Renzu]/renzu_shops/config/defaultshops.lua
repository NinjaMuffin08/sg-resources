return {
    BlackMarketArms = {
         locations = {
              [1] = vec3(591.679871, -3280.022705, 6.069561),
              [2] = vec3(309.089996, -913.750000, 56.459999),
              [3] = vec3(18.800390, -1098.874023, 29.854670),
            },
         name = "Black Market (Arms)",
         moneytype = "black_money",
       },
    Medicine = {
         name = "Medicine Cabinet",
         groups = "ambulance",
         blip = {
              id = 403,
              colour = 69,
              scale = 0.8,
            },
         locations = {
              [1] = vec3(306.368713, -601.513916, 43.284061),
            },
         inventory = {
              [1] = {
                   price = 26,
                   name = "medikit",
                 },
              [2] = {
                   price = 5,
                   name = "bandage",
                 },
            },
         moneytype = "money",
       },
    General = {
         blip = {
              id = 59,
              colour = 69,
              scale = 0.8,
            },
         name = "Shop 24/7",
         locations = {
              [1] = vec3(25.700001, -1347.300049, 29.490000),
              [2] = vec3(-3038.709961, 585.900024, 7.900000),
              [3] = vec3(-3241.469971, 1001.140015, 12.830000),
              [4] = vec3(1728.660034, 6414.160156, 35.029999),
              [5] = vec3(1697.989990, 4924.399902, 42.060001),
              [6] = vec3(1961.479980, 3739.959961, 32.340000),
              [7] = vec3(547.789978, 2671.790039, 42.150002),
              [8] = vec3(2679.250000, 3280.120117, 55.240002),
              [9] = vec3(2557.939941, 382.049988, 108.620003),
              [10] = vec3(373.549988, 325.559998, 103.559998),
            },
         moneytype = "money",
       },
    YouTool = {
         name = "YouTool",
         blip = {
              id = 402,
              colour = 69,
              scale = 0.8,
            },
         locations = {
              [1] = vec3(2748.000000, 3473.000000, 55.669998),
              [2] = vec3(342.989990, -1298.260010, 32.509998),
            },
         inventory = {
              [1] = {
                   price = 10,
                   name = "lockpick",
                 },
            },
         moneytype = "money",
       },
    PoliceArmoury = {
         name = "Police Armoury",
         groups = "police",
         blip = {
              id = 110,
              colour = 84,
              scale = 0.8,
            },
         locations = {
              [1] = vec3(451.510010, -979.440002, 30.680000),
            },
         inventory = {
              [1] = {
                   price = 5,
                   name = "ammo-9",
                 },
              [2] = {
                   price = 5,
                   name = "ammo-rifle",
                 },
              [3] = {
                   price = 200,
                   name = "WEAPON_FLASHLIGHT",
                 },
              [4] = {
                   price = 100,
                   name = "WEAPON_NIGHTSTICK",
                 },
              [5] = {
                   license = "weapon",
                   name = "WEAPON_PISTOL",
                   metadata = {
                        serial = "POL",
                        registered = "true",
                      },
                   price = 500,
                 },
              [6] = {
                   name = "WEAPON_CARBINERIFLE",
                   metadata = {
                        serial = "POL",
                        registered = "true",
                      },
                   license = "weapon",
                   grade = 3,
                   price = 1000,
                 },
              [7] = {
                   name = "WEAPON_STUNGUN",
                   metadata = {
                        serial = "POL",
                        registered = "true",
                      },
                   price = 500,
                 },
            },
         moneytype = "money",
       },
    Ammunation = {
         blip = {
              id = 110,
              colour = 69,
              scale = 0.8,
            },
         name = "Ammunation",
         locations = {
              [1] = vec3(22.559999, -1109.890015, 29.799999),
              [2] = vec3(-662.179993, -934.960999, 21.829000),
              [3] = vec3(810.250000, -2157.600098, 29.620001),
              [4] = vec3(1693.439941, 3760.159912, 34.709999),
              [5] = vec3(-330.239990, 6083.879883, 31.450001),
              [6] = vec3(252.630005, -50.000000, 69.940002),
              [7] = vec3(2567.689941, 294.380005, 108.730003),
              [8] = vec3(-1117.579956, 2698.610107, 18.549999),
              [9] = vec3(842.440002, -1033.420044, 28.190001),
            },
         moneytype = "money",
       },
    VehicleShop = {
         name = "Vehicle Shop",
         blip = {
              id = 595,
              colour = 38,
              scale = 0.8,
            },
         locations = {
              [1] = vec3(-54.346001, -1097.284058, 26.422001),
              [2] = vec3(-1249.925415, -353.434296, 36.907612),
              [3] = vec3(-801.331055, -1513.058228, 1.595214),
            },
         type = "vehicle",
         moneytype = "money",
       },
  }