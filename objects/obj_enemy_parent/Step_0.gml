if (instance_exists(obj_select_screen)) exit;

if (alarm[3] >= 0 && knockback_x != 0 && knockback_y != 0)
{
    target_x = x + knockback_x;
    target_y = y + knockback_y;
}

var hor = clamp(target_x - x, -1, 1);
var ver = clamp(target_y - y, -1, 1);

move_and_collide(hor * move_speed, ver * move_speed, [tilemap, obj_enemy_parent]);