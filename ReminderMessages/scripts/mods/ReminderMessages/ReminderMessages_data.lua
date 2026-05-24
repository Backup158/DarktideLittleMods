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

local widget_tabs = {
	{
		setting_id = "enable_debug_mode",
		type = "checkbox",
		default_value = false, 
	},
	{
		setting_id = "im_feeling_lucky",
		type = "numeric",
		default_value = 0, 
		range = {0, 10000000},
	},
}
for message_option, _ in pairs(mod.messages) do
	table_insert(widget_tabs, {
		setting_id = message_option,
		--tab = mod:localize(message_option), -- eh it works fine as is
		tooltip = message_option.."_description",
		type = "group",
		sub_widgets = {
			{
				setting_id = "message_use_"..message_option,
				title = "message_use",
				tooltip = "message_use_description",
				type = "group",
				sub_widgets = {
					{
						setting_id = "message_use_echo_"..message_option,
						title = "message_use_echo",
						tooltip = "message_use_echo_description",
						type = "checkbox",
						default_value = true, 
					},
					{
						setting_id = "message_use_notify_"..message_option,
						title = "message_use_notify",
						tooltip = "message_use_notify_description",
						type = "checkbox",
						default_value = true, 
					},
					{
						setting_id = "message_use_sound_"..message_option,
						title = "message_use_sound",
						tooltip = "message_use_sound_description",
						type = "checkbox",
						default_value = false, 
					},
				},
			},
			{
				setting_id = "notifications_to_use_"..message_option,
				title = "notifications_to_use",
				tooltip = "notifications_to_use_description",
				type = "group",
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
						setting_id = "notify_on_load_screen_"..message_option,
						title = "notify_on_load_screen",
						tooltip = "notify_on_load_screen_description",
						type = "checkbox",
						default_value = false, 
						--[[
						sub_widgets = {
							{
								setting_id = "notify_on_load_screen_cooldown_"..message_option,
								title = "notify_on_load_screen_cooldown",
								tooltip = "notify_on_load_screen_cooldown_description",
								type = "numeric",
								range = {1, 2000},
								unit_text = "notify_time_interval_units",
								decimals_number = 0,
								default_value = 180, -- default 3 mins 
							},
						},
						]]
					},
					{
						setting_id = "notify_on_death_"..message_option,
						title = "notify_on_death",
						tooltip = "notify_on_death_description",
						type = "checkbox",
						default_value = false, 
					},
					{
						setting_id = "notify_after_win_"..message_option,
						title = "notify_after_win",
						tooltip = "notify_after_win_description",
						type = "checkbox",
						default_value = false, 
					},
					{
						setting_id = "notify_after_loss_"..message_option,
						title = "notify_after_loss",
						tooltip = "notify_after_loss_description",
						type = "checkbox",
						default_value = false, 
					},
				},
			},
		}
	})
end

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = { 
		widgets = widget_tabs,
	}
}
