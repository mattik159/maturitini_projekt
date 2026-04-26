var dx = base_dx;
var dy = base_dy;

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var health_barw = barw * (hp / total_hp);

draw_sprite_stretched(spr_bar,0, dx, dy, barw, barh);
draw_sprite_stretched_ext(spr_bar,1, dx, dy, health_barw, barh, c_red, 0.6);

draw_text(dx + barw / 2, dy + barh / 2, $"HP");

var level_barw = barw * (xp / xp_require);
dy += barh + 8;

draw_sprite_stretched(spr_bar,0, dx, dy, barw, barh);
draw_sprite_stretched_ext(spr_bar,1, dx, dy, level_barw, barh, c_blue, 0.8);

draw_text(dx + barw / 2, dy + barh / 2, $"Level {level}");

var stamina_barw = barw * (stamina / stamina_total);
dy += barh + 8;

draw_sprite_stretched(spr_bar,0, dx, dy, barw, barh);
draw_sprite_stretched_ext(spr_bar,1, dx, dy, stamina_barw, barh, c_aqua, 0.8);

draw_text(dx + barw / 2, dy + barh / 2, $"Stamina {stamina}");

draw_set_halign(fa_left);
draw_set_valign(fa_top);

dy += barh + 8;

draw_text_colour(dy, dy, $"Money: {player_money}", c_yellow, c_yellow, c_orange, c_orange, 1);

for (var z = 0; z < array_length(inventory); z++){
    for (var i = 0; i < hotbar_size;i++){
        slot_x = base_dx + barw + (item_slot_size*i);
        slot_y = base_dy + item_slot_size*z;
        
        if (z < 1){
            if (selected_slot[0] == z && selected_slot[1] == i)
            {
                draw_sprite_stretched_ext(spr_player_item_slot, 0, slot_x, slot_y, item_slot_size, item_slot_size, c_gray, 0.9);
            } else {
                draw_sprite_stretched_ext(spr_player_item_slot, 0, slot_x, slot_y, item_slot_size, item_slot_size, c_white, 0.9);
            }
        }
        
        if (is_inv_opened == true && z > 0)
        {
            if (selected_slot[0] == z && selected_slot[1] == i)
            {
                draw_sprite_stretched_ext(spr_player_item_slot, 0, slot_x, slot_y, item_slot_size, item_slot_size, c_gray, 0.9);
            } else {
                draw_sprite_stretched_ext(spr_player_item_slot, 0, slot_x, slot_y, item_slot_size, item_slot_size, c_white, 0.9);
            }
        }
        
        if (!is_inv_opened){
            if (inventory[z][i] != noone && z < 1){
                show_items(z, i);
            }
        }else{
            if (inventory[z][i] != noone){
                show_items(z, i);
            }
        }
        
        slot_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), slot_x, slot_y, slot_x + item_slot_size, slot_y + item_slot_size);
        if (mouse_check_button(mb_left) && inventory[selected_slot[0]][selected_slot[1]] != noone && inv_hovering){
            if (slot_hovering){
                holding_item = true;
            }
        }
        
        if (holding_item){
            var item_sprite = struct_get(inventory[selected_slot[0]][selected_slot[1]], "sprite");
            draw_sprite_ext(item_sprite, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 3, 3, 0, c_white, 1);
        }
    }
}

