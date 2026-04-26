if (solid){
    obj_player.x = obj_player.xprevious - lengthdir_x(1, obj_player.facing);
    obj_player.y = obj_player.yprevious - lengthdir_y(1, obj_player.facing);
}