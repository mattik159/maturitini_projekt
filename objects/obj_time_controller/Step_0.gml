time_of_day += 1

if (time_of_day >= day_night_border && time_of_day < day_night_border*2){
    draw_set_colour(c_black);
    if (alpha_level >= 1){
        alpha_level = 0;
    }
    if (time_of_day <= day_night_border+60){
        alpha_level += 0.01;
    }
    draw_set_alpha(alpha_level);
    global.is_day = false;
}
else if (time_of_day >= day_night_border*2){
    alpha_level = 0;
    global.is_day = true;
    time_of_day = 0;
    global.day +=1;
}

if (time_of_day <= 60 && global.day > 1){
    alpha_level += 0.0167;
    draw_set_colour(c_white);
    draw_set_alpha(alpha_level);
}