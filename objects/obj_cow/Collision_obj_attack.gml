if (alarm[1] <= 0){
    hp -= (other.damage + obj_player.damage);
    image_blend = c_red;
    alarm[1] = 30;
   
    if (in_danger <= 0){
        in_danger = 1;
        alarm[2] = 60;
    }
    
    if (hp <= 0)
    {
        obj_player.add_loot(loot_table, loot_table_keys);
        obj_spawn_area.delete_entity(id);
        instance_destroy();
    }
}