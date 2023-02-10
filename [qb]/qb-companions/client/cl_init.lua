Animations = {
    ["a_c_shepherd"] = {
        ["Lay"] = {
            animationDict = "creatures@rottweiler@amb@sleep_in_kennel@",
            task = "sleep_in_kennel",
        },
        ["Trick"] = {
            animationDict = "creatures@rottweiler@tricks@",
            task = "paw_right_enter",
            taskWait = "2000",
            taskExit = "paw_right_exit",
        },
        ["Sit"] = {
            animationDict = "creatures@rottweiler@amb@world_dog_sitting@base",
            task = "base",
        },
        ["Intimidate"] = {
            animationDict = "creatures@rottweiler@melee@streamed_taunts@",
            task = "taunt_01",
        }
    },
    ["a_c_cat_01"] = {
        ["Lay"] = {
            animationDict = "creatures@cat@amb@world_cat_sleeping_ground@base",
            task = "base",
        },
        ["Trick"] = {
            animationDict = "creatures@cat@amb@peyote@enter",
            task = "enter",
        },
        ["Sit"] = {
            animationDict = "creatures@cat@player_action@",
            task = "action_a",
        }
    },
    ["a_c_pug"] = {
        ["Sit"] = {
            animationDict = "creatures@pug@amb@world_dog_sitting@base",
            task = "base",
        },
        ["Intimidate"] = {
            animationDict = "creatures@pug@amb@world_dog_barking@base",
            task = "base",
        }
    },
    ["a_c_retriever"] = {
        ["Lay"] = {
            animationDict = "creatures@retriever@amb@world_dog_sitting@idle_a",
            task = "idle_c",
        },
        ["Trick"] = {
            animationDict = "",
            task = "",
        },
        ["Sit"] = {
            animationDict = "creatures@retriever@amb@world_dog_sitting@idle_a",
            task = "idle_a",
        },
        ["Intimidate"] = {
            animationDict = "creatures@retriever@amb@world_dog_barking@base",
            task = "base",
        }
    },
    ["a_c_rat"] = {
        ["Trick"] = {
            animationDict = "creatures@rat@amb@world_rats_eating@idle_a",
            task = "idle_a",
        }
    },
    ["a_c_rottweiler"] = {
        ["Lay"] = {
            animationDict = "creatures@rottweiler@amb@sleep_in_kennel@",
            task = "sleep_in_kennel",
        },
        ["Trick"] = {
            animationDict = "creatures@rottweiler@tricks@",
            task = "beg_enter",
            taskWait = "600",
            taskExit = "beg_exit",
        },
        ["Sit"] = {
            animationDict = "creatures@rottweiler@amb@world_dog_sitting@base",
            task = "base",
        },
        ["Intimidate"] = {
            animationDict = "creatures@rottweiler@melee@streamed_taunts@",
            task = "taunt_01",
        }
    },
    ["a_c_rabbit_01"] = {
        ["Lay"] = {
            animationDict = "creatures@rabbit@player_action@",
            task = "action_a",
        },
        ["Trick"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_c",
        },
        ["Sit"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_b",
        },
        ["Intimidate"] = {
            animationDict = "creatures@rabbit@amb@world_rabbit_eating@idle_a",
            task = "idle_a",
        }
    },
    ["a_c_hen"] = {
        ["Lay"] = {
            animationDict = "creatures@hen@amb@world_hen_standing@idle_a",
            task = "idle_a",
        },
        ["Trick"] = {
            animationDict = "creatures@hen@amb@world_hen_pecking@base",
            task = "base",
        },
        ["Sit"] = {
            animationDict = "creatures@hen@amb@world_hen_pecking@idle_a",
            task = "idle_c",
        },
        ["Intimidate"] = {
            animationDict = "creatures@hen@player_action@",
            task = "action_a",
        }
    }
}

TrunkClasses = {
    [0]  = true, --Coupes  
    [1]  = true, --Sedans  
    [2]  = true, --SUVs  
    [3]  = true, --Coupes  
    [4]  = true, --Muscle  
    [5]  = true, --Sports Classics  
    [6]  = true, --Sports  
    [7]  = true, --Super  
    [8]  = true, --Motorcycles  
    [9]  = true, --Off-road  
    [10] = true, --Industrial  
    [11] = true, --Utility  
    [12] = true, --Vans  
    [13] = true, --Cycles  
    [14] = true, --Boats  
    [15] = true, --Helicopters  
    [16] = true, --Planes  
    [17] = true, --Service  
    [18] = true, --Emergency  
    [19] = true, --Military  
    [20] = true, --Commercial  
    [21] = true, --Trains  
}