local mod = get_mod("ReminderMessages")

-- ##################
-- Data and Performance
-- ##################
local table = table
local table_insert = table.insert
local table_clone = table.clone

-- Loads available messages
--	this file loads before localization
mod:io_dofile("ReminderMessages/scripts/mods/ReminderMessages/Messages")

local notifications_used = {}
for message_option, _ in pairs(mod.messages) do
	table.insert(notifications_used, {
		setting_id = message_option,
		type = "checkbox",
		default_value = false, 
		sub_widgets = {
			{
				setting_id = "notify_immediately_"..message_option,
				title = "notify_immediately",
				tooltip = "notify_immediately_description",
				type = "checkbox",
				default_value = false, 
				sub_widgets = {
					{
						setting_id = "notify_time_interval_"..message_option,
						title = "notify_time_interval",
						tooltip = "notify_time_interval_description",
						type = "numeric",
						range = {1, 69420},
						unit_text = "notify_time_interval_units",
						decimals_number = 0,
						default_value = 300, -- default 5 mins 
					},
				},
			},
			{
				setting_id = "notify_after_game_"..message_option,
				title = "notify_after_game",
				tooltip = "notify_after_game_description",
				type = "checkbox",
				default_value = false, 
			},
		}
	})
end

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
				setting_id = "notifications_to_use",
				type = "group",
				sub_widgets = notifications_used,
			},
		},
	}
}
