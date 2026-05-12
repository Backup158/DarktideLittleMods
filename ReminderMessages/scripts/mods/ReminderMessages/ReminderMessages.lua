-- ============================
-- ----------------------------
-- ReminderMessages
-- @Backup158
-- Created: 2026-05-09
-- Updated: 2026-05-09
-- ----------------------------
-- ============================
local mod = get_mod("ReminderMessages")
mod.version = "1.0.0"

-- #########################################
-- Data
-- #########################################
-- #############################
-- Performance
-- #############################
local pairs = pairs
local string = string
local string_match = string.match
local table = table
local table_clone = table.clone
local table_shallow_copy = table.shallow_copy

-- #############################
-- Mod Locals
-- #############################
-- hmm read online that table access is similar for global/local
-- local messages_cache = table_clone(mod.messages)
local settings_messages = table_shallow_copy(mod.messages)
local use_notify
local use_sound
local using_debug_mode

-- #############################
-- Requirements
-- #############################
local LoadingView = require("scripts/ui/views/loading_view/loading_view")
local LocalizationManager = class("LocalizationManager")
-- Gets current language
-- Thanks, Ashe
--local current_language = Application.user_setting("language_id") or LocalizationManager.language() or LocalizationManager._language
local current_language
-- Managers.localization:localize(game_loc)

-- #############################
-- Helper Functions
-- #############################
local function refresh_settings_cache() 
    using_debug_mode = mod:get("using_debug_mode")
    use_notify = mod:get("message_use_notify")
    use_sound = mod:get("message_use_sound")
    current_language = LocalizationManager._language

    for reminder_name, val in pairs(settings_messages) do
        if not val then
            settings_messages[reminder_name] = {}
        end
        settings_messages[reminder_name].notify_immediately = mod:get("notify_immediately_"..reminder_name)
        settings_messages[reminder_name].notify_immediately_timer = mod:get("notify_time_interval_"..reminder_name)
        settings_messages[reminder_name].after_win = mod:get("notify_after_win_"..reminder_name)
        settings_messages[reminder_name].after_loss = mod:get("notify_after_loss_"..reminder_name)
        settings_messages[reminder_name].on_death = mod:get("notify_on_death_"..reminder_name)
        settings_messages[reminder_name].on_load_screen = mod:get("notify_on_load_screen_"..reminder_name)
    end
end

local function send_all_reminders(event_name) 
    for reminder_name, _ in pairs(mod.messages) do
        if using_debug_mode then mod:echo("Reminder name: "..reminder_name) end
        if settings_messages[reminder_name][event_name] then
            if using_debug_mode then mod:echo("Event enabled: "..event_name) end
            local amount_of_messages
            -- Time mod size is basically like getting random quote
	        --local time = Managers.time:time("gameplay") or Managers.time:time("main") or math.random(1, amount_of_messages)
            --mod:echo("Time: "..tostring(time))
            --local index_to_use = (time % amount_of_messages) + 1
            local index_to_use
            if using_debug_mode then mod:echo("Language: "..tostring(current_language)) end
            if use_notify then
                local temp_current_lang
                if mod.messages[reminder_name][current_language] then
                    temp_current_lang = current_language
                -- Fallback to English
                else
                    if using_debug_mode then mod:echo("Falling back to English") end
                    temp_current_lang = "en"
                end
                amount_of_messages = #(mod.messages[reminder_name][temp_current_lang])
                index_to_use = math.random(1, amount_of_messages)
                if using_debug_mode then mod:echo("Index: "..tostring(index_to_use)) end
                mod:notify(mod.messages[reminder_name][temp_current_lang][index_to_use])
            end

            if use_sound then
                
            end
        end
    end
end

-- #########################################
-- Hooks
-- #########################################
-- Game end
mod:hook_safe("CinematicSceneExtension", "setup_from_component", function(self)
    -- Intro is "intro_abc"
    -- Outro is "outro_win" or "outro_fail"
    --if string_match(self._cinematic_name, "outro_") then
    if self._cinematic_name == "outro_win" then
        if using_debug_mode then mod:echo("Mission success") end
        send_all_reminders("after_win")
    elseif self._cinematic_name == "outro_fail" then
        if using_debug_mode then mod:echo("Mission failed") end
        send_all_reminders("after_loss")
    end
end)

-- Enter load screen
mod:hook_safe(LoadingView, "init", function(func, self, settings, context)
    if using_debug_mode then mod:echo("Entering load screen") end
    send_all_reminders("on_load_screen")
end)

-- #########################################
-- Event Executions
-- #########################################
function mod.on_all_mods_loaded()
    mod:info("v" .. mod.version .. mod:localize("mod_version_logging_message"))
    refresh_settings_cache() 
end

function mod.on_setting_changed()
    refresh_settings_cache() 
    --if mod.using_debug_mode then mod:echo("Settings changed") end
end