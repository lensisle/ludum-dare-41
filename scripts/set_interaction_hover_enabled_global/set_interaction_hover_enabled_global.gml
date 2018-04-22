var objects = argument0;
var enabled = argument1;

for (var i = 0; i < array_length_1d(objects); i++)
{
	var instancesNum = instance_number(objects[i]);
	for (var j = 0; j < instancesNum; j++)
	{
		var instance = instance_find(objects[i], j);
		instance.interaction_hover_enabled = enabled;
	}
}