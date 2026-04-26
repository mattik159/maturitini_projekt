if (obj_player.y == y)
{
    if (obj_player.x >= x){
        facing = 0;
    } 
    else 
    {
        facing = 180;    
    }
}
else if (obj_player.x == x)
{
    if (obj_player.y >= y)
    {
        facing = 270;
    }
    else 
    {
        facing = 90;	
    }
}
else if (obj_player.x >= x && obj_player.y >= y)
{
    facing = 315;
}
else if (obj_player.x >= x && obj_player.y <= y)
{
    facing = 45;
}
else if (obj_player.x <= x && obj_player.y >= y)
{
    facing = 225;
}
else 
{
    facing = 135;	
}
    

if (instance_exists(obj_player) && distance_to_object(obj_player) < distance_to_player/2)
{
    var distance = 50;
    target_x = x - lengthdir_x(distance, facing);
    target_y = y - lengthdir_y(distance, facing);
    alarm[1] = -1;
}
else 
{
    if (alarm[1] <= 0) {
        alarm[1] = 60;
    }
}

if (distance_to_object(obj_player) < distance_to_player && alarm[2] <= 0)
{
    alarm[2] = 60;
}

alarm[0] = 6;