local mod = get_mod("TextReplacementBase")
-- ###################################################################
-- DATA
-- ###################################################################
mod.version = "1.0.0"
mod:info("v" .. mod.version .. mod:localize("mod_version_logging_message"))

-- ################################
-- Local References for Performance
-- ################################
local managers = Managers
local string = string
--local string_find = string.find
local string_regex_sub = string.gsub

-- ###################################################################
-- MOD LOGIC
-- ###################################################################
-- ################################
-- Commands
-- ################################
mod:command("TextReplacement_DumpLocalization", mod:localize("command_dump_description"), function()
    mod:echo(mod:localize("command_dump_begin"))
    local dump_table = {}
    -- go into localization and find all strings
    -- or just do it iwth limn? idk
    mod:dump(dump_table, mod:localize("command_dump_message_in_log"), 3)
    mod:echo(mod:localize("command_dump_finish"))
end)

-- ################################
-- Execution
-- ################################
-- File containing all localization codes with "Interrogator Rannick" in the EN localization
--  technically i could make a loop to go over all the game quotes and return the ones that contain interrogator
--  but uhhhhhhhhh no >:3
--  this file was created by scraping the extracted game strings, and may need to be updated per update
--  since this is a shitpost, i'd rather have that than search EVERY game string on EVERY game startup
local localization_codes_to_replace = mod:io_dofile("TextReplacementBase/scripts/mods/TextReplacementBase/text_replacements")

for i = 1, #localization_codes_to_replace do
    for k = 1, #(localization_codes_to_replace[i].localization_codes_to_replace) do
        -- takes localization ID --> gets associated string with it
        local localization_code = localization_codes_to_replace[i].localization_codes_to_replace[k]
        local string_to_replace = managers.localization:_lookup(localization_code)
        if string_to_replace then
            -- modifies that localization code
            mod:add_global_localize_strings({
                [localization_code] = {
                    -- string.sub relies on index, so i use gsub
                    [localization_codes_to_replace[i].language_id] = string_regex_sub(string_to_replace, localization_codes_to_replace[i].search_text, localization_codes_to_replace[i].replacement_text),
                }
            })
        else
            mod:error(mod:localize("localize_error_no_string")..localization_code)
        end
    end
    
end
