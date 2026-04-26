if (instance_exists(obj_player) && distance_to_object(obj_player) <= radius && interactable)
{
    hovering = position_meeting(mouse_x,mouse_y,id);
    can_interact = true;
       
    if (hovering && mouse_check_button_pressed(mb_left))
    {
        clicked = true;
    } 
    
    if (clicked == true)
    {
        clicked = false;
        obj_spawn_area_environment.delete_entity(id);
        var item_db_keys = struct_get_names(global.item_db);
        for (var i = 0; i < array_length(item_db_keys); i++){
            var key = item_db_keys[i];
            var item = global.item_db[$ key];
            if (item.sprite == sprite_index){
                obj_player.add_items(item.item_id);
            }
        }
        instance_destroy();
        if (inst_pick != "nothing") instance_destroy(inst_pick);
    }
} else {
	can_interact = false;
}