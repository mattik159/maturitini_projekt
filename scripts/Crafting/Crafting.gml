global.unlocks_recepies = { "wood": ["workbench","campfire","stone_pickaxe", "stone_axe", "stone_shovel","glass", "iron_ingot","stone_arrow","basic_bow","cauldron"],
                            "stone": ["campfire", "furnace", "stone_pickaxe", "stone_axe", "stone_shovel", "stone_arrow",],
                            "iron_ore": ["iron_ingot"],
                            "iron_ingot": ["cauldron", "alchemy_table", "leather_helmet", "leather_chestplate", "leather_pants", "leather_boots", "leather_gloves"],
                            "sand": ["glass"],
                            "glass": ["alchemy_table", "healing_potion", "mana_potion"],
                            "healing_flower": ["healing_potion"],
                            "mana_flower": ["mana_potion"],
                            "leather":["leather_helmet", "leather_chestplate", "leather_pants", "leather_boots", "leather_gloves"],
                            "flax": ["string"],
                            "string": ["basic_bow"]};
global.discoverd_items = []

global.recepies_keys = ["workbench","campfire","furnace","iron_ingot",
                        "stone_pickaxe","stone_axe","stone_shovel","glass",
                        "alchemy_table","healing_potion","mana_potion","leather_helmet",
                        "leather_chestplate","leather_pants","leather_boots", "leather_gloves",
                        "stone_arrow","basic_bow","cauldron","string"]
global.recepies = {
    "workbench":{
        "wood": 10,
        "station": "in_hand",
        "unlocked": false
        },
    "campfire":{
        "wood" : 4,
        "stone" : 8,
        "station": "in_hand",
        "unlocked": false
        },
    "furnace": {
        "wood": 2,
        "stone": 25,
        "station": "workbench",
        "unlocked": false
        },
    "iron_ingot":{
        "iron_ore": 2,
        "wood": 2,
        "station": "furnace",
        "unlocked": false
        },
    "stone_pickaxe":{
        "wood": 2,
        "stone": 5,
        "station": "workbench",
        "unlocked": false
        },
    "stone_axe":{
        "wood": 2,
        "stone": 6,
        "station": "workbench",
        "unlocked": false
        },
    "stone_shovel":{
        "wood": 2,
        "stone": 3,
        "station": "workbench",
        "unlocked": false
        },
    "glass":{
        "sand": 2,
        "wood": 1,
        "station": "furnace",
        "unlocked": false
        },
    "alchemy_table":{
        "glass": 5,
        "wood": 8,
        "iron_ingot": 2,
        "station": "workbench",
        "unlocked": false
        },
    "healing_potion":{
        "glass": 2,
        "healing_flower": 1,
        "station": "alchemy_table",
        "unlocked": false
        },
    "mana_potion":{
        "glass": 2,
        "mana_flower": 1,
        "station": "alchemy_table",
        "unlocked": false
        },
    "leather_helmet":{
        "leather": 6,
        "iron_ingot": 2,
        "station": "workbench",
        "unlocked": false
        },
    "leather_chestplate":{
        "leather": 10,
        "iron_ingot": 4,
        "station": "workbench",
        "unlocked": false  
        },
    "leather_pants":{
        "leather": 9,
        "iron_ingot": 3,
        "station": "workbench",
        "unlocked": false
        },
    "leather_boots":{
        "leather": 6,
        "iron_ingot": 2,
        "station": "workbench",
        "unlocked": false
        },
    "leather_gloves":{
        "leather": 5,
        "iron_ingot": 2,
        "station": "workbench",
        "unlocked": false
        },
    "stone_arrow":{
        "stone": 1,
        "wood": 1,
        "station": "in_hand",
        "unlocked": false
        },
    "basic_bow":{
        "wood": 2,
        "string": 1,
        "station": "in_hand",
        "unlocked": false
        },
    "cauldron":{
        "campfire": 1,
        "iron_ingot": 8,
        "wood": 4,
        "station": "workbench",
        "unlocked": false  
        },
    "string":{
        "flax": 2,
        "station": "in_hand",
        "unlocked": false
    }
};

global.unlocked_recepies = 0;

function unlock(_item){
    if (array_contains(global.discoverd_items, _item)) return;
    
    array_push(global.discoverd_items, _item);
    
    var recepies_for_unlock = global.unlocks_recepies[$ _item];
    
    for (var i = 0; i < array_length(recepies_for_unlock); i++){
        var recepie = global.recepies[$ recepies_for_unlock[i]]
        if (!recepie.unlocked){
            global.unlocked_recepies += 1;
            recepie.unlocked = true;
        }
    }
    
    obj_player.crafting_slots = [];
    for (var i = 0; i < array_length(global.recepies_keys); i++){
        if (global.recepies[$ global.recepies_keys[i]].unlocked){
            if (array_length(obj_player.crafting_slots) < 5){
                if (array_contains(obj_player.near_station, global.recepies[$ global.recepies_keys[i]].station)){
                    array_push(obj_player.crafting_slots, global.recepies_keys[i]);
                }
            } else {
                break;
            }
        }
    }
}