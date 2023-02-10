--[[ ===================================================== ]]--
--[[          QBCore Loot Peds System by MaDHouSe          ]]--
--[[ ===================================================== ]]--

-- Placeholder (Don't change this)
Config = {}                          

-- Use qb-target interactions (don't change this)
Config.UseTarget = true

-- if you want to loot dead peds by default, set this true
Config.EnableOnStart = true 

-- if you want to use weapons or not
Config.UseNormalWeaponLoot = true
Config.UseHeavyWeaponLoot = true


-- if you want Cash Chance when looting a dead corps
Config.UseCash = true 
Config.CashChance = 1                   -- set lowe reduse the change of getting money
Config.CashReward = math.random(25, 250) -- amount of money you can get
Config.CashType = 'cash'                 -- use cash or bank

-- Admin commands
Config.Commands = {
    toggle = 'pedloot', -- (/pedloot On/ /pedloot Off)
}

-- Around 106 peds that react to events with Target Eye
Config.PedModels = {
	"u_m_m_prolsec_01",
    "a_m_m_hillbilly_01",
    "a_m_m_polynesian_01",
    "a_m_m_skidrow_01",
    "a_m_m_salton_02",
    "a_m_m_fatlatin_01",
	"a_m_m_beach_01",
    "a_m_m_farmer_01",
    "a_m_m_malibu_01",
    "a_m_m_rurmeth_01",
    "a_m_y_salton_01",
    "a_m_m_skater_01",
    "a_m_m_tennis_01",
	"a_m_o_acult_02",
    "a_m_y_genstreet_01",
    "a_m_y_genstreet_02",
    "a_m_y_methhead_01",
    "a_m_y_stlat_01",
    "s_m_m_paramedic_01",
	"s_m_y_cop_01",
    "s_m_y_prismuscl_01",
    "s_m_y_prisoner_01",
    "a_m_m_og_boss_01",
    "a_m_m_eastsa_02",
    "a_f_y_juggalo_01",
	"a_c_deer",
	"a_c_boar",
	"a_c_coyote",
	"a_c_mtlion",
	"a_c_pig",
	"a_c_rabbit_01",
	"a_c_rat",
	"a_c_cow",
	"a_c_cat",
	"a_c_chickenhawk",
	"a_c_chimp",
	"a_c_chop",
	"a_c_cormorant",
	"a_c_crow",
	"a_c_dolphin",
	"a_c_fish",
	"a_c_hen",
	"a_c_humpback",
	"a_c_husky",
	"a_c_killerwhale",
	"a_c_pigeon",
	"a_c_poodle",
	"a_c_pug",
	"a_c_retriever",
	"a_c_rhesus",
	"a_c_rottweiler",
	"a_c_seagull",
	"a_c_sharkhammer",
	"a_c_sharktiger",
	"a_c_shepherd",
	"a_c_stingray",
	"a_c_westy", 
}

-- Placeholder (Don"t change this)
Config.Items = {  
    ["Basic"] = {
        [1] = {
            name = "hotdog",
        },
        [2] = {
            name = "money",
        },
    },
    ["Ammo"] = {
        [1] = {
            name = "panties",
        },
        [2] = {
            name = "lockpick",
        },
        [3] = {
            name = "water",
        },
        [4] = {
            name = "Repairkit",
        },
        [5] = {
            name = "sandwich",
        }, 
    },
    ["NormalWeapons"] = {
        [1] = {
            name = "joint",
        },
    },
    ["HeavyWeapons"] = {
        [1] = {
            name = "firstaid",
        },
    }
}
