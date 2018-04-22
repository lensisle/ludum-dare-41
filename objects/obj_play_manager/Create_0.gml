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
	"So, having that in mind, give me 2/3 of\nwater, and the rest fill it with milk.",
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
	"You’re going to do a great job",
	"action_finish" // final action
];

current_tutorial_state = ETutorialState.BossSpawn;
current_text = undefined;
dialogues_index = 0;
speaking_extras = false;
extras_text = undefined;

#endregion

#region GAME_STUFF

// DATA

greetings = [
	"Sup! I want a",
	"Hello there! Can you give me a",
	"Hi, I need a",
	"Good day! Give me a",
	"Ok, a",
	"Hey, how its going, I want a",
	"Hello, I need a",
	"So, I want a",
	"Hey cutie, give me a",
	"Quick! a",
	"My favorite place! I want a",
	"Custom coffee? Awesome! Give me a",
	"I need coffee. And quick. Give me a"
];

coffee_size_messages = [
	"Large one, please.",
	"Medium one, please.",
	"Small one, please."
];

milk_water_messages_large = [
	"Just milk please.",
	"Can you put more milk than water?",
	"Put half water, and half milk.",
	"Put half water, and half milk.",
	"Put Water, and a just a tiny bit of milk.",
	"Put 3/4 of water, and the rest with milk.",
	"Can you put more water than milk?",
	"Without milk please."
];

milk_water_messages_medium = [
	"Put water, and a tiny bit of milk.",
	"Just full water.",
	"Just full milk.",
	"Put more milk than water.",
	"Put more water than milk."
];

milk_water_messages_small = [
	"Put half water, and half milk",
	"Just water please",
	"Just milk please"
];

close_message_success = [
	"Thank you.",
	"This better be good.",
	"Finally!",
	"Thank you handsome.",
	"Yey!",
	"Wonderful.",
	"Coffee, coffee, coffee!",
	"This smells great.",
	"Lovely.",
	"Thanks!",
	"I love coffee.",
	"Coffee is love.",
	"You’re the best!",
	"You rock.",
	"Thanks sweety!",
	"Awesome!",
	"Perfect."
];

close_message_fail = [
	"You take too long! I’m out.",
	"Can you be more slow? I’m going to buy in Planetbucks.",
	"I can’t wait any longer, forget the coffee!",
	"You suck. Bye.",
	"I don’t have time for this, I’m out.",
	"You take too long, goodbye."
];

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

cup_requirement = 0;
sugar_requirement = 0;
coffee_requirement = 0;
chocolate_requirement = 0;
cream_requirement = 0;
condensed_milk_requirement = 0;
milk_requirement = 0;
water_requirement = 0;
sweetener_requirement = 0;

enum ESceneState
{
	NonInitialized,
	CustomerEntering,
	CustomerLeaving
}

enum ECustomerType
{
	None,
	StepByStep
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
customer_type = ECustomerType.None;

#endregion