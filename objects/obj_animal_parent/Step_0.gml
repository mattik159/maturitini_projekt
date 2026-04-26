var hor = clamp(target_x - x, -1, 1);
var ver = clamp(target_y - y, -1, 1);

move_and_collide(move_speed * hor, move_speed * ver, [tilemap, obj_animal_parent]);