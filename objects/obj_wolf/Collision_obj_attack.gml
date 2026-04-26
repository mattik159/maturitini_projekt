if (alarm[1] <= 0)
{
    hp -= other.damage;
    image_blend = c_red;
    
    in_danger = 0.5
    alarm[1] = 30;
    alarm[2] = 30;
    
    if (hp <= 0)
    {
        obj_player.add_loot(loot_table, loot_table_keys);
        obj_spawn_area.delete_entity(id);
        instance_destroy();
    }
}