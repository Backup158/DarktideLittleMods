return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`TextReplacementBase` encountered an error loading the Darktide Mod Framework.")

		new_mod("TextReplacementBase", {
			mod_script       = "TextReplacementBase/scripts/mods/TextReplacementBase/TextReplacementBase",
			mod_data         = "TextReplacementBase/scripts/mods/TextReplacementBase/TextReplacementBase_data",
			mod_localization = "TextReplacementBase/scripts/mods/TextReplacementBase/TextReplacementBase_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
