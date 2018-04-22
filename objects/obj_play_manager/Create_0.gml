#region TUTORIAL_STUFF

enum ETutorialState
{
	BossSpawn,
	BossEntering,
	BossSpeaking,
	WaitingSelectSize,
	WaitingSelectCoffee,
	WaitingSelectWater,
	HandleFailed,
	WaitingSelectSugar,
	WaitingSelectChocolate,
	WaitingDeliver,
	EndTutorial
}

dialogues = [
	"Ok new guy, I'm your boss, \nand this is the thing.",
	"To make a good coffee you need to get\nthe preparation in a specific order.",
	"And make it with love.",
	"And with love a mean the exact measurement of ingredients.",
	"Or you fail.",
	"Now, make me a coffee big guy.",
	"First, you need to know the size.",
	"I want a regular one.",
	"action_size", // first action
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
	"action_coffee", // section action
	"Good, now we put the liquids.",
	"The regular size have 300 millimeters of capacity.",
	"The small has 200 ml. and large has 400 ml.",
	"Every time you use the water or\nmilk dispenser, you fill it with 100 ml.",
	"If you exceed the capacity of the cup,\nthe coffee is ruined.",
	"So, having that in mind, give me ⅔ of\nwater, and the rest fill it with milk.",
	"action_water", // third action
	"Wonderful big guy, you are made to do this job.",
	"The next step is the sugar.",
	"I want 2 tablespoons of sugar.",
	"And 10 drops of sweetener.",
	"...",
	"Don’t judge me.",
	"2 tablespoons of sugar and 10 drops of sweetener.",
	"action_sugar", // fourth action
	"Excellent! That's the spirit.",
	"I can see the determination in your eyes when you do this.",
	"Finally, put some chocolate, cream and condensed milk in there, one of each.",
	"action_chocolate", // fifth action,
	"Yeah! That’s a real coffee!",
	"Now, give me that baby.",
	"action_deliver", // sixth action,
	"Aaahh, the aroma of a good coffee in the morning replenishes any soul.",
	"Well, that is all you need to know.",
	"Always do the coffee in this order,\nor the customer is going to be upset.",
	"And we don’t wants upset customers.",
	"We want happy customers.",
	"Customers fills with love.",
	"And I going to pay you for the number of\nhappy customers fills with love.",
	"It's that ok?",
	"Of course is ok.",
	"I can see it in your face.",
	"You are going to love this.",
	"Here comes the first customer",
	"You’re going to do a great job"
];

current_tutorial_state = ETutorialState.BossSpawn;
current_text = undefined;
dialogues_index = 0;
speaking_extras = false;
extras_text = undefined;

#endregion

#region GAME_STUFF

current_customer = undefined;
current_cup_selected = undefined;
current_sugar = 0;
current_coffee = 0;
current_chocolate = 0;
current_cream = 0;
current_condensed_milk = 0;
current_milk = 0;
current_water = 0;
current_sweetener = 0;

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