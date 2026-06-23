local mod = get_mod("SimpleAudioTacticalSounds")



return {
	mod_name = {
		en = "Tactical Sounds (SimpleAudio)",
	},
	mod_description = {
		en = "Plays various tactical sounds on button press.",
	},
	-- Version logging message appears after the version number, such as: v3.4.2 loaded uwu nya :3
	mod_version_logging_message = {
		en = " loaded uwu nya :3",
	},
	-- --------------------------
	-- Widgets
	-- --------------------------
	enable_debug_mode = {
		en = "Enable debug mode",
	},
	enable_debug_mode_description = {
		en = "For development. Logs more information on what's happening in the code.",
	},
	toggle_mod_keybind = {
		en = "Toggle Mod",
	},
	toggle_mod_keybind_description = {
		en = "Button to enable/disable this mod.",
	},
	option_audio_plugin_to_use = {
		en = "Audio Plugin to Prefer",
	},
	option_audio_plugin_to_use_description = {
		en = "If you have both SimpleAudio and Audio, this setting determines which one this mod will use. Otherwise, it'll just use the one you have.",
	},
	-- yes i just copied the localizations from their mods
	option_audio_plugin_to_use_simple_audio = {
		en = "Simple Audio",
		["zh-cn"] = "简易音频",
	},
	option_audio_plugin_to_use_simple_audio_description = {
		en = "By DeluxGhost",
	},
	option_audio_plugin_to_use_audio = {
		en = "Audio Plugin",
		["ru"] = "Аудио плагин",
    	["zh-cn"] = "音频插件",
	},
	option_audio_plugin_to_use_audio_description = {
		en = "By SeventeenDucks (ronvoluted)",
	},
	-- -------------
	-- Sounds to Use
	-- -------------
}
