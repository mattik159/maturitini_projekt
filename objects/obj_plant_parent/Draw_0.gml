draw_self();

if (can_interact == true && !instance_exists(obj_pick) && interactable)
{
    inst_pick = instance_create_depth(x, y-8, -1, obj_pick);
}
else if (!can_interact && inst_pick != "nothing" && interactable)
{
    instance_destroy(inst_pick);
}
