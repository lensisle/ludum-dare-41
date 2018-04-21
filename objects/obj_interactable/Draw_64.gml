
if is_hovered && string_length(interaction_text) > 0 && interaction_hover_enabled
{
	image_index = 1;
	var t_x = obj_interaction_text.x;
	var t_y = obj_interaction_text.y;
	draw_text(t_x, t_y, interaction_text);
}
else 
{
	image_index = 0;
}