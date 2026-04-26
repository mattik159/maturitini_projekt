function create_shop_screen(item_array)
{   
    var offset_y = -20;
    var select_screen_inst = instance_create_depth(obj_player.x,obj_player.y, -2, obj_select_screen);
    for (var i = 0; i < round(array_length(item_array)/5);i++)
    {
        var offset_x = -40*round(array_length(item_array)/4);
        for (var j = 0; j < 5; j++)
        {
            var item = item_array[j+(i*5)];
               
            if (item != "n")
            {
                var buy_button_inst = instance_create_depth(obj_player.x+offset_x, obj_player.y+offset_y, -3, obj_buy_item_btn);
                buy_button_inst.item = item;
            }
            else
            {
                var buy_button_inst = instance_create_depth(obj_player.x+offset_x, obj_player.y+offset_y, -3, obj_buy_item_btn);
            }
            offset_x += 40;
        }
        offset_y += 40;
    }
}