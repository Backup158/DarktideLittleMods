local mod = get_mod("SimpleAudioTacticalSounds")



return {
	mod_name = {
		en = "Tactical Foley",
	},
	mod_description = {
		en = "Plays various tactical sounds on button press.",
	},
	-- Version logging message appears after the version number, such as: v3.4.2 loaded uwu nya :3
	mod_version_logging_message = {
		en = " loaded uwu nya :3",
	},
	error_no_audio_frameworks = {
		en = "No Audio frameworks are present. You need to have SimpleAudio OR Audio.",
	},
	command_reset_night_vision_state = {
		en = "Resets alternating night vision sound state, to where the next button press would be Press #1. See the Mod Options for Tactical Foley for more information.",
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
	sounds_to_use = {
		en = "Sounds to Play",
	},
	sounds_to_use_description = {
		en = "Set keybinds for the following sound events. Leave the keybind blank for the ones you don't want to use.",
	},
	-- I'm using onomatopoeia as the description. That may not translate well, haha.
	night_vision = {
		en = "Night Vision Goggles",
	},
	night_vision_description = {
		en = "Plays a *vweeeee* sound to mimic turning on night vision goggles (or night optical devices).",
	},
	night_vision_only_first = {
		en = "Alternating activation",
	},
	night_vision_only_first_description = {
		en = "Only plays sound every other time the button is pressed.\nPress #1 (sound plays) --> Press #2 (no sound) --> Press #3 (sound plays) --> Press #4 (no sound) and so on\n\nIf this gets out of sync with your ReShade toggle, type \"/tactical_sounds_reset_night_vision\" into chat to reset the state (where the next button press would be Press #1).",
	},
	fire_select = {
		en = "Fire Selection Switch",
	},
	fire_select_description = {
		en = "Plays a click sound to mimic flipping the fire selection switch on a gun.",
	},
	radio_chirp = {
		en = "Walkie-Talkie Chirp",
	},
	radio_chirp_description = {
		en = "Plays a radio *krrrch* sound. It plays once when you first press the button, then again when you let go of the button.",
	},

}
