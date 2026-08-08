local mod = get_mod("scoreboard_perfect_blocks")
mod.version = "1.0.0"

-- #############################
-- Data
-- #############################
-- ###############
-- Requirements and Performance
-- ###############

-- ###############
-- Mod Locals
-- ###############
local scoreboard = get_mod("scoreboard")
local scoreboard_row_name = "perfect_blocks"
local debug

mod.scoreboard_rows = {
	{
		name = scoreboard_row_name,
		text = scoreboard_row_name,
		validation = "ASC",
		iteration = "ADD",
		group = "team",
		-- setting = "option_perfect_blocks",
	},
}

-- #############################
-- Helper Functions
-- #############################
local function refresh_settings_cache()
	debug = mod:get("enable_debug_mode")
end

-- #########################################
-- Hooks
-- #########################################

mod:hook_require("scripts/managers/attack_report/attack_report_manager", function(instance)
	mod:hook_safe(instance, "_process_attack_result", function(self, buffer_data, ...)
		local attacked_unit = buffer_data.attacked_unit
		local attack_result = buffer_data.attack_result
		local player_unit_spawn_manager = Managers.state.player_unit_spawn
		local attacked_player

		if attacked_unit then
			attacked_player = player_unit_spawn_manager:owner(attacked_unit)
			mod:info("Attacked player: "..tostring(attacked_player))
		else
			return
		end

		-- Only care if it's a blocked attack
		if not (tostring(attack_result) == "blocked") then
			return
		end

		local attack_result_id = NetworkLookup.attack_results[attack_result]
		-- Attack result ID always seems to be 1 for blocked, regardless of perfect or not
		local attack_type_id = NetworkLookup.attack_types[attack_result_id]
		mod:info("Attack result: "..tostring(attack_result))
		mod:info("Attack result id: "..tostring(attack_result_id))
		mod:info("Attack type id: "..tostring(attack_type_id))
        --  scoreboard:update_stat(scoreboard_row_name, player, 1)
    end)
end)

-- Detects perfect block in ONLINE for player only
mod:hook(CLASS.WeaponSystem, "rpc_player_blocked_attack", function(func, self, channel_id, unit_id, attacking_unit_id, hit_world_position, block_broken, weapon_template_id, attack_type_id, ...)
	local player_unit = Managers.state.unit_spawner:unit(unit_id)
	local player = Managers.player:player_by_unit(player_unit)
	--if player and type(player) == "table" then table.dump(player, "Player table uwu nya ^.^", 10) end
	-- player._telemetry_subject.character_id or account_id | _social_service_manager._players_by_account_id first thing is an id
	local attacking_unit = Managers.state.unit_spawner:unit(attacking_unit_id)
	-- crashes when hit by enemy
	--local weapon_template_name = NetworkLookup.weapon_templates[weapon_template_id]
	--local weapon_template = WeaponTemplates[weapon_template_name]
	local attack_type = NetworkLookup.attack_types[attack_type_id]
	-- Gets player info to use to check weapon
	if debug then 
		mod:echo("rpc_blocked_attack by "..tostring(player_unit).." (Player: "..tostring(player)..") Attack type: "..tostring(attack_type)) 
	end
	-- At this point, it calls Block.player_blocked_attack(). That'd be great to hook into, but it only works in offline lol.
end)

-- Detects perfect block in OFFLINE. The RPC doesn't fire off in offline.
mod:hook_require("scripts/utilities/attack/block", function(instance)
	mod:hook(instance, "player_blocked_attack", function(self, target_unit, attacking_unit, hit_world_position, block_broken, weapon_template, attack_type, block_cost, is_perfect_block, ...)
		if is_perfect_block then
			if debug then mod:echo("Offline: Perfect Block performed") end
			local player = Managers.player:player_by_unit(target_unit)
			local account_id = player:account_id() or player:name()
			scoreboard:update_stat(scoreboard_row_name, account_id, 1)
		end
    end)
end)

-- #########################################
-- Event Executions
-- #########################################
function mod.on_all_mods_loaded()
	refresh_settings_cache()
    mod:info("v" .. mod.version .. mod:localize("mod_version_logging_message"))
end

function mod.on_setting_changed()
	refresh_settings_cache()
    --if mod.using_debug_mode then mod:echo("Settings changed") end
end

