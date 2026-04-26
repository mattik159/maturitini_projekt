x = x + lengthdir_x(6,facing);
y = y + lengthdir_y(6, facing);
dash_offset += 6;
if (dash_offset >= 54) 
{   
    dash_offset = 0;
    dashing = false;
}
