Config = {}

-- money -- 
Config.Money =  2500 -- the money you will earn after reviving the ped
Config.currency = "$"
Config.JobMoney = false -- if you want a society to earn money (link with the job in the JobRequire)

-- time --
Config.TimeMin = 300 -- Time in Milisecond wile the player will wait minimum to find a patient
Config.TimeMax = 1700 -- Time in Milisecond wile the player will wait maximum to find a patient

-- start method --
Config.UseCommand = "AmbulanceStart" -- Set it to false if you dont want to use it by a command (need to restart your server to works)
Config.UseItem = false -- Set a object to start the job (example : Config.UseItem = "ticket" ) you need to restart the server to apply an item 
Config.JobRequire = "ambulance" -- set a job between "" if you  want to check the job of the player (need to restart the script or reconnect to refresh your job in the script)
Config.Zone = vector4(301.17147, -574.41553, 42.26463, 117.98149) -- if you want to start it with a npc (set it to false if you dont want to)
Config.pedhash = "s_m_m_doctor_01" -- the hash of the npc 

-- vehicles -- 
Config.CheckVehicle = true
Config.ProgressBar = true -- Set it to false if you dont want to use ProgressBar (it's a dependency and it's optional)
Config.VehicleAuthorised = { -- only if CheckVehicle is true (you can add a line and put all the vehicles models you want to be allowed if they have 4 doors)
    "emsnspeedo",
}

Config.Webhook = true -- a webhook to see all the runs done by players working with qb-smallressources

Config.Language = "EN" -- FR or EN by default 
Config.Translation = {
    ["FR"] = {
        ["Start"] = "Appuiez sur [E] pour commencer le run d'ambulancier",
        ['JobCheck'] = "Vous n'avez pas le job requis",
        ['VehicleCheck'] = "Vous devez être dans un ~g~véhicule ~s~autorisé",
        ["StartRun"] = "Vous avez commencé votre run",
        ["StopRun"] = "Vous avez terminé votre run",
        ['Drive'] = "Conduisez à la recherche d'un ~y~patient",
        ['Found'] = "Un citoyen fait un malaise, voici sa position",
        ["InCar"] = "Remontez dans votre véhicule",
        ['Save'] = "Sauve le patient",
        ["Money"] = "Vous avez gagner ",
        ["PressForSave"] = "Appuiez sur [E] pour sauver le patient",
        ["Saving"] = "Sauve le patient...",
        ["Customer"] = "Client",
        ["thanks"] = "Merci !",
        ["Central"] = "Centrale d'appel",
        ["Webhook"] = " a terminé un run et a gagné : ",
    },
    ["EN"] = {
        ["Start"] = "Press [E] to start the ambulance job",
        ['JobCheck'] = "You don't have the right job",
        ['VehicleCheck'] = "You have to be in an ~g~authorized~s~ car",
        ["StartRun"] = "You begin your work",
        ["StopRun"] = "You stop to work",
        ['Drive'] = "Drive to Patient Search",
        ['Found'] = "A citizen get fainted, here is his position",
        ["InCar"] = "Get back in your vehicle",
        ['Save'] = "Saves the patient",
        ["Money"] = "You earn ",
        ["PressForSave"] = "Press [E] to save the patient",
        ["Saving"] = "Saves the patient...",
        ["Customer"] = "Customer",
        ["thanks"] = "Thanks !",
        ["Central"] = "Call center",
        ["Webhook"] = " has done a run and earn : "
    }
}
Config.Run = {
    peds = {
        'a_f_m_beach_01','a_f_m_bevhills_01','a_f_m_bevhills_02','a_f_m_bodybuild_01','a_f_m_business_02',
        'a_f_m_fatwhite_01','a_f_y_bevhills_02','a_f_y_bevhills_03','a_f_y_clubcust_02','a_f_y_clubcust_03',
        'a_m_m_beach_01','a_m_m_beach_02','a_m_m_bevhills_01','a_m_m_bevhills_02','a_m_m_stlat_02',
        'a_m_m_tranvest_01','a_m_y_beach_03','a_m_y_business_02','a_m_y_dhill_01','a_m_y_golfer_01',
        'a_m_y_musclbeac_01','a_m_y_vinewood_01','a_m_y_smartcaspat_01','a_m_y_vinewood_03','a_m_y_vinewood_04',
    },
    destination = { -- You can add or remove position of patient as you wish
        -- nord est
        vector3(-2074.34,-327.10,12.32),
        vector3(-1856.25,-351.02,48.84),
        vector3(-1369.30,55.03,52.07),
        vector3(-1422.25,-207.34,45.50),
        vector3(-1457.98,-338.19,43.66),
        vector3(-934.51,-213.07,37.09),
        vector3(-1033.64,-411.71,38.62),
        vector3(-1272.46,-696.0,23.47),
        vector3(-1290.59,-853.36,13.93),
        vector3(-838.26,-612.48,28.03),
        -- nord ouest
        vector3(-142.92,231.15,93.95),
        vector3(-477.79,220.96,82.14),
        vector3(-419.37,145.36,64.16),
        vector3(302.38,137.81,102.83),
        vector3(127.38,343.72,110.95),
        vector3(645.06,267.41,102.22),
        vector3(928.74,54.97,80.10),
        vector3(1269.65, -705.47, 64.67),
        vector3(1125.56,-646.59,55.72),
        vector3(760.76,-816.41,25.31),
        -- sud est
        vector3(-885.29,-2152.95,7.93),
        vector3(-1036.0,-2501.43,19.17),
        vector3(-702.43,-2277.90,12.46),
        vector3(-1045.83,-2724.83,12.76),
        vector3(-172.01,-2145.83,15.84),
        vector3(-228.37,-2027.37,26.76),
        vector3(-705.47,-1400.37,4.15),
        vector3(-946.31,-1195.05,3.99),
        vector3(-822.89,-1096.05,10.15),
        vector3(-1142.42,-1352.68,4.04),
        -- sud ouest
        vector3(-778.29,-2378.08,13.53),
        vector3(902.39,-2237.90,29.54),
        vector3(806.36,-2024.89,28.24),
        vector3(898.55,-1725.04,31.16),
        vector3(675.41,-2729.83,5.03),
        vector3(-259.63,-2656.64,5.17),
        vector3(790.37,-2978.21,5.03),
        vector3(1090.99,-3342.07,5.19),
        vector3(833.35,-1036.77,25.99),
        vector3(-50.63,-1115.72,25.44),
    },

}