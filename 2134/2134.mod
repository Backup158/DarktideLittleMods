return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`2134` encountered an error loading the Darktide Mod Framework.")

		new_mod("2134", {
			mod_script       = "2134/scripts/mods/2134/2134",
			mod_data         = "2134/scripts/mods/2134/2134_data",
			mod_localization = "2134/scripts/mods/2134/2134_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
