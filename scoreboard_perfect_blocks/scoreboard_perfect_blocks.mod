return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`scoreboard_perfect_blocks` encountered an error loading the Darktide Mod Framework.")

		new_mod("scoreboard_perfect_blocks", {
			mod_script       = "scoreboard_perfect_blocks/scripts/mods/scoreboard_perfect_blocks/scoreboard_perfect_blocks",
			mod_data         = "scoreboard_perfect_blocks/scripts/mods/scoreboard_perfect_blocks/scoreboard_perfect_blocks_data",
			mod_localization = "scoreboard_perfect_blocks/scripts/mods/scoreboard_perfect_blocks/scoreboard_perfect_blocks_localization",
		})
	end,
	require = {
		"scoreboard",
	},
	load_after = {
		"scoreboard",
	},
	version = "1.0.0",
	packages = {},
}
