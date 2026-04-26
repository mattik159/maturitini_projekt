clicked = false;
hovering = false;

image_xscale = 3;
image_yscale = 3;

draw_x = x-sprite_width/4+2;
draw_y = y-sprite_height/4+2
draw_xcale = image_xscale/6;
draw_yscale = image_yscale/6;

function activate_button()
{
    if (item != "default")
    {
        for (var i = 0; i < array_length(obj_player.inventory); i++)
        {
            for (var j = 0; j < obj_player.hotbar_size; j++)
            {
                if (struct_get(item,"purchased") == true)
                {
                    break;
                }
                if (obj_player.inventory[i][j] == noone)
                {
                    var item_object = global.item_db[$ item.item];
                    obj_player.inventory[i][j] = new Weapon(item_object.sprite, item_object.object, item_object.name, item_object.item_id, item_object.damage, item_object.cooldown, item_object.attack, 1, item_object.subtype);
                    struct_set(item,"purchased",true);
                    
                    break;
                } 
            }
        }
    }
}



function isFar()
{
    instance_destroy();
}