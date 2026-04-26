station_radius = 30;

function add_to_crafting_slots(){
    obj_player.recepie_offset = 0;
    obj_player.crafting_slots = [];
    for (var i = 0; i < array_length(global.recepies_keys); i++){
        if (global.recepies[$ global.recepies_keys[i]].unlocked){
            if (array_length(obj_player.crafting_slots) < 5){
                if (array_contains(obj_player.near_station, global.recepies[$ global.recepies_keys[i]].station)){
                    array_push(obj_player.crafting_slots, global.recepies_keys[i]);
                }
            } else {
                break;
            }
        }
    }
}