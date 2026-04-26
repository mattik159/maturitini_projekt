if (array_length(entities) < max_entities && alarm[0] <= 0)
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
    
    array_push(entities, instance_create_depth(spawnx, spawny, depth, entity));
}

alarm[0] = spawn_time;