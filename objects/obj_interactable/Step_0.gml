/// @description Check if object is pressed

if mouse_x >= x && mouse_x <= x + obj_width && mouse_y >= y && mouse_y <= y + obj_height
{
	is_hovered = true;
	
	image_index = 1;
	if mouse_check_button_pressed(mb_left)
	{
		is_pressed = true;
	}
	
	if mouse_check_button_released(mb_left)
	{
		is_pressed = false;
	}
}
else 
{
	is_hovered = false;
	image_index = 0;
}