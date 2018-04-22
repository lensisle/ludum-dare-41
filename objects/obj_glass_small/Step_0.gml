/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with obj_play_manager
{
	if other.is_pressed && check_press_available(current_state)
	{
		if !other.following_cursor
		{
			obj_glass_large.following_cursor = false;
			obj_glass_medium.following_cursor = false;
			obj_glass_small.following_cursor = false;
		
			var not_tutorial = obj_game_manager.current_state != EGameState.Tutorial;
			var not_this = current_cup_selected_index != 1;
		
			var is_set_pressed = not_this &&
								 not_tutorial;
	
			if is_set_pressed
			{	
				other.is_pressed = false;
			
				obj_glass_large.x = obj_glass_large.original_position_x;
				obj_glass_large.y = obj_glass_large.original_position_y;
			
				obj_glass_medium.x = obj_glass_medium.original_position_x;
				obj_glass_medium.y = obj_glass_medium.original_position_y;
		
				obj_glass_large.following_cursor = false;
				obj_glass_medium.following_cursor = false;
				obj_glass_small.following_cursor = false;
		
				current_cup_selected_index = 1;
		
				last_pressed_item = other.object_index;
			
				current_cup_selected = other.object_index;
		
				current_cup_selected.x = obj_interaction_text.x;
				current_cup_selected.y = obj_interaction_text.y - 100;
				current_cup_selected.draggable = true;
			}
		}
	}
}