if (is_inv_opened){
    var armor_background_x = base_dx + barw + item_slot_size*hotbar_size;
    var armor_background_y = base_dy;
    
    draw_sprite_stretched_ext(spr_player_armor_background, 0, armor_background_x, armor_background_y, armor_background_w, armor_background_h,c_white,1);
    
    var armor_slot_x = armor_background_x + armor_background_w/2;
    var armor_slot_y = armor_background_y;
    
    var armor_keys = variable_struct_get_names(armor);
    
    var offset_x = armor_background_w/3;
    var offset_y = armor_background_h/5;
    for (var i = 0; i < armor_length; i++){
        if (i == armor_length-1){
            armor_slot_y -= offset_y;
            armor_slot_x -= offset_x;
        }
        else {
            armor_slot_y += offset_y;
        }
        draw_sprite_ext(spr_player_item_slot, 0, armor_slot_x, armor_slot_y, 8, 8, 0, c_white, 0.75);
        if (armor[$ armor_positions[i]] != noone){
            var item_sprite = struct_get(armor[$ armor_positions[i]],"sprite");
            var item_x = armor_slot_x - offset_x/2 + ((sprite_get_width(spr_player_item_slot)*8)/2);
            var item_y = armor_slot_y - offset_y/2 + (sprite_get_height(spr_player_item_slot)*8/2);
            draw_sprite_ext(item_sprite, 0, item_x, item_y, 3, 3, 0, c_white, 1);
        }
    }
    
    draw_sprite_stretched_ext(spr_player_crafting_background, 0, crafting_background_x, crafting_background_y, crafting_background_w, crafting_background_h, c_white, 1);
    
    var shown_recepies = 0;
    for (var i = 0; i < array_length(crafting_slots); i++){
        var recepie_id = crafting_slots[i];
        var recepie = global.recepies[$ recepie_id];
        var item = noone;
        if (struct_exists(global.item_db, recepie_id)){
            item = global.item_db[$ recepie_id];
        }
        if (shown_recepies == 5) break;
            
        if (recepie.unlocked){
            var text_w = 0;
            recepie_y = crafting_background_y + 20 + item_slot_size*shown_recepies;
            draw_sprite_stretched_ext(spr_player_item_slot, 0, recepie_x, recepie_y, item_slot_size, item_slot_size, c_white, 1);
            if (item != noone){
                draw_sprite_ext(item.sprite, 0, recepie_x + (item_slot_size/2), recepie_y + (item_slot_size/2), 2, 2, 0, c_white, 1);
            }
            var recepie_keys = struct_get_names(recepie);
            
            var recepie_text_x = recepie_x + item_slot_size;
            var recepie_text_y = recepie_y;
            draw_text(recepie_text_x, recepie_text_y, $"{recepie_id}")
            for (var j = 0; j < array_length(recepie_keys); j++){
                var key = recepie_keys[j];
                var value = recepie[$ key];
                
                var amount_of_item = 0;
                for (var row = 0; row < array_length(inventory); row++){
                    for (var col = 0; col < array_length(inventory[row]); col++){
                        if(inventory[row][col] != noone){
                            if (inventory[row][col].item_id == key){
                                amount_of_item = inventory[row][col].amount;
                                break;
                            }
                        }
                    }
                }
                
                if (key != "unlocked" && key != "station"){
                    var text_color = c_white;
                    if(amount_of_item < value){
                        text_color = c_red;
                    }
                    draw_text_ext_colour(recepie_text_x, recepie_text_y+40,$"{key}:{amount_of_item}/{value}", 5, 150, text_color, text_color, text_color, text_color, 1);
                    text_w = string_width_ext($"{key}:{amount_of_item}/{value}", 5, 150);
                    recepie_text_x+=text_w+10;
                }
            }
            shown_recepies +=1;
        }
    }
}

if (can_shovel && mouse_check_button(mb_left)){
    var shovel_barw = 16;
    var shovel_barh = 8;
    var shovel_dx = x-shovel_barw/2;
    var shovel_dy = y-shovel_barh/2;
    
    var shovel_progres_barw = shovel_barw * (shovel_time / time_to_shovel);
    
    draw_sprite_stretched(spr_bar, -1, shovel_dx, shovel_dy, shovel_barw, shovel_barh);
    draw_sprite_stretched_ext(spr_bar, -1, shovel_dx, shovel_dy, shovel_progres_barw, shovel_barh, c_white, 0.8);
}

function show_items(_row, _col){
    if (holding_item && _row == selected_slot[0] && _col == selected_slot[1]){
        return;
    }
    var item_sprite = struct_get(inventory[_row][_col], "sprite");
    var item_x = slot_x + (item_slot_size/2);
    var item_y = slot_y + (item_slot_size/2);
    
    draw_sprite_ext(item_sprite, 0, item_x, item_y, 2.5, 2.5, 0, c_white, 1);
    
    if (inventory[_row][_col].amount > 1){
        draw_text(item_x,item_y,string(inventory[_row][_col].amount))   
    }
}

function item_back() {
    var item_sprite = struct_get(inventory[selected_slot[0]][selected_slot[1]], "sprite");
    
    var item_x = base_dx + barw + (item_slot_size*selected_slot[1]) + (item_slot_size/2);
    var item_y = base_dy + item_slot_size*selected_slot[0] + (item_slot_size/2);
    draw_sprite_ext(item_sprite, 0, item_x, item_y, 2.5, 2.5, 0, c_white, 1);
}