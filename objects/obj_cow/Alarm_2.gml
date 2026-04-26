if (alarm[2] <= 0 && in_danger >= 0)
{
    alarm[0] = -1;
    move_speed = 1.1;
    target_x = random_range(xstart - 300, xstart + 300);
    target_y = random_range(ystart - 300, ystart + 300);
    
    in_danger++;
    if (in_danger >= 8)
    {
        in_danger = 0;
        alarm[0] = 60;
        alarm[2] = -1;
    }
}
else if (alarm[2] <= 0 && in_danger <= 0)
{
    alarm[2] = -1;
    alarm[0] = 60;
}

alarm[2] = 60;