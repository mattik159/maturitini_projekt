gui_width = 1440;
gui_height = 810;
destroyed = false;

draw_x = display_get_gui_width()/2-gui_width/2;
draw_y = display_get_gui_height()/2-gui_height/2;

image_xscale = gui_width/(sprite_width*6);
image_yscale = gui_height/(sprite_height*6);

function isFar(){
    destroyed = true;
}