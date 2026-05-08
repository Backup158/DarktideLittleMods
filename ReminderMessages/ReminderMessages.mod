return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ReminderMessages` encountered an error loading the Darktide Mod Framework.")

		new_mod("ReminderMessages", {
			mod_script       = "ReminderMessages/scripts/mods/ReminderMessages/ReminderMessages",
			mod_data         = "ReminderMessages/scripts/mods/ReminderMessages/ReminderMessages_data",
			mod_localization = "ReminderMessages/scripts/mods/ReminderMessages/ReminderMessages_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
