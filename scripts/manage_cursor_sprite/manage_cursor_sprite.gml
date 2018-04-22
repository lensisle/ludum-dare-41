/// @desc Script that is used to manage the cursor sprite
/// @arg objects_array - string

var objects = argument0;
var forceHoverCheck = argument1;
var someHovered = false;

for (var i = 0; i < array_length_1d(objects); i++)
{
	var instancesNum = instance_number(objects[i]);
	for (var j = 0; j < instancesNum; j++)
	{
		var instance = instance_find(objects[i], j);
		if instance.is_hovered && (instance.interaction_hover_enabled || forceHoverCheck)
		{
			someHovered = true;
		}
	}
}

if someHovered 
{
	window_set_cursor(cr_none);
	cursor_sprite = spr_cursor;
}
else 
{
	window_set_cursor(cr_arrow);
	cursor_sprite = spr_cursor_none;
}