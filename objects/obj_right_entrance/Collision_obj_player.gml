show_debug_message("kolize s hráčem");

global.target_y = other.y;
global.target_x = 40;

var _inst = instance_create_layer(0, 0, "Instances", obj_transition);
_inst.target_room = desert_kingdom;