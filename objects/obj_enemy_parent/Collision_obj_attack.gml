if (alarm[3] < 0)
{
    hp -= other.damage;
    image_blend = c_red;
    
    knockback = irandom_range(0,3);
    
    if (knockback == 0)
    {
        knockback_x = sign(x - other.x);
        knockback_y = sign(y - other.y);
    }
    else 
    {
        knockback_x = 0;
        knockback_y = 0;
    }    
    alarm[3] = 30;
}