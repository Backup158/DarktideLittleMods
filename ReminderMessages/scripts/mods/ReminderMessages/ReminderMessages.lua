local mod = get_mod("ReminderMessages")
mod.version = "1.0.0"

-- #############################
-- Requirements
-- #############################
-- Gets current language
-- Thanks, Ashe
local current_lang = Application.user_setting("language_id")
local option_locs = {}
option_locs[current_lang] = Managers.localization:localize(game_loc)

-- #############################
-- Helper Functions
-- #############################


-- #########################################
-- Hooks
-- #########################################

-- #########################################
-- Event Executions
-- #########################################
function mod.on_all_mods_loaded()
    mod:info("v" .. mod.version .. mod:localize("mod_version_logging_message"))
end

function mod.on_setting_changed()
    --if mod.using_debug_mode then mod:echo("Settings changed") end
end