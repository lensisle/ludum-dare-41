enum ECustomerState
{
	Idle,
	Entering,
	Leaving
}

current_state = ECustomerState.Idle;
customer_life = 10;
customer_speed = 5;
customer_wait_time = 600;

image_index = 0;
image_speed = 0;

is_pressed = false;
is_hovered = false;
obj_width = sprite_get_width(object_get_sprite(object_index)) * image_xscale;
obj_height = sprite_get_height(object_get_sprite(object_index)) * image_yscale;
interaction_hover_enabled = false;