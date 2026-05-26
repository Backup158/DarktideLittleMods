local mod = get_mod("TextReplacementBase")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = { 
		widgets = {
			{
				name = "enable_debug_mode",
				type = "checkbox",
				default_value = false,
			},
		}
	}
}
