local mod = get_mod("ReminderMessages")

--[[
This structure is so translators have less restrictions. Since not every phrase can be easily translated, each section does not require every single message to have an equivalent translation
]] 
mod.messages = {
	drink_water = {
		en = {
			"Drink water.",
			"Hydrate or die-drate.",
			"Reminder to drink your water!",
			"Stay hydrated <3",
			"Drink water, you beautiful dehydrated varlet <3",
			"Drink water; take care of yourself.",
			"Pre-servitors require regular fluid intake for improved longevity.",
			"DRINK DRINK DRINK",
		},
		--[[
		uwu = {
			"nya nya nya",
			"uuhhuu HUUUUUUU UUUUUUUUUUUUUUUUUUH",
		},
		]]
	},
	drink_martini = {
		en = {
			"martini time aiyiyiyi",
			"martini time (olive or lime)",
			"DRINK DRINK DRINK",
			"i NEED cocktail",
			"pour me a martini",
			"dry or dirty, fill my glass",
		},
	},
	heresy = {
		en = {
			"I reject the false promises of the carrion god. I shall reap a terrible bounty from the death that I sow in your name, Father Nurgle. Pestilence and death to the weakling Imperium of Man!",
			"Reject the lies of the False Emperor. Embrace your hunger, your lust, your desire. The universe is ours for the taking!",
			"Destroy, for the sake of Destruction! Kill, for the sake of Killing!", -- ? | Codex: Chaos Space Marines (4th Edition)
			"Death the False Emperor!", -- Sevatar, First Captain of the Night Lords | Codex: Chaos Space Marines (4th Edition)
			"The minds of gods are not for mortals to know or to judge. Accept that Tzeentch has a place for all of us in his grand scheme, and be happy in the part you have to play.", -- Magnus the Red | Codex: Chaos Space Marines (4th Edition)
			"In the embrace of the great Nurgle, I am no longer afraid, for with His pestilential favour I have become that which I once most feared: Death.", -- Kulvain Hestarius of the Death Guard | Codex: Chaos Space Marines (4th Edition)
			"The Imperium is a weak old man, ready and waiting to be broken apart.", -- Lufgt Huron, The Tyrant of Badab | Codex: Chaos Space Marines (6th Edition)
			"Cast down the idols! Destroy the temples! Slay the priests! Show these fools that they worship nothing more than a rotting corpse!", -- Dark Apostle Harzhan of the Word Bearers| Codex: Chaos Space Marines (4th Edition)
			"I shall reap a terrible bounty from the death that I sow in your name, Father Nurgle...", -- Typhus the Traveler, Herald of Nurgle | Codex: Chaos Space Marines (6th Edition)
			"There, feel the glory of necrosis, and rejoice! Nurgle loves you!", -- Ulkair, Great Unclean One | Warhammer 40,000: Dawn of War II - Retribution
			"Sickness, disease, plague and pox, suffering and the slow, living rot. Such wondrous gifts does Nurgle seek to bestow upon the unworthy human cattle of the Imperium. We are merely the vectors by which his virulent beneficence may be spread to the undeserving masses.", -- Urgloth Rotheart, Plague Champion of the Death Guard | Dark Imperium, Death Guard booklet
			"Let no good deed go unpunished. Let no evil deed go unrewarded.", -- Codex: Chaos Space Marines (4th Edition)
		},
	},
}

