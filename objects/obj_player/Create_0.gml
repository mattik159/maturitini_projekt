base_move_speed = 1;
move_speed = base_move_speed;

tilemaps = [layer_tilemap_get_id("Tiles_Col"), layer_tilemap_get_id("Tiles_Castle"), layer_tilemap_get_id("Tiles_Castle_House")];

total_hp = 100;
hp = total_hp;

damage = 5;

level = 1;
xp = 0;
xp_require = 200;

stamina_total = 100;
stamina = stamina_total;
running = false;
dashing = false;
dash_offset = 0;

attack_inst = noone;

hotbar_size = 6;
inventory = []
is_inv_opened = false;
for (var i = 0; i < 4; i++)
{
    array_push(inventory,array_create(hotbar_size,noone));
}

selected_slot = [0, 0];
in_hand = inventory[selected_slot[0]][selected_slot[0]];
last_in_hand = selected_slot;

armor_length = 5;
armor_positions = ["helmet","chestplate","pants","boots","gloves"];
armor = {"helmet":noone,
         "chestplate": noone,
         "pants":noone,
         "boots":noone,
         "gloves":noone}

player_money = 0;

facing = 1;

near_station = ["in_hand"];

var wood = "wood";
var stone = "stone";
for (var i = 0; i < 25; i++){
    add_items(stone)
}
for (var i = 0; i < 12; i++){
    add_items(wood)
}

function add_xp_money(xp_amount, money)
{
    xp += xp_amount;
    player_money += money;
    if (xp >= xp_require)
    {
        xp -= xp_require;
        xp_require *= 1.5;
        level++;
        total_hp++;
        hp = total_hp;
        stamina_total++;
    }
}

function add_items(_item_ids){
    if (typeof(_item_ids) == "array"){
        for (var i = 0; i < array_length(_items); i++){
            continue;
        }
    } else {
        add_items_to_inv(_item_ids);
    }
}

function add_items_to_inv(_item){
    unlock(_item);
    var item_object = global.item_db[$ _item];
    var item_slot_row = 0;
    var item_slot_column = 0;
    var empty_slot = [];
    var is_empty = false;
    var is_in_inv = false;
    for (var row = 0; row < array_length(inventory); row++){
        for (var col = 0; col < hotbar_size; col++){
            if (inventory[row][col] == noone){
                if (!is_empty){
                    is_empty = true;
                    array_push(empty_slot, row);
                    array_push(empty_slot, col);
                    if (is_in_inv){
                        break;
                    }
                }
            } else {
                if (inventory[row][col].sprite == item_object.sprite){
                    is_in_inv = true;
                    if (inventory[row][col].stackable){
                        item_slot_column = col;
                        item_slot_row = row;
                        if (is_empty){
                            break;
                        }
                    }
                    
                }
            }
        }
        if (is_in_inv && is_empty){
            break;
        }
    }
    
    if (is_in_inv && item_object.stackable){
        inventory[item_slot_row][item_slot_column].amount += 1; 
    } else{
        if (item_object.type == "material"){
            inventory[empty_slot[0]][empty_slot[1]] = new Material(item_object.sprite,item_object.object,item_object.name, item_object.item_id, 1);
        }
        if (item_object.type == "food"){
            inventory[empty_slot[0]][empty_slot[1]] = new Food(item_object.sprite, item_object.object, item_object.name, item_object.item_id, item_object.effect, item_object.effect_level, 1);
        }
        if (item_object.type =="weapon"){
            inventory[empty_slot[0]][empty_slot[1]] = new Weapon(item_object.sprite, item_object.object, item_object.name, item_object.item_id, item_object.damage, item_object.cooldown, item_object.attack, 1, item_object.subtype);
        }
        if (item_object.type == "station"){
            inventory[empty_slot[0]][empty_slot[1]] = new Station(item_object.sprite, item_object.object, item_object.name, item_object.item_id, 1);
        }
        if (item_object.type = "potion"){
            inventory[empty_slot[0]][empty_slot[1]] = new Potion(item_object.sprtie, item_object.object, item_object.name, item_object.item_id, item_object.cooldown, item_object.subtype, item_object.add_amount, 1);
        }
    }
}

