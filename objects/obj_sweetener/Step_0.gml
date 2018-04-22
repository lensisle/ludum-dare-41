/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with obj_play_manager
{
	if other.is_pressed &&
	   obj_game_manager.current_state != EGameState.Tutorial &&
	   check_press_available(current_state)
	{
		other.is_pressed = false;
		current_sweetener += 1;
		last_pressed_item = other.object_index;
	}
}