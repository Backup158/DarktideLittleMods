local mod = get_mod("TextReplacementBase")

return {
	mod_name = {
		en = "Text Replacement",
	},
	mod_description = {
		en = "Replaces some text in-game.",
	},
	-- Version logging message appears after the version number, such as: v3.4.2 loaded uwu nya :3
	mod_version_logging_message = {
		en = " loaded uwu nya :3",
	},
	command_dump_description = {
		en = "[THIS DOESN'T WORK RIGHT NOW] Dumps all localization IDs and strings into the console log. Yes this is messy and unideal, but I don't want to deal with file:write. Sowwy :3",
	},
	command_dump_begin = {
		en = "Dumping localization IDs and strings. Prepare yourself.",
	},
	command_dump_message_in_log = {
		en = "uwu dumping localization IDs and stwings ^.^",
	},
	command_dump_end = {
		en = "Localization dump complete.",
	},
}