function add_loot(_loot_table, _loot_table_keys){
    var total_chance = 100;
    var loot_table_len = array_length(_loot_table_keys);
    var _exp = 0;
    var money = 0;
    for (var i = 0; i < loot_table_len;i++)
    {
        if (_loot_table_keys[i] == "exp"){
            _exp = struct_get(_loot_table,_loot_table_keys[i]).amount;
        }
        else if (_loot_table_keys[i] == "money"){
            money = struct_get(_loot_table,_loot_table_keys[i]).amount;
        }
    }
    
    add_xp_money(_exp, money);
    
    var current_chance = 0;
    for (var i = 0; i < array_length(_loot_table_keys); i++) {
        var roll = random(total_chance);
        var key = _loot_table_keys[i];
        var item = struct_get(_loot_table, key);
        if (key != "money" && key != "exp"){
            var item_object = struct_get(global.item_db, key);
            var item_slot_row = 0;
            var item_slot_column = 0;
            var empty_slot = [];
            var is_empty = false;
            var is_in_inv = false;
            for (var row = 0; row < array_length(inventory); row++){
                for (var col = 0; col < hotbar_size; col++){
                    if (inventory[row][col] == noone){
                        if (!is_empty){
                            is_empty = true;
                            array_push(empty_slot, row);
                            array_push(empty_slot, col);
                            if (is_in_inv){
                                break;
                            }
                        }
                    } else {
                        if (inventory[row][col].sprite == item_object.sprite){
                            is_in_inv = true;
                            if (inventory[row][col].stackable){
                                item_slot_column = col;
                                item_slot_row = row;
                                if (is_empty){
                                    break;
                                }
                            }
                            
                        }
                    }
                }
                if (is_in_inv && is_empty){
                    break;
                }
            }
            
            if (item.chance == 100){
                add_loot_item_to_inv(item, item_object, item_slot_row, item_slot_column, empty_slot[0], empty_slot[1], is_in_inv);
                unlock(key);
            } else {
                current_chance += item.chance;
                if (roll <= current_chance){
                    unlock(key);
                    add_loot_item_to_inv(item, item_object, item_slot_row, item_slot_column, empty_slot[0], empty_slot[1], is_in_inv);
                }
            }
        }
    }
}

function add_loot_item_to_inv(_item,_item_object, _row, _col, _empty_row, _empty_col, _is_in_inv){
    var item_amount = irandom_range(1, _item.amount);
    if (_is_in_inv && _item_object.stackable){
        inventory[_row][_col].amount += item_amount; 
    } else{
        if (_item_object.type == "material"){
            inventory[_empty_row][_empty_col] = new Material(_item_object.sprite,_item_object.object,_item_object.name, _item_object.item_id, item_amount);
        }
        if (_item_object.type == "food"){
            inventory[_empty_row][_empty_col] = new Food(_item_object.sprite, _item_object.object, _item_object.name, _item_object.item_id, _item_object.effect, _item_object.effect_level, item_amount);
        }
        if (_item_object.type =="weapon"){
            inventory[_empty_row][_empty_col] = new Weapon(_item_object.sprite, _item_object.object, _item_object.name, _item_object.item_id, _item_object.damage, _item_object.cooldown, _item_object.attack, item_amount, _item_object.subtype);
        }
    }
}

function check_for_delete(_row, _col){
    if (inventory[_row][_col].amount <= 0){
        inventory[_row][_col] = noone;
    }
}


clicked_inv_slot = false;
holding_item = false;
slot_hovering = NaN;

base_dx = 16; // direction x pro bary
base_dy = 16; // direction y pro bary

barw = 256; // šířka baru
barh = 32; // výška baru

item_slot_size = 80;
armor_background_w = 213;
armor_background_h = 320;
crafting_background_w = 320;
crafting_background_h = 480;

slot_x = base_dx + barw;
slot_y = base_dy;

inv_x = base_dx + barw + item_slot_size*hotbar_size;
inv_y = base_dy + item_slot_size;

inv_hovering = noone;

crafting_background_x = 0;
crafting_background_y = display_get_height()/4;

recepie_y = crafting_background_y + 10;
recepie_x = crafting_background_x + 20;

crafting_slots = [];

recepie_offset = 0;
crafting_hovering = noone
crafting_slot_hovering = noone;

shovel_inst_x = 0;
shovel_inst_y = 0;
time_to_shovel = 120;
shovel_time = 0;
can_shovel = false;