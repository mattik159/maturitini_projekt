draw_self();

if (hovering && mouse_check_button(mb_left) && can_interact){
    var barw = 16;
    var barh = 8;
    var dx = x-barw/2;
    var dy = y-barh/2;
    
    var mine_barw = barw * (mine_time / time_to_mine);
    
    draw_sprite_stretched(spr_bar, 0, dx, dy, barw, barh);
    draw_sprite_stretched_ext(spr_bar, 1, dx, dy, mine_barw, barh, c_white, 0.8);
}

if (can_interact == true && !instance_exists(obj_mine))
{
    var distance = 28;
    indicator_x = x - lengthdir_x(distance, obj_player.facing);
    indicator_y = y + lengthdir_y(distance, 360-obj_player.facing);
    inst_mine = instance_create_depth(indicator_x, indicator_y, -1, obj_mine);
}
else if (!can_interact && inst_mine != "nothing")
{
    instance_destroy(inst_mine);
}
