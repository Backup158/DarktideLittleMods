
return {
    -- Each replacement will take this form
    --  language_id [string]: The two letter language code for the target language. This shows some possibilities: https://github.com/Aussiemon/Darktide-Source-Code/blob/284137d004a377023e8e78bdc56aa71a51e1fb42/scripts/managers/localization/localization_manager.lua
    --  search_text [string]: Whatever text you are trying to replace. This supports regex expressions
    --  replacement_text [string/function/table]: What you replace that found text with. Just giving it text is simplist; it replaces the found text with this given text. If you want to get more complex, you can have more complicated logic (which I don't feel like explaining. https://www.luadocs.com/docs/functions/string/gsub)
    --  localization_codes_to_replace [table of strings]: List of all the localization ids to run the replacer on. Filling this out is the hard part.
	{
        language_id = "en",
        search_text = "Beast of Nurgle",
        replacement_text = "Grandpappy Nurgle's Big Puppy :3",
        localization_codes_to_replace = {
            "loc_breed_display_name_chaos_beast_of_nurgle",
        },
    },
    -- ================
    -- Insert new replacements here
    -- ================


    -- ================
    -- End of New Replacements
    -- Do NOT remove the final } below
    -- ================
}