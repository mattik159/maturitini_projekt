image_xscale = 3;
image_yscale = 6;
draw_self();

draw_set_font(font_menu);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x, y-180, "Move up: W");

draw_text(x, y-120, "Move down: S");

draw_text(x, y-60, "Move left: A");

draw_text(x, y, "Move right: D");

draw_text(x,y+60, "Attack: Mouse1");

draw_text(x, y+120, "Interact: Space");

draw_text(x, y+180, "Close window: Esc");

draw_text(x, y+240, "Hotbar slots: +, ě, š, č, ř, ž (1, 2, 3 , 4, 5 ,6)");

draw_set_halign(fa_left);
draw_set_valign(fa_top);