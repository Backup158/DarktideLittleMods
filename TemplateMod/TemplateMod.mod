return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`TemplateMod` encountered an error loading the Darktide Mod Framework.")

		new_mod("TemplateMod", {
			mod_script       = "TemplateMod/scripts/mods/TemplateMod/TemplateMod",
			mod_data         = "TemplateMod/scripts/mods/TemplateMod/TemplateMod_data",
			mod_localization = "TemplateMod/scripts/mods/TemplateMod/TemplateMod_localization",
		})
	end,
	version = "1.0.0",
	packages = {},
}
