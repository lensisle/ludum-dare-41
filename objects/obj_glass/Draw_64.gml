/// @description Insert description here
// You can write your code in this editor

if is_hovered && string_length(interaction_text) > 0
{
	var t_x = obj_interaction_text.x;
	var t_y = obj_interaction_text.y;
	draw_text(t_x, t_y, interaction_text);
}