if (keyboard_check(vk_escape) || obj_select_screen.destroyed == true)
{
    instance_destroy();
}
if (!instance_exists(obj_buy_item_btn))
{
    instance_destroy(obj_select_screen);
}