var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (dashing == false) 
{
    move_and_collide(hor * move_speed, ver * move_speed, tilemaps, undefined, undefined, undefined, move_speed, move_speed);
}

if (keyboard_check_pressed(vk_shift) && stamina > 0){
    running = true
} else  if (stamina <= 0) {
    running = false
}

if (keyboard_check(vk_shift) && stamina > 0 && running)
{
    move_speed = base_move_speed * 1.5;
    running = true;
    if (alarm[0] < 0)
    {
        alarm[0] = 6;
    }    
}
else if (stamina < stamina_total)
{
    move_speed = base_move_speed;
    running = false;
    if (alarm[0] < 0)
    {
        alarm[0] = 6;
    } 
}



var dist = 16
if (hor != 0 || ver != 0){
    if (dashing == false){
        if (running = false) { 
            if (ver > 0) sprite_index = spr_player_walking_front;
            else if (ver < 0) sprite_index = spr_player_walking_back;
            else if (hor > 0) sprite_index = spr_player_walking_right;
            else if (hor < 0) sprite_index = spr_player_walking_left;
        } else {
            if (ver > 0) sprite_index = spr_player_run_front;
            else if (ver < 0) sprite_index = spr_player_run_back;
            else if (hor > 0) sprite_index = spr_player_run_right;
            else if (hor < 0) sprite_index = spr_player_run_left;
        }
    }
    facing = point_direction(0, 0, hor, ver);   
} else {
    if (dashing == false){
        if (sprite_index == spr_player_run_front || sprite_index == spr_player_walking_front) sprite_index = spr_player_standing_front;
        else if (sprite_index == spr_player_run_back || sprite_index == spr_player_walking_back) sprite_index = spr_player_standing_back;
        else if (sprite_index == spr_player_run_right || sprite_index == spr_player_walking_right) sprite_index = spr_player_standing_right;
        else if (sprite_index == spr_player_run_left || sprite_index == spr_player_walking_left) sprite_index = spr_player_standing_left;
    }
}

if (keyboard_check(vk_space) && alarm[9] <= 0 && stamina >= 20)
{
    if (ver > 0) sprite_index = spr_player_dash_front;
    else if (ver < 0) sprite_index = spr_player_dash_back; 
    else if (hor > 0) sprite_index = spr_player_dash_right;
    else if (hor < 0) sprite_index = spr_player_dash_left;
    dashing = true;
    alarm[8] = 2;
    stamina -= 20;
    alarm[9] = 300;
}

if (alarm[8] < 0 && dashing == true)
{
    alarm[8] = 2;
}


if (mouse_check_button_pressed(mb_left)){
    if (in_hand != noone && alarm[11] <= 0 && in_hand.item_type == "weapon")
    {      
        mouse_facing = point_direction(x, y, mouse_x, mouse_y)
        attack_inst = instance_create_depth(x, y, depth, in_hand.attack);
        attack_inst.image_angle = mouse_facing;
        attack_inst.damage += damage + in_hand.damage;
        alarm[11] = in_hand.cooldown;
    }
    else if (in_hand == spr_bow && alarm[10] <= 0)
    {
        instance_create_depth(x, y, depth, obj_arrow_player);
        alarm[10] = 120;
    }    
}

if (keyboard_check_pressed(vk_tab) && is_inv_opened == false)
{
    inv_y = base_dy + item_slot_size*array_length(inventory);
    is_inv_opened = true;
}
else if (keyboard_check_pressed(vk_tab) && is_inv_opened == true)
{
    selected_slot = last_in_hand;
    inv_y = base_dy + item_slot_size;
    is_inv_opened = false;
    crafting_hovering = noone;
}
inv_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),base_dx + barw, base_dy, inv_x, inv_y);

if (is_inv_opened){
    crafting_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),crafting_background_x, crafting_background_y, crafting_background_x + crafting_background_w, crafting_background_y + crafting_background_h);
    
    for (var i = 0; i < array_length(crafting_slots); i++){
        recepie_y = crafting_background_y + 10 + item_slot_size*i;
        recepie_x = crafting_background_x + 20;
        var right_corner_x = recepie_x + item_slot_size;
        var right_corner_y = recepie_y + item_slot_size;
        crafting_slot_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), recepie_x, recepie_y, right_corner_x, right_corner_y);
        if (crafting_slot_hovering && mouse_check_button_pressed(mb_left)){
            var item = crafting_slots[i];
            var recepie = global.recepies[$ item];
            var recepie_keys = struct_get_names(recepie);
            var materials_cords = {};
            for (var j = 0; j < array_length(recepie_keys); j++){
                var key = recepie_keys[j];
                for (var row = 0; row < array_length(inventory); row++){
                    for (var col = 0; col < hotbar_size; col++){
                        if (inventory[row][col] != noone){
                            if (inventory[row][col].item_id == key && inventory[row][col].amount >= recepie[$ key]){
                                struct_set(materials_cords, key,[row, col])
                            }
                        }
                    }
                }   
            }
            
            if (array_length(struct_get_names(materials_cords)) == array_length(recepie_keys)-2){
                for (var j = 0; j < array_length(recepie_keys); j++){
                    if (recepie_keys[j] != "unlocked" && recepie_keys[j] != "station"){
                        var row = materials_cords[$ recepie_keys[j]][0];
                        var col = materials_cords[$ recepie_keys[j]][1];
                        inventory[row][col].amount -= recepie[$ recepie_keys[j]];
                        check_for_delete(row, col);
                    }
                }
                add_items(item);
            }
        }
    }
}

