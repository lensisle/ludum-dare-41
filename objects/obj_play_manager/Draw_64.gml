if obj_game_manager.current_state != EGameState.Tutorial
{
	var text =  "Cup Size " + + string(current_cup_selected_index) +
				"\ncurrent sugar " + string(current_sugar) +
	            "\ncurrent coffee " + string(current_coffee) +
				"\ncurrent chocolate " + string(current_chocolate) +
				"\ncurrent cream " + string(current_cream) + 
				"\ncurrent condensed milk " + string(current_condensed_milk) +
				"\ncurrent milk " + string(current_milk) +
				"\ncurrent water " + string(current_water) +
				"\ncurrent sweetener " + string(current_sweetener);
 	draw_text(10, 10, text);
}


