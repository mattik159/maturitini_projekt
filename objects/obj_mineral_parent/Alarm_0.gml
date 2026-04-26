if (mouse_check_button(mb_left))
{
    obj_player.add_loot(loot_table, loot_table_keys)
    obj_spawn_area_environment.delete_entity(id);
    instance_destroy();
    if (inst_mine != "nothing") instance_destroy(inst_mine);
}