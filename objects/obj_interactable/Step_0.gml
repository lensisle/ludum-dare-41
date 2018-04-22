/// @description Check if object is pressed

if mouse_x >= x && mouse_x <= x + obj_width && mouse_y >= y && mouse_y <= y + obj_height
{
	is_hovered = true;
	
	if mouse_check_button_pressed(mb_left)
	{
		is_pressed = true;
		// show_debug_message("is pressed " + object_get_name(object_index));
	}
	
	if mouse_check_button_released(mb_left)
	{
		is_pressed = false;
		// show_debug_message("is released " + object_get_name(object_index));
	}
}
else 
{
	is_hovered = false;
}