if (keyboard_check(ord("1")))
{
    selected_slot = [0,0];
}

else if (keyboard_check(ord("2")))
{
    selected_slot = [0,1];
}
else if (keyboard_check(ord("3")))
{
    selected_slot = [0,2];
}
else if (keyboard_check(ord("4")))
{
    selected_slot = [0,3];
}
else if (keyboard_check(ord("5")))
{
    selected_slot = [0,4];
}
else if (keyboard_check(ord("6")))
{
    selected_slot = [0,5];
}
if (selected_slot[0] == 0){
    in_hand = inventory[selected_slot[0]][selected_slot[1]];
    last_in_hand = selected_slot;
}

if (is_inv_opened && array_length(crafting_slots) > 0 && crafting_hovering){
    var max_recepies = -5;
    for (var i = 0; i < array_length(global.recepies_keys); i++){
        var recepie_id = global.recepies_keys[i];
        var recepie = global.recepies[$ recepie_id];
        if (recepie.unlocked && array_contains(near_station, recepie.station)){
            max_recepies += 1;
        }
    }
    if (mouse_wheel_down() && recepie_offset < max_recepies){
        recepie_offset += 1;
        var shown_recepies = 0;
        array_shift(crafting_slots);
        for (var i = 0; i < array_length(global.recepies_keys); i++){
            var recepie_id = global.recepies_keys[i];
            var recepie = global.recepies[$ recepie_id];
            if (recepie.unlocked && shown_recepies == array_length(crafting_slots) && array_contains(near_station, recepie.station)){
                array_push(crafting_slots, recepie_id);
                break;
            }
            if (recepie.unlocked && array_contains(crafting_slots, string(recepie_id))){
                shown_recepies+=1;
            }
        }
    }
    else if (mouse_wheel_up() && recepie_offset > 0){
        recepie_offset -= 1;
        var shown_recepies = 0;
        var last_recepie = noone;
        array_pop(crafting_slots);
        for (var i = 0; i < array_length(global.recepies_keys); i++){
            var recepie_id = global.recepies_keys[i];
            var recepie = global.recepies[$ recepie_id];
            if (recepie.unlocked && !array_contains(crafting_slots, string(recepie_id)) && array_contains(near_station, recepie.station)){
                last_recepie = recepie_id;
            } 
            else if (recepie.unlocked && array_contains(crafting_slots, string(recepie_id))){
                array_insert(crafting_slots, 0, last_recepie);
                break;
            }
            
        }
    }
}

if (mouse_check_button_pressed(mb_right) && inventory[selected_slot[0]][selected_slot[1]] != noone){
    if (inventory[selected_slot[0]][selected_slot[1]].item_type == "station"){
        instance_create_depth(mouse_x, mouse_y, 0, inventory[selected_slot[0]][selected_slot[1]].object);
        inventory[selected_slot[0]][selected_slot[1]].amount -= 1;
        check_for_delete(selected_slot[0], selected_slot[1]);
    }
}

for (var i = 0; i < array_length(inventory); i++){
    for (var j = 0; j < hotbar_size; j++){
        slot_x = base_dx + barw + item_slot_size*j;
        slot_y = base_dy + item_slot_size*i;
        slot_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), slot_x, slot_y, slot_x + item_slot_size, slot_y + item_slot_size);    
        if (slot_hovering && mouse_check_button_pressed(mb_left) && inv_hovering){
            if (i > 0 && is_inv_opened == false){
                break;
            }
            selected_slot = [i, j];
            break;
        }
        if (holding_item == true && mouse_check_button_released(mb_left)){
            if (slot_hovering){
                var item = inventory[i][j];
                array_copy(inventory[i],j,inventory[selected_slot[0]],selected_slot[1],1);
                inventory[selected_slot[0]][selected_slot[1]] = item;
                selected_slot = [i, j];
                holding_item = false;
                break;
            } 
            if (!inv_hovering){
                item_back();    
                holding_item = false;
            }
            else {
            }
        }
    }
}

var layer_id = layer_get_id("Tiles_Back");
var map_id = layer_tilemap_get_id(layer_id);
var tile_index = tile_get_index(tilemap_get_at_pixel(map_id, x, y));
var sand_tiles_index = [4, 5, 6, 14, 15, 16, 24, 25, 26];
var inst_shovel = "nothing";
if (array_contains(sand_tiles_index, tile_index)){
    if (!instance_exists(obj_shovelling)) {
        shovel_inst_x = x;
        shovel_inst_y = y;
        inst_shovel = instance_create_depth(x, y-8, -1, obj_shovelling);
        
        can_shovel = true;
    } 
    else if (instance_exists(obj_shovelling) && shovel_inst_x != x && shovel_inst_y != y){
        instance_destroy(obj_shovelling); ;
    }
    
    if (mouse_check_button(mb_left) &&  mouse_check_button_pressed(mb_left))
    {
        alarm[6] = time_to_shovel;
        alarm[7] = 1;
    }
    else if (!mouse_check_button(mb_left))
    {
        alarm[6] = -1;  
    }
}
else if (instance_exists(obj_shovelling)){
    can_shovel = false;
    instance_destroy(obj_shovelling);
}
