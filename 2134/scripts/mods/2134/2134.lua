local mod = get_mod("2134")
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
local simple_audio
local simple_audio_random

-- #############################
-- Helper Functions
-- #############################
function mod.crash_game(play_id)
    -- Triggering a deadlock
    for i = 1, 9999 do
        mod:echo("HAHAHAHHAHAHAHAH")
    end
    error(mod:localize("jan_pawel_is_dead"))
end


local function play_barka()
    simple_audio.play_file("barka.mp3", {
        audio_type = "sfx",
        volume = mod_option_volume or 100,
        on_finished = crash_game
    })
end

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