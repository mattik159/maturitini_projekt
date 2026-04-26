alpha += (0.05 * state);

if (alpha >= 1 && state == 1){
    room_goto(target_room);
    stav = -1;
}

if (alpha <= 0 && state == -1){
    instance_destroy();
}