-- Easter Egg
-- Adding JAV titles
--	it says "boobies" if you type it into a calculator
--  it only checks on startup so eat shit
if mod:get("im_feeling_lucky") == 5318008 then
	if mod:get("enable_debug_mode") then
		mod:echo("goon sesh enabled")
	end
	-- there's that one 4chan post that goes "I torrented hudnres of jav titles last year and for some fucking bizarre reason our isp sent my parents a warning email listing them all mom printed it off and now whenever i disagree with her about something she'll get the list and start reading off titles and dad laughs at me"
	mod.messages["jav"] = {
		en = {
			"[MIDA-574] \"This is really the last time... okay? Please!\" Me, whose legs tremble and convulse in orgasm while commuting after my boyfriend decides on morning sex. I'm troubled because since we started living together, he rips my pantyhose every morning before I go to work. Mio Ishikawa",
			"[DASS-787] My sister, carelessly showing off her black pantyhose. I couldn't resist kneading her huge ass and ended up creampieing her. Mary Tachibana",
			"[SONE-201] My Sister is a Young Hot Mom Breastfeeding at Our Parents' Home - The #1 Ranked, Sweeping Popularity Doujin! The Industry's Top-Rated Voluptuous-Bodied Popular Actress! The First Live-Action Collaboration! Koyoi Konan",
			"[START-257] After a drinking party with a colleague I dislike, we had a one-night stand on impulse. His cock fit my deepest parts so perfectly that I experienced the most intense orgasms of my life... Even though I don't like him at all, I couldn't stop asking for more sex. Komina Yotsuha",
			"[IPX-726] The Perfect Pussy That Makes You Instantly Hard, Supreme Fellatio That Drives You Wild. Kana Momonogi",
			"[MIKR-051] \"Is She Actually Coming On to Me?\" During My Brother's 3-Day Absence, I Succumbed to the Temptation of My Carefree Sister-in-Law's See-Through Panties and Plump Butt. We Had an Affair at Home with Non-Stop Creampies.",
			"[JUR-615] While my wife was pregnant and I was even forbidden from masturbating, I ended up having creampie sex multiple times with my stepmother Tina who came to Tokyo... Tina Nanami",
			"[JUL-268] The Summer I Was the Only Single Man – Creampie Sex Soaked in Sweat with My Two Sisters-in-Law During a Home Visit",
			"[MIDV-946] Sunday Morning, Mio Is So Cute After Waking Up That I Just Have to Pound Her Again and Again—One, Two, Three Times with My Rock-Hard Morning Wood, and the Excitement Never Fades, So We Keep Fucking Until Dusk—Just One Day of Nonstop Sex. Ishikawa Mio",
			"[JUR-205] Invited by a Mom Friend to a Dating App, We Sweetly Tame Our 'Favorite Younger Guy' Together. Meguri Otsuki Hibiki",
			"[IPX-484] I Was Totally Hooked by My Girlfriend's Little Sister's Cheat-Level Gorgeous Legs and Panty-Flash Seduction - Karen Kaede",
			"[MIKR-089] \"Using Feet Isn't Cheating, Right... Master?\" The Pervy Maid Who Whispers from Behind, Teases Your Nipples, and Uses Her Beautiful Legs to Give a Teasing Handjob - Mori Hinako",
			"[MIDV-296] My Girlfriend’s Braless Older Sister Seduced Me Into a Sex-Crazed Monster! Even After We Used Up a Whole Box of Condoms, We Kept Fucking Nonstop - Ibuki Aoi",
			"[MIDV-315] My sister-in-law, stuck in a rut with her husband—my older brother—, becomes my convenient human onahole. Sexually frustrated and begging for my cock, her lewd body with stiff nipples climaxes again and again from repeated creampies! Nozomi Ishihara",
			"[START-562] \"If You Get Hard for Anyone Else, I Won't Forgive You!\" We Finally Got Together... But Now She Wants Reverse Celibacy Cohabitation!? Diary of Extreme Dick Watching Between a Possessive GF and a Premature BF Mana Sakura",
			"[MIDV-402] Chemsex Female Teacher NTR - My Beloved New Teacher Reina Is Fucked Into Orgasmic Madness and Corrupted by a Sleazy Big-Dicked PE Teacher, Giving Me a Despair Boner - Reina Miyashita",
			"[START-40]4 My Busty Neighbor's Tight Dress Shattered My Reason, Making Me Abandon My Waiting Wife for Three Days and Nights of Sweaty Sex with Her - Satsuki-Nao",
			"[SONE-639] My senile father-in-law is full of sexual desire. He pretends to mistake me for my mother and shows off his magnificent, huge cock to me... Kaede Fua",
			"[MIDA-154] I called a delivery health service and reunited with the class Madonna. To reclaim my youth, I chose the all-uniform options: sailor suit / school swimsuit / bloomers / nude ribbon. With relentless revenge-of-youth pistoning, I creampied her in an adult transaction! Arina Shin",
			"[GVG-707] A Mother And Daughter Who Got Hot And Horny For A Black Boy. Haru Sakura, Yuka Honjo",
			"[WANZ-321] Rich father and female teacher Jin Yuki",
			"[JUX-384] My Stepmom Sho Nishino",
			"[SDDE-393] Hospitality in Her Uniform, Underwear, and Fully Nude: Straddling Pussy Airplane",
			"[NHDTB-104] The Married Woman Next Door Came Over To Apologize For All The Noise She Was",
			"[JLZ-060] Mature Lesbian Miniskirt Pink Police Corps. Rin Amamiya, Yui Nominami",
			"[SGV-015] SEX OF THE DEAD Big Tits Zombie Girl",
			"[AILB-002] A college influencer who lives a perfect life appears in an AV with her beautiful older sister!!",
		},
	}
end