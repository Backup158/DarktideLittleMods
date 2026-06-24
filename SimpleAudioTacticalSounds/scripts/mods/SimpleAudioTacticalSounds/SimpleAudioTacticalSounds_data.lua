local mod = get_mod("SimpleAudioTacticalSounds")

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
				setting_id = "toggle_mod_keybind",
				type = "keybind",
				keybind_global = false,
				keybind_trigger = "pressed",
				keybind_type = "mod_toggle", 
				default_value = {}, 
			},
			{
				setting_id = "option_audio_plugin_to_use",
				type = "dropdown",
				default_value = "SimpleAudio",
				options = {
					{ 
						text = "option_audio_plugin_to_use_simple_audio", 
						value = "SimpleAudio",
					},
					{ 
						text = "option_audio_plugin_to_use_audio", 
						value = "Audio",
					},
					--[[ cba to actually support this
					{ 
						text = "option_audio_plugin_to_use_mini_audio", 
						value = "MiniAudioAddon",
					},
					 ]]
				}, 
			},
			{
				setting_id = "sounds_to_use",
				type = "group",
				sub_widgets = {
					{
						setting_id = "night_vision_group",
						title = "night_vision",
						type = "group",
						sub_widgets = {
							{
								setting_id = "night_vision",
								type = "keybind",
								keybind_global = false,
								keybind_trigger = "pressed",
								keybind_type = "function_call", 
								function_name = "play_night_vision", 
								default_value = {}, 
							},
							{
								setting_id = "night_vision_only_first",
								type = "checkbox",
								default_value = false, 
							},
						},
					},
					{
						setting_id = "fire_select",
						type = "keybind",
						keybind_global = false,
						keybind_trigger = "pressed",
						keybind_type = "function_call", 
						function_name = "play_fire_select", 
						default_value = {}, 
					},
					{
						setting_id = "radio_chirp",
						type = "keybind",
						keybind_global = false,
						keybind_trigger = "held",
						keybind_type = "function_call", 
						function_name = "play_radio_chirp", 
						default_value = {}, 
					},
				}
			},
		},
	}
}
