if obj_game_manager.current_state != EGameState.Tutorial
{
	var text =  "Cup Size " + + string(current_cup_selected_index) + " required " + string(cup_requirement) +
				"\ncurrent sugar " + string(current_sugar) + " required " + string(sugar_requirement) +
	            "\ncurrent coffee " + string(current_coffee) + " required " + string(coffee_requirement) +
				"\ncurrent chocolate " + string(current_chocolate) + " required " + string(chocolate_requirement) +
				"\ncurrent cream " + string(current_cream) + " required " + string(cream_requirement) +
				"\ncurrent condensed milk " + string(current_condensed_milk) + " required " + string(condensed_milk_requirement) +
				"\ncurrent milk " + string(current_milk) + " required " + string(milk_requirement) +
				"\ncurrent water " + string(current_water) + " required " + string(water_requirement) +
				"\ncurrent sweetener " + string(current_sweetener) + " required " + string(sweetener_requirement);
		
	draw_set_color(c_red);
 	draw_text(10, 10, text);
	draw_set_color(c_white);
}


