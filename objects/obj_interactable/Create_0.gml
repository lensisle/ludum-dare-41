is_pressed = false;
is_hovered = false;
obj_width = sprite_get_width(object_get_sprite(object_index)) * image_xscale;
obj_height = sprite_get_height(object_get_sprite(object_index)) * image_yscale;
interaction_text = "default interaction text " + string(image_xscale) + " " + string(image_yscale);
interaction_hover_enabled = false;
draggable = false;
following_cursor = false;