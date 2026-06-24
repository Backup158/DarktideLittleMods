a few little darktide mods i'm too lazy to manage separate repositories for
# DiscardEmperorsGift
Defunct. Doesn't even work, and [Gift Shredder](https://www.nexusmods.com/warhammer40kdarktide/mods/858) exists now. I left this [for so long lol](https://github.com/Backup158/DarktideDiscardEmperorsGift).

# ReminderMessages
Displays reminder messages in chat for certain real life activities, based on events happening in-game.

# TextReplacementBase
Framework (not really but I'm too lazy to find a different word) for replacing text. Give it a list of codes with a replacement rule, and it'll take care of it.

Finding the localization IDs is the hard part. Perhaps you can strings with [limn](https://github.com/manshanko/limn). I don't know if that would include the keys. For simple things, I used [WhatTheLocalization](https://www.nexusmods.com/warhammer40kdarktide/mods/163)'s debug mode to check manually. You could also use my [scuffed string search](https://github.com/Backup158/DarktideTransvestigatorRannick/tree/main/scuffed_string_search) method but I was too lazy.

# SimpleAudioTacticalSounds
Plays tactical foley audio through keybinds.

Use this with [SimpleAudio](https://www.nexusmods.com/warhammer40kdarktide/mods/929) or the [Audio Plugin](https://www.nexusmods.com/warhammer40kdarktide/mods/196).

> [!NOTE]
> This mod ONLY plays the audio. It doesn't add any tactical features. The point is to use this with other mods, to give them a more tactical feel for all your cag erp needs.

## Sounds
All sounds are in the `audio` folder, found immediately upon opening the mod folder (so next to the `.mod` file and `scripts` folder). Within this `audio` folder, the sub-folders hold the sounds for each event. When triggering the event, a random sound from the appropriate will be played. E.g. If the `night_vision` folder has `nvg_0.mp3` and `nvg_1.mp3`, whenever you press the keybind for Night Vision Goggles, it will choose a random one of those sounds to be played.

To disable a specific sound, move the sound OUT of the sub-folder. Any sounds in the `audio` folder that are NOT in one of the sub-folders will NOT be played.

- Night Vision
    - Folder name: `night_vision`
    - Sound of night vision goggles turning on. I recommend pairing this with a ReShade (shameless [self plug](https://github.com/Backup158/Darktide-Mod-Edits/blob/main/ReShade/owo_DarkTideTical.ini)) and setting the keybind here to same button used to toggle the night vision ReShade effects.
    - There is a sub-option to only play this sound every other time, to mimic turning them on with sound while turning off without sound. It goes like: play sound --> silent --> play sound --> silent, and so on.
- Fire Selection Switch
    - Folder name: `fire_select`
    - A short *click* of a fire select switch being flipped. I use this for my [Skitarius](https://www.nexusmods.com/warhammer40kdarktide/mods/510) mod toggle button, which I use to switch between full auto and single fire. Naturally, the same thought process would work with [FullAuto](https://www.nexusmods.com/warhammer40kdarktide/mods/87)
- Walkie-Talkie Chirp
    - Folder name: `radio_chirp`
    - The *krrrch* of a walkie-talkie turning on and off. It plays twice when you hold a button; first upon pressing it, and second when letting go of it. You could use this for your Push to Talk hotkey.
