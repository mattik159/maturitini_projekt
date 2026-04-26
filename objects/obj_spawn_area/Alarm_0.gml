if (array_length(entities) < max_entities && alarm[0] <= 0)
{
    var spawnx = random_range(x - radius, x + radius);
    var spawny = random_range(y - radius, y + radius);
    
    array_push(entities, instance_create_depth(spawnx, spawny, depth, entity));
}

alarm[0] = spawn_time;