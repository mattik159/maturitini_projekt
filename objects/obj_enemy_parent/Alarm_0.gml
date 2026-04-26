if (instance_exists(obj_player) && distance_to_object(obj_player) < distance_to_player)
{
    target_x = obj_player.x;
    target_y = obj_player.y;
    alarm[1] = -1;
}
else 
{
    if (alarm[1] <= 0) {
        alarm[1] = 60;
    }
}

alarm[0] = 6;