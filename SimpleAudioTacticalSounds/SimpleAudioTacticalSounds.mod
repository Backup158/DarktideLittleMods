return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`SimpleAudioTacticalSounds` encountered an error loading the Darktide Mod Framework.")

		new_mod("SimpleAudioTacticalSounds", {
			mod_script       = "SimpleAudioTacticalSounds/scripts/mods/SimpleAudioTacticalSounds/SimpleAudioTacticalSounds",
			mod_data         = "SimpleAudioTacticalSounds/scripts/mods/SimpleAudioTacticalSounds/SimpleAudioTacticalSounds_data",
			mod_localization = "SimpleAudioTacticalSounds/scripts/mods/SimpleAudioTacticalSounds/SimpleAudioTacticalSounds_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
