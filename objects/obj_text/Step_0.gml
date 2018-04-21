if !finished
{
	if skip
	{
		content_buffer = content;
		content_index = string_length(content);
		finished = true;
	}
	else
	{
		current_delay_count += 1;

		if current_delay_count > char_delay 
		{
			var content_len = string_length(content);
		
			if content_len > 0 && content_index < content_len
			{
				current_delay_count = 0;
				content_index += 1;
				content_buffer += string_copy(content, content_index, 1);
			}
			else 
			{
				finished = true;
			}
		}
	}
}

