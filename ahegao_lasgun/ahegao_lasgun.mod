return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ahegao_lasgun` encountered an error loading the Darktide Mod Framework.")

		new_mod("ahegao_lasgun", {
			mod_script       = "ahegao_lasgun/scripts/mods/ahegao_lasgun/ahegao_lasgun",
			mod_data         = "ahegao_lasgun/scripts/mods/ahegao_lasgun/ahegao_lasgun_data",
			mod_localization = "ahegao_lasgun/scripts/mods/ahegao_lasgun/ahegao_lasgun_localization",
		})
	end,
	version = "1.0.0",
	require = {
		"SimpleAssets",
	},
	load_after = {
		"SimpleAssets",
	},
	packages = {},
}
