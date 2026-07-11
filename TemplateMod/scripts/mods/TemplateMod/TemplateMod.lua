local mod = get_mod("TemplateMod")
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