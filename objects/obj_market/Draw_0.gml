draw_self();

if (can_interact && !instance_exists(obj_interaction))
{
    inst_interaction = instance_create_depth(x, y-8, -1, obj_interaction);
}
else if (!can_interact && inst_interaction != "nothing")
{
    instance_destroy(inst_interaction);
}