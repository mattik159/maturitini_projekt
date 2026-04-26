if (instance_exists(obj_player) && distance_to_object(obj_player) < 16)
{
    can_interact = true;
    if (keyboard_check_pressed(input_key) && !instance_exists(obj_select_screen))
    {
        create_shop_screen(items);
    }
     
}
else 
{
    can_interact = false;	
}

if (instance_exists(obj_player) && distance_to_object(obj_player) > 50 && instance_exists(obj_select_screen))
{
    obj_select_screen.isFar();
}