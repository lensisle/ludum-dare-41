manage_cursor_sprite(objects_array);

if obj_game_manager.current_state == EGameState.Tutorial
{
	if current_tutorial_state == ETutorialState.BossSpawn
	{
		current_customer = instance_create_layer(customer_spawn_pos_x, customer_spawn_pos_y, "Customer", obj_customer);
		current_customer.current_state = ECustomerState.Entering;
		current_tutorial_state = ETutorialState.BossEntering;
	}
	else if current_tutorial_state = ETutorialState.BossEntering
	{
		if current_customer.x <= obj_customer_final_position.bbox_right + 10
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
	}
	else if current_tutorial_state == ETutorialState.BossSpeaking
	{
		// action between dialogue cases
		if dialogues[dialogues_index] == "action_size"
		{
			obj_glass_large.interaction_hover_enabled = true;
			obj_glass_medium.interaction_hover_enabled = true;
			obj_glass_small.interaction_hover_enabled = true;
			current_tutorial_state = ETutorialState.WaitingSelectSize;
			dialogues_index += 1;
		}
		else if dialogues[dialogues_index] == "action_coffee"
		{
			obj_glass_large.interaction_hover_enabled = false;
			obj_glass_medium.interaction_hover_enabled = false;
			obj_glass_small.interaction_hover_enabled = false;
			obj_coffee.interaction_hover_enabled = true;
			current_tutorial_state = ETutorialState.WaitingSelectCoffee;
			dialogues_index += 1;
		}
		else if dialogues[dialogues_index] == "action_water"
		{
			obj_coffee.interaction_hover_enabled = false;
			obj_water_dispenser.interaction_hover_enabled = true;
			obj_milk_dispenser.interaction_hover_enabled = true;
			current_tutorial_state = ETutorialState.WaitingSelectWater;
			dialogues_index += 1;
		}
		else if dialogues[dialogues_index] == "action_sugar"
		{
			obj_water_dispenser.interaction_hover_enabled = false;
			obj_milk_dispenser.interaction_hover_enabled = false;
			
			obj_sugar.interaction_hover_enabled = true;
			obj_sweetener.interaction_hover_enabled = true;
			
			current_tutorial_state = ETutorialState.WaitingSelectSugar;
			dialogues_index += 1;
		}
		else if dialogues[dialogues_index] == "action_chocolate"
		{
			obj_sugar.interaction_hover_enabled = false;
			obj_sweetener.interaction_hover_enabled = false;
			
			obj_chocolate.interaction_hover_enabled = true;
			obj_cream.interaction_hover_enabled = true;
			obj_condensed_milk.interaction_hover_enabled = true;
			
			current_tutorial_state = ETutorialState.WaitingSelectChocolate;
			
			dialogues_index += 1;
		}
		else if dialogues[dialogues_index] == "action_deliver"
		{
			obj_chocolate.interaction_hover_enabled = false;
			obj_cream.interaction_hover_enabled = false;
			obj_condensed_milk.interaction_hover_enabled = false;
			
			current_cup_selected.draggable = true;
			
			current_tutorial_state = ETutorialState.WaitingDeliver;
			
			dialogues_index += 1;
		}
		else 
		{
			if current_text == undefined
			{
				current_text = instance_create_layer(current_customer.x - 300, current_customer.y, "Texts", obj_text);
				current_text.content = dialogues[dialogues_index];
				current_text.char_delay = 2;
			}
			else 
			{
				if current_text.finished && mouse_check_button_pressed(mb_left)
				{
					dialogues_index += 1;
					instance_destroy(current_text);
					current_text = undefined;
				}
				else if current_text && mouse_check_button_pressed(mb_left)
				{
					current_text.skip = true;
				}
			}
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingSelectSize
	{
		if obj_glass_small.is_pressed && !speaking_extras
		{
			speaking_extras = true;
			extras_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
			extras_text.content = "That’s small, big guy.\nGive me the medium one.";
			extras_text.char_delay = 2;
		}
		else if obj_glass_large.is_pressed && !speaking_extras
		{
			speaking_extras = true;
			extras_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
			extras_text.content = "That’s large.\nAnd too much coffee makes me go down the toilet.\nGive me the medium one.";
			extras_text.char_delay = 2;
		}
		else if obj_glass_medium.is_pressed && !speaking_extras
		{
			current_cup_selected = instance_create_layer(obj_interaction_text.x, obj_interaction_text.y - 100, "Table_Element", obj_glass_medium);
			current_tutorial_state = ETutorialState.BossSpeaking
		}
		else 
		{
			if speaking_extras && extras_text && extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				speaking_extras = false;
				instance_destroy(extras_text);
				extras_text = undefined;
			}
			else if speaking_extras && extras_text && !extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				extras_text.skip = true;
			}
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingSelectCoffee  
	{
		if current_coffee >= 5
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
		else if obj_coffee.is_pressed
		{
			obj_coffee.is_pressed = false;
			current_coffee += 1;
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingSelectWater
	{
		if current_water == 2 && current_milk == 1
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
		else if current_water > 2 || current_milk > 1
		{
			if !speaking_extras
			{
				speaking_extras = true;
				extras_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
				extras_text.content = "That’s not what I tell you, the coffee is ruined.\nGet rid of that cup and let’s start over.";
				extras_text.char_delay = 2;
			}
			else if speaking_extras && extras_text && extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				speaking_extras = false;
				instance_destroy(extras_text);
				extras_text = undefined;
				
				obj_water_dispenser.interaction_hover_enabled = false;
				obj_milk_dispenser.interaction_hover_enabled = false;
				current_cup_selected.draggable = true;
				
				current_tutorial_state = ETutorialState.HandleFailed;
			}
			else if speaking_extras && extras_text && !extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				extras_text.skip = true;
			}
		}
		else if obj_water_dispenser.is_pressed
		{
			current_water += 1;
			obj_water_dispenser.is_pressed = false;
		}
		else if obj_milk_dispenser.is_pressed
		{
			current_milk += 1;
			obj_milk_dispenser.is_pressed = false;
		}
	}
	else if current_tutorial_state == ETutorialState.HandleFailed
	{
		if current_cup_selected.is_pressed && !current_cup_selected.following_cursor
		{
			current_cup_selected.is_pressed = false;
			current_cup_selected.following_cursor = true;
		}
		else if current_cup_selected.following_cursor && obj_garbage.is_pressed
		{
			obj_garbage.is_pressed = false;
			instance_destroy(current_cup_selected);
			dialogues_index = 7;
			reset_ingredients();
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingSelectSugar
	{
		if current_sugar == 2 && current_sweetener == 10
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
		else if current_sugar > 2 || current_sweetener > 10
		{
			if !speaking_extras
			{
				speaking_extras = true;
				extras_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
				extras_text.content = "That’s not what I tell you, the coffee is ruined.\nGet rid of that cup and let’s start over.";
				extras_text.char_delay = 2;
			}
			else if speaking_extras && extras_text && extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				speaking_extras = false;
				instance_destroy(extras_text);
				extras_text = undefined;
				
				obj_sugar.interaction_hover_enabled = false;
				obj_sweetener.interaction_hover_enabled = false;
			
				current_cup_selected.draggable = true;
				
				current_tutorial_state = ETutorialState.HandleFailed;
			}
			else if speaking_extras && extras_text && !extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				extras_text.skip = true;
			}
		}
		else if obj_sugar.is_pressed
		{
			current_sugar += 1;
			obj_sugar.is_pressed = false;
		}
		else if obj_sweetener.is_pressed
		{
			current_sweetener += 1;
			obj_sweetener.is_pressed = false;
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingSelectChocolate
	{
		if current_chocolate == 1 && current_cream == 1 && current_condensed_milk == 1
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
		}
		else if current_chocolate > 1 || current_cream > 1 && current_condensed_milk > 1
		{
			if !speaking_extras
			{
				speaking_extras = true;
				extras_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
				extras_text.content = "That’s not what I tell you, the coffee is ruined.\nGet rid of that cup and let’s start over.";
				extras_text.char_delay = 2;
			}
			else if speaking_extras && extras_text && extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				speaking_extras = false;
				instance_destroy(extras_text);
				extras_text = undefined;
				
				obj_chocolate.interaction_hover_enabled = false;
				obj_cream.interaction_hover_enabled = false;
				obj_condensed_milk.interaction_hover_enabled = false;
			
				current_cup_selected.draggable = true;
				
				current_tutorial_state = ETutorialState.HandleFailed;
			}
			else if speaking_extras && extras_text && !extras_text.finished && mouse_check_button_pressed(mb_left)
			{
				extras_text.skip = true;
			}
		}
		else if obj_chocolate.is_pressed
		{
			current_chocolate += 1;
			obj_chocolate.is_pressed = false;
		}
		else if obj_cream.is_pressed
		{
			current_cream += 1;
			obj_cream.is_pressed = false;
		}
		else if obj_condensed_milk.is_pressed
		{
			current_condensed_milk += 1;
			obj_condensed_milk.is_pressed = false;
		}
	}
	else if current_tutorial_state == ETutorialState.WaitingDeliver
	{
		if current_customer.is_pressed
		{
			current_tutorial_state = ETutorialState.BossSpeaking;
			current_customer.is_pressed = false;
		}
	}
}
else 
{
	switch current_state
	{
		case ESceneState.NonInitialized:
			var customer = instance_create_layer(customer_spawn_pos_x, customer_spawn_pos_y, "Customer", obj_customer);
			customer.current_state = ECustomerState.Entering;
			current_state = ESceneState.CustomerEntering;
			break;
	}	
}