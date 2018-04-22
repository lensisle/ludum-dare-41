/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with obj_play_manager
{
	if other.is_pressed && obj_game_manager.current_state != EGameState.Tutorial
	{
		other.is_pressed = false;
		current_cup_selected_index = 3;
	}
}