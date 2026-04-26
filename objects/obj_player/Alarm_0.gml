if (alarm[0] <= 0 && keyboard_check(vk_shift) && stamina > 0 && (keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D")) || keyboard_check(ord("W"))) && running)
{
    stamina -= 1;
}
else if (alarm[0] <= 0) 
{
    stamina += 1;
    if (stamina > stamina_total)
    {
        stamina = stamina_total;
    }
}