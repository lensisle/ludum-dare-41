var input_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
var input_y = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));

var input_bullet = mouse_check_button_pressed(mb_left);

var move_x = input_x * ship_speed;
var move_y = input_y * ship_speed;

if place_meeting(x + move_x, y, obj_collision)
{
	while !place_meeting(x + sign(move_x), y, obj_collision)
	{
		x += sign(move_x);
	}
	
	move_x = 0;
}

if place_meeting(x, y + move_y, obj_collision)
{
	while !place_meeting(x, y + sign(move_y), obj_collision)
	{
		y += sign(move_y);
	}
	
	move_y = 0;
}


if move_x != 0
{
	x += move_x;
}

if move_y != 0
{
	y += move_y;
}

if current_cooldown > 0
{
	current_cooldown -= 1;
}
else 
{
	if input_bullet
	{
		current_cooldown = shoot_cooldown;

		with (instance_create_layer(x + 5, y, "Instances", obj_bullet))
		{
			bullet_damage = other.weapon_damage;
		}
	}
}
