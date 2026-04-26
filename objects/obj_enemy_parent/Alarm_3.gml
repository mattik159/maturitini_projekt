image_blend = c_white;

if (hp <= 0){
    obj_spawn_area.delete_entity(id);
    obj_player.add_loot(loot_table, loot_table_keys);
    instance_destroy();
}