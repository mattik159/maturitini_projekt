alarm[0] = 300;
entities = [];

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
