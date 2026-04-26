if (alarm[2] <= 0 && in_danger > 0 && distance_to_object(obj_player) < distance_to_player)
{
    move_speed = 1.2;
    target_x = obj_player.x;
    target_y = obj_player.y;
    alarm[3] = 30;
}

in_danger += 0.5;
alarm[2] = 30;

if (in_danger >= 10)
{
    alarm[0] = 60;
    alarm[2] = -1;
    alarm[3] = -1;
    move_speed = base_move_speed;
    in_danger = 0;
}