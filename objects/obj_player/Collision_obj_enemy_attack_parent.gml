if (alarm[1] < 0){
    hp -= other.damage;
    alarm[1] = 30; 
    image_blend = c_red;
    
    if (hp <= 0)
    {
        game_restart();
    }
}