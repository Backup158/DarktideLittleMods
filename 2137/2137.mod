return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`2137` encountered an error loading the Darktide Mod Framework.")

		new_mod("2137", {
			mod_script       = "2137/scripts/mods/2137/2137",
			mod_data         = "2137/scripts/mods/2137/2137_data",
			mod_localization = "2137/scripts/mods/2137/2137_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
