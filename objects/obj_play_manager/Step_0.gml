manage_cursor_sprite(objects_array);

if obj_game_manager.current_state == EGameState.Tutorial
{
	if current_tutorial_state == ETutorialState.BossSpawn
	{
		boss = instance_create_layer(customer_spawn_pos_x, customer_spawn_pos_y, "Customer", obj_customer);
		boss.current_state = ECustomerState.Entering;
		current_tutorial_state = ETutorialState.BossEntering;
	}
	else if current_tutorial_state = ETutorialState.BossEntering
	{
		if boss.x <= obj_customer_final_position.bbox_right + 10
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
		else 
		{
			if current_text == undefined
			{
				current_text = instance_create_layer(boss.x - 300, boss.y, "Texts", obj_text);
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