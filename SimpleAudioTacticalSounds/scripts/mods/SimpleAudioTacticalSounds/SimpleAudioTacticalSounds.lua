local mod = get_mod("SimpleAudioTacticalSounds")
mod.version = "1.0.0"

-- #############################
-- Data
-- #############################
local tonumber = tonumber

-- ###############
-- Mod Data
-- ###############
local SimpleAudio
local SimpleAudioRandom = {}

local AudioPlugin
local audio_files

local audio_plugin_to_use
local night_vision_alternating
local night_vision_state_play_sound = true

-- #############################
-- Helper Functions
-- #############################
local function check_which_audio_plugin_to_use()
    if SimpleAudio and AudioPlugin then
        audio_plugin_to_use = mod:get("option_audio_plugin_to_use")
    -- At this point, only one or both
    elseif SimpleAudio then
        audio_plugin_to_use = "SimpleAudio"
    elseif AudioPlugin then
        audio_plugin_to_use = "AudioPlugin"
    end
end

local function refresh_settings_cache()
    check_which_audio_plugin_to_use()
    night_vision_alternating = mod:get("night_vision_only_first")
end

-- ###############
-- Play Sound
-- ###############
function mod.base_play_custom_audio(audio_name, volume)
    if audio_plugin_to_use == "SimpleAudio" then
        SimpleAudioRandom[audio_name]:play({
            audio_type = "sfx",
            volume = volume or "100",
        })
    elseif audio_plugin_to_use == "AudioPlugin" then
        AudioPlugin.play_file(audio_files:random(audio_name), { 
            audio_type = "sfx",
            volume = tonumber(volume) or 100
        })
    end
end

function mod.play_night_vision() 
    if not night_vision_alternating then
        mod.base_play_custom_audio("night_vision", "100")
        -- Doesn't need to do the rest of the checks if not using alternating mode
        return
    -- Using alternating mode
    elseif night_vision_state_play_sound then
        mod.base_play_custom_audio("night_vision", "100")
    end
    -- Switches current state regardless of if audio played
    night_vision_state_play_sound = not night_vision_state_play_sound
end

function mod.play_fire_select() 
    mod.base_play_custom_audio("fire_select", "120")
end

function mod.play_radio_chirp() 
    mod.base_play_custom_audio("radio_chirp", "100")
end

-- #########################################
-- Hooks
-- #########################################

-- #########################################
-- Event Executions
-- #########################################
-- Command to reset night vision toggle state
mod:command("tactical_sounds_reset_night_vision", mod:localize("command_reset_night_vision_state"), function()
    night_vision_state_play_sound = true
end)

function mod.on_all_mods_loaded()
    mod:info("v" .. mod.version .. mod:localize("mod_version_logging_message"))

    SimpleAudio = get_mod("SimpleAudio")
    AudioPlugin = get_mod("Audio")
	if (not SimpleAudio) and (not AudioPlugin) then
		mod:error(mod:localize("error_no_audio_frameworks"))
		return
	end
    -- Registers file player if using Audio
    if AudioPlugin then
        audio_files = AudioPlugin.new_files_handler()
    end
    if SimpleAudio then
        SimpleAudioRandom.night_vision = SimpleAudio.glob("night_vision/*")
        SimpleAudioRandom.fire_select = SimpleAudio.glob("fire_select/*")
        SimpleAudioRandom.radio_chirp = SimpleAudio.glob("radio_chirp/*")
    end
    
    refresh_settings_cache()
end

function mod.on_setting_changed()
    refresh_settings_cache()
end