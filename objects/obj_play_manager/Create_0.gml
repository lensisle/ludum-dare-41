#region TUTORIAL_STUFF

enum ETutorialState
{
	BossSpawn,
	BossEntering,
	BossSpeaking,
	WaitingSelectSize,
	WaitingSelectCoffee
}

dialogues = [
	"Ok new guy, I'm your boss, \nand this is the thing.",
	"To make a good coffee you need to get\nthe preparation in a specific order.",
	"And make it with love.",
	"And with love a mean the exact measurement of ingredients.",
	"Or you fail.",
	"Now, make me a coffee big guy.",
	"First, you need to know the size.",
	"And I want a regular one.",
	"action_size",
	"Good",
	"Now, is extremely important to do all this step in order.",
	"From left to right.",
	"Or your coffee is going to stink.",
	"And here in Duckbucks we like to make things right.",
	"And with love.",
	"Always with love.",
	"So, we make the coffee to the measure\nof the customer, and in\nthe exact way that he wants.",
	"First, you have to put the grams of coffee.",
	"Yeah, here we make coffee with the whole grain.",
	"Put 5 grams in there, and one at a time.",
	"action_coffee"
];

current_tutorial_state = ETutorialState.BossSpawn;
boss = undefined;
current_text = undefined;
dialogues_index = 0;
speaking_extras = false;
extras_text = undefined;

#endregion

#region GAME_STUFF

current_coffee = 

enum ESceneState
{
	NonInitialized,
	CustomerEntering
}

objects_array = [
	obj_glass_large,
	obj_glass_medium,
	obj_glass_small,
	obj_sugar,
	obj_coffee,
	obj_chocolate,
	obj_cream,
	obj_condensed_milk,
	obj_milk_dispenser,
	obj_water_dispenser,
	obj_garbage,
	obj_sweetener
];

customer_spawn_pos_x = room_width + 200;
customer_spawn_pos_y = 100;

current_state = ESceneState.NonInitialized;

#endregion