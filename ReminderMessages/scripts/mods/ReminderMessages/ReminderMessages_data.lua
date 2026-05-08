local mod = get_mod("ReminderMessages")
return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = { 
		widgets = {
			{
				setting_id = "enable_debug_mode",
				type = "checkbox",
				default_value = false, 
			},
			{
				setting_id = "message_use",
				type = "group",
				sub_widgets = {
					{
						setting_id = "message_use_notify",
						type = "checkbox",
						default_value = true, 
					},
					{
						setting_id = "message_use_sound",
						type = "checkbox",
						default_value = false, 
					},
				},
			},
			{
				setting_id = "notify_when",
				type = "group",
				sub_widgets = {
					{
						setting_id = "notify_immediately",
						type = "checkbox",
						default_value = false, 
						sub_widgets = {
							{
								setting_id = "notify_time_interval",
								type = "numeric",
								range = {1, 69420},
								unit_text = "notify_time_interval_units",
								decimals_number = 0,
								default_value = 300, -- default 5 mins 
							},
						},
					},
					{
						setting_id = "notify_after_game",
						type = "checkbox",
						default_value = false, 
					},
				},
			},
		},
	}
}
