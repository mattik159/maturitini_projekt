if (instance_exists(obj_player) && distance_to_object(obj_player) <= station_radius){
    if (!array_contains(obj_player.near_station, station)){
        obj_player.recepie_offset = 0;
        array_push(obj_player.near_station, station);
        add_to_crafting_slots();
    }
}
else {
    if (array_contains(obj_player.near_station, station)){
        var index = array_get_index(obj_player.near_station, station);
        array_delete(obj_player.near_station, index, 1);
        add_to_crafting_slots();
    }
}
