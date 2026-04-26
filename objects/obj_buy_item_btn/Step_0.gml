hovering = position_meeting(mouse_x, mouse_y, id);

if (hovering && mouse_check_button_pressed(mb_left))
{
    clicked = true;
}

if (mouse_check_button_released(mb_left))
{
    clicked = false;
    
    if (hovering && struct_get(item,"purchased") == false)
    {
        activate_button();
    }
}

if (clicked)
{
   image_blend = c_dkgray;  
}
else if (hovering && item != "default" && struct_get(item,"purchased") == false)
{
    image_blend = c_white;
}
else
{
    image_blend = c_dkgray;
}