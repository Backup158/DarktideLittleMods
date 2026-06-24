local mod = get_mod("SimpleAudioTacticalSounds")
mod.version = "1.0.0"

-- #############################
-- Requirements
-- #############################

local SimpleAudio
local AudioPlugin
local audio_files
local audio_plugin_to_use

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

function mod.play_night_vision() 
    if audio_plugin_to_use == "SimpleAudio" then
        SimpleAudio.play_file("night_vision/night-vision-device-version-2.mp3", {
            audio_type = "sfx",
        })
    elseif audio_plugin_to_use == "AudioPlugin" then
        AudioPlugin.play_file(audio_files:random("night_vision"), { audio_type = "sfx" })
    end
end

function mod.play_fire_select() 
    if audio_plugin_to_use == "SimpleAudio" then
        SimpleAudio.play_file("fire_select/fire_select_rifle_0.ogg", {
            audio_type = "sfx",
        })
    elseif audio_plugin_to_use == "AudioPlugin" then
        AudioPlugin.play_file(audio_files:random("fire_select"), { audio_type = "sfx" })
    end
end
function mod.play_radio_chirp() 
    if audio_plugin_to_use == "SimpleAudio" then
        SimpleAudio.play_file("radio_chirp/walkie-talkie.mp3", {
            audio_type = "sfx",
        })
    elseif audio_plugin_to_use == "AudioPlugin" then
        AudioPlugin.play_file(audio_files:random("radio_chirp"), { audio_type = "sfx" })
    end
end

-- #########################################
-- Hooks
-- #########################################

-- #########################################
-- Event Executions
-- #########################################
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
    check_which_audio_plugin_to_use()

end

function mod.on_setting_changed()
    check_which_audio_plugin_to_use()
end