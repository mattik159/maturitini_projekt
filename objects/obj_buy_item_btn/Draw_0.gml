draw_self();
if (item != "default")
{
    var item_to_draw = global.item_db[$ item.item].sprite;
    draw_sprite_ext(item_to_draw, 1, draw_x, draw_y, draw_xcale, draw_yscale, 0, c_white, 1);
}