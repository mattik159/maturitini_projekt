// Inherit the parent event
event_inherited();

if (instance_exists(obj_settings))
{
    instance_destroy(obj_settings);
}
else 
{
    instance_create_depth(room_width / 2, room_height / 2, -1, obj_settings)
    //instance_create_depth(room_width / 2, room_height / 2, -2, obj_settings);	
}