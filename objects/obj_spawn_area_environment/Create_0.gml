alarm[0] = spawn_time;
entities = [];

total_chance = 0;
entites_size = array_length(entities_list);
for (var i = 0; i < entites_size;i++)
{
    total_chance += entities_list[i].chance;
}

while (array_length(entities) < max_entities)
{
    roll = random(total_chance);
    entity = noone;
    current_chance = 0;
    for (var j = 0; j < entites_size;j++)
    {
        current_chance += entities_list[j].chance;
        
        if (roll <= current_chance)
        {
            entity = entities_list[j].entity;
            break;
        }    
    }
    var spawnx = random_range(x - radius, x + radius);
    var spawny = random_range(y - radius, y + radius);
    
    var layer_id = layer_get_id(layer_check);
    var map_id = layer_tilemap_get_id(layer_id);
    var tile_index = tile_get_index(tilemap_get_at_pixel(map_id,spawnx, spawny));
    
    if (spawn_sprite == tile_index){
        if (tile_index == 45){
            show_debug_message("sprite is walk_path")
        }
        array_push(entities, instance_create_depth(spawnx, spawny, depth, entity)); 
    }
}

function delete_entity(id)
{
    for (var i = 0; i < array_length(entities); i++)
    { 
        if (entities[i].id == id)
        {
            array_delete(entities, i, 1);
            break;
        }
    }
}
