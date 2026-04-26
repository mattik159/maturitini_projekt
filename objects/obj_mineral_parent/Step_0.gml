hovering = position_meeting(mouse_x,mouse_y,id);
if (instance_exists(obj_player) && distance_to_object(obj_player) <= radius)
{
    can_interact = true;
    
    if (hovering && mouse_check_button(mb_left) &&  mouse_check_button_pressed(mb_left))
    {
        alarm[0] = time_to_mine;
        alarm[1] = 1;
    }
    else if (!mouse_check_button(mb_left))
    {
        alarm[0] = -1;  
    }
    
} else {
	can_interact = false;
}