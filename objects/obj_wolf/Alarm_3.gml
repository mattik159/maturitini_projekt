if (alarm[3] <= 0 && distance_to_object(obj_player) <= 20)
{
    var hor = clamp(target_x - x, -1, 1);
    var ver = clamp(target_y - y, -1, 1);

    var distance = 8;

    facing = point_direction(0, 0, hor, ver);

    var attack_x = x + lengthdir_x(distance, facing)
    var attack_y = y + lengthdir_y(distance, facing);

    var attack_inst = instance_create_depth(attack_x, attack_y, depth, obj_wolf_attack);
    attack_inst.image_angle = facing;
    attack_inst.damage += damage;

}

alarm[3] = 30;