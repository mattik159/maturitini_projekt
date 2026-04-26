var hor = clamp(target_x - x, -1, 1);
var ver = clamp(target_y - y, -1, 1); 

move_and_collide(hor * move_speed, ver * move_speed, [tilemap, obj_enemy_attack_parent]);

if (alarm[0] <= 0)
{
    alarm[0] = 120;
}

if (alarm[1] <= 0){
    alarm[1] = 6;
}