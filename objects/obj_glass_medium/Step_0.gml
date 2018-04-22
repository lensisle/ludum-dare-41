/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var not_in_tutorial = obj_game_manager.current_state != EGameState.Tutorial;
var is_valid_state = check_press_available(obj_play_manager.current_state);

var check_drag = not_in_tutorial && is_valid_state;

if check_drag
{
	if current_state == EDraggrableState.FollowingCursor
	{
		x = mouse_x - (obj_width * 0.5) + 16;
		y = mouse_y - (obj_height * 0.5) + 16;
	}
							 
	var garbage_target = obj_garbage.is_hovered;
	var customer_target = obj_customer.is_hovered;
	
	var another_hovered = obj_glass_small.is_hovered || obj_glass_large.is_hovered;
	
	// CASES WILL ALWAYS CONSIDER A CLICK INSIDE ITS BOUNDING BOX
	if mouse_check_button_pressed(mb_left) && is_hovered
	{
		if current_state == EDraggrableState.Idle && obj_play_manager.allow_selecting_cup
		{
			obj_play_manager.last_pressed_item = object_index;
			obj_play_manager.current_cup_selected_index = 2;
			obj_play_manager.current_cup_selected = object_index;
			
			x = obj_interaction_text.x;
			y = obj_interaction_text.y - 100;
			
			obj_glass_large.x = obj_glass_large.original_position_x;
			obj_glass_large.y = obj_glass_large.original_position_y;
			
			obj_glass_small.x = obj_glass_small.original_position_x;
			obj_glass_small.y = obj_glass_small.original_position_y;
			
			obj_glass_small.current_state = EDraggrableState.Idle;
			obj_glass_large.current_state = EDraggrableState.Idle;
			
			current_state = EDraggrableState.Selected;
		}
		else if current_state == EDraggrableState.Selected
		{
			obj_play_manager.allow_selecting_cup = false;
			
			current_state = EDraggrableState.FollowingCursor;
		}
		else if current_state == EDraggrableState.FollowingCursor
		{
			if !garbage_target && !customer_target && !another_hovered
			{
				obj_play_manager.allow_selecting_cup = true;
				current_state = EDraggrableState.Selected;
				x = obj_interaction_text.x;
				y = obj_interaction_text.y - 100;
			}
			else if garbage_target
			{
				current_state = EDraggrableState.InTrash;
			}
			else if customer_target
			{
				current_state = EDraggrableState.DeliveredToCostumer;
			}
		}
	}
	else if mouse_check_button_pressed(mb_left) && !is_hovered
	{
		if current_state == EDraggrableState.FollowingCursor
		{
			if !garbage_target && !customer_target && !another_hovered
			{
				obj_play_manager.allow_selecting_cup = true;
				current_state = EDraggrableState.Selected;
				x = obj_interaction_text.x;
				y = obj_interaction_text.y - 100;
			}
			else if garbage_target
			{
				current_state = EDraggrableState.InTrash;
			}
			else if customer_target
			{
				current_state = EDraggrableState.DeliveredToCostumer;
			}
		}
	}
}