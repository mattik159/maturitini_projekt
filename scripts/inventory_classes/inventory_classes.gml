function Weapon(_sprite, _object, _name, _id, _damage, _cooldown, _attack, _amount, _subtype) : Item(_sprite, _object, _name, _id) constructor {
    damage = _damage;
    item_type = "weapon";
    subtype = _subtype;
    cooldown = _cooldown;
    attack = _attack;
    amount = _amount;
    stackable = false;
}

function Potion(_sprite, _object, _name, _id, _cooldown, _subtype, _add_amount, _amount) : Item(_sprite, _object, _name, _id) constructor {
    item_type = "potion";
    subtype = _subtype;
    cooldown = _cooldown;
    add_amount = _add_amount;
    amount = _amount;
    stackable = true;
}

function Food(_sprite, _object, _name, _id, _effect, _effect_level, _amount) : Item(_sprite, _object, _name, _id) constructor {
    effect = _effect;
    effect_level = _effect_level;
    item_type = "food";
    amount = _amount;
    stackable = true;
}

function Material(_sprite, _object, _name, _id, _amount) : Item(_sprite, _object, _name, _id) constructor {
    amount = _amount;
    item_type = "material";
    stackable = true;
}

function  Tool(_sprite, _object, _name, _id, _amount, _subtype) : Item(_sprite, _object, _name, _id) constructor {
    amount = _amount;
    subtype = _subtype;
    item_type = "tool";
    stackable = false;
}

function Armor(_sprite, _object, _name, _id, _amount, _subtype, _armor) : Item(_sprite, _object, _name, _id) constructor {
    amount = _amount;
    subtype = _subtype;
    armor = _armor;
    item_type = "armor";
    stackable = false;
}

function Station(_sprite, _object, _name, _id, _amount) : Item(_sprite, _object, _name, _id) constructor {
    amount = _amount;
    item_type = "station";
    stackable = true;
}

global.item_db = {
    long_sword: {
        name: "Long sword",
        item_id: "long_sword",
        type: "weapon",
        subtype: "sword",
        object: obj_long_sword,
        sprite: spr_long_sword,
        damage: 10,
        cooldown: 30,
        attack: obj_attack,
        stackable: false
    },
    short_sword: {
        name: "Short sword",
        item_id: "short_sword",
        type: "weapon",
        subtype: "sword",
        object: obj_short_sword,
        sprite: spr_short_sword,
        damage: 5,
        cooldown: 15,
        attack: obj_attack,
        stackable: false
    },
    wood: {
        name: "Dřevo",
        item_id: "wood",
        type: "material",
        object: noone,
        sprite: spr_wood,
        stackable: true
    },
    apple: {
        name: "Jablko",
        item_id: "apple",
        type: "food",
        object: noone,
        sprite: spr_apple,
        effect: "add_stamina",
        effect_level: 5,
        stackable: true
    },
    stone: {
        name: "Kámen",
        item_id: "stone",
        type: "material",
        object: noone,
        sprite: spr_stone,
        stackable: true
    },
    string: {
        name: "Provázek",
        item_id: "string",
        type: "material",
        object: noone,
        sprite: spr_string,
        stackable: true
    },
    flax: {
        name: "Len",
        item_id: "flax",
        type: "material",
        object: noone,
        sprite: spr_flax,
        stackable: true
    },
    leather_helmet:{
        name: "Kožená helma",
        item_id: "leather_helmet",
        type: "armor",
        subtype: "helmet",
        object: noone,
        sprite: spr_leather_helmet,
        armor: 3,
        stackable: false
    },
    leather_boots:{
        name: "Kožené boty",
        item_id: "leather_boots",
        type: "armor",
        subtype: "boots",
        object: noone,
        sprite: spr_leather_boots,
        armor: 3,
        stackable: false
    },
    leather_gloves:{
        name: "Kožené rukavice",
        item_id: "leather_gloves",
        type: "armor",
        subtype: "gloves",
        object: noone,
        sprite: spr_leather_gloves,
        armor: 2,
        stackable: false
    },
    leather_chestplate:{
        name: "Kožený hrudník",
        item_id: "leather_chestplate",
        type: "armor",
        subtype: "chestplate",
        object: noone,
        sprite: spr_leather_chestplate,
        armor: 10,
        stackable: false
    },
    leather_pants:{
        name: "Kožené kalhoty",
        item_id: "leather_pants",
        type: "armor",
        subtype: "pants",
        object: noone,
        sprite: spr_leather_pants,
        armor: 7,
        stackable: false
    },
    workbench:{
        name: "Pracovní stůl",
        item_id: "workbench",
        type: "station",
        object: obj_workbench,
        sprite: spr_workbench,
        stackable: true
    },
    healing_flower: {
        name: "Léčivá kytka",
        item_id: "healing_flower",
        type: "material",
        object:obj_healing_flower,
        sprite:spr_healing_flower,
        stackable: true
    },
    mana_flower: {
        name: "Mana kytka",
        item_id: "mana_flower",
        type: "material",
        object: obj_mana_flower,
        sprite: spr_mana_flower,
        stackable: true
    },
    flax: {
        name: "Len",
        item_id: "flax",
        type: "material",
        object: obj_flax,
        sprite: spr_flax,
        stackable: true
    },
    healing_potion: {
        name: "Lečivý lektvar",
        item_id: "healing_potion",
        type: "potion",
        subtype: "heal",
        object: noone,
        sprrite: spr_healing_potion,
        cooldown: 1800,
        add_amount: 30,
        stackable: true
    },
    furnace: {
        name: "Pec",
        item_id: "furnace",
        type: "station",
        object: obj_furnace,
        sprite: spr_furnace,
        stackable: true
    },
    iron_ore: {
        name: "Železná ruda",
        item_id: "iron_ore",
        type: "material",
        object: noone,
        sprite: spr_iron_ore,
        stackable: true
    },
    iron_ingot: {
        name: "Železný ingot",
        item_id: "iron_ingot",
        type: "material",
        object: noone,
        sprite: spr_iron_ingot,
        stackable: true
    },
    alchemy_table: {
        name: "Chemický stůl",
        item_id: "alchemy_table",
        type: "station",
        object: obj_alchemy_table,
        sprite: spr_alchemy_table,
        stackable: true
    },
    sand: {
        name: "Písek",
        item_id: "sand",
        type: "material",
        object: noone,
        sprite: spr_sand,
        stackable: true
    },
    glass: {
        name: "Sklo",
        item_id: "glass",
        type: "material",
        object: noone,
        sprite: spr_glass,
        stackable: true
    },
    stone_arrow: {
        name: "Kamenný šíp",
        item_id: "stone_arrow",
        type: "material",
        object: noone,
        sprite: spr_arrow,
        stackable: true
    },
    basic_bow: {
        name: "Klasický luk",
        item_id: "basic_bow",
        type: "weapon",
        subtype: "bow",
        object: noone,
        sprite: spr_bow,
        damage: 5,
        cooldown: 60,
        attack: obj_arrow_player,
        stackable: false
    },
    campfire: {
        name :"Ohniště",
        item_id: "campfire",
        type: "station",
        object: obj_campfire,
        sprite: spr_campfire,
        stackable: true
    }
}