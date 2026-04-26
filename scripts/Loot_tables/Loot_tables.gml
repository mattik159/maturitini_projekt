global.loot_tables ={
    cow: {
        leather:{
            amount: 3,
            chance: 30
        }, 
        beef:{
            amount: 3,
            chance: 100
        },
        exp:{
            amount: 10
        }
    }, 
    skeleton:{
        stone_arrow:{
            amount: 2,
            chance: 30
        }, 
        basic_bow:{
           amount: 1,
           chance: 5
        },
        exp: {
            amount: 30
        },
        money: {
            amount: 3
        }
    },
    mild_tree: { 
        wood:{
            amount: 3,
            chance: 100
        },
        apple: {
            amount: 2,
            chance: 20
        },
        exp:{
            amount:5
        }
    },
    goblin: {
        flax:{
            amount: 2,
            chance: 40
        }, 
        string:{
            amount: 2,
            chance: 10
        },
        exp: {
            amount: 40
        },
        money: {
            amount: 10
        }
    },
    rock: {
        stone:{
            amount: 5,
            chance: 100
        },
        exp:{
            amount: 5
        }
    },
    iron: {
        iron_ore:{
           amount: 3,
           chance: 100,
       }, stone:{
           amount: 2,
           chance:50
       },
        exp:{
            amount: 8
        }
    }
};

global.loot_tables_keys = {
    mild_tree: ["wood", "apple", "exp"],
    rock: ["stone", "exp"],
    iron: ["iron_ore", "stone", "exp"],
    goblin: ["flax", "string", "exp", "money"],
    skeleton: ["stone_arrow", "basic_bow", "exp", "money"],
    cow: ["leather", "beef", "exp", "money"]
};

