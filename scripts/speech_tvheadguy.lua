
-----------------------------------
-- This file is the template for other speech files. Once a new string is added here, simply run PropagateSpeech.bat
-- If you are adding strings that are character specific, or not required by all characters, you will still need to add the strings to speech_wilson.lua,
-- and then add the context string to speech_from_generic.lua. Once you run the PropagateSpeech.bat, you can go into your character's speech file and simply uncomment the new lines.
--
-- There are some caveats about maintaining sane formatting in this file.
--      -No single line lua tables
--      -Opening and closing brackets should be on their own line
--      -If wilson's speech has X unnamed strings in a table, then all other speech files must have at least X unnamed strings in that context too (example, CHESSPIECE_MOOSEGOOSE has 1 string in wilson, but 2 in wortox), this requirement could be relaxed if required by motifying po_vault.lua)

return {
	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "Gah! I've been tricked!",
        },

        ACTIVATE =
		{
			LOCKED_GATE = "S'locked.",
            HOSTBUSY = "Guess I should let this yobbo finish.",
            CARNIVAL_HOST_HERE = "Where are you, you avian twerp?",
            NOCARNIVAL = "I've been spared from that parade of nonsense.",
			EMPTY_CATCOONDEN = "Empty of all the good stuff.",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "Need more of those little things.",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "I think I need more spots?... this is doing my head in.",
			KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "Nah, I need a brain break.",
            MANNEQUIN_EQUIPSWAPFAILED = "Little bobblehead can't wear that.",
            PILLOWFIGHT_NO_HANDPILLOW = "Need a pillow. Wouldn't wanna maim someone.",
            NOTMYBERNIE = "Creepy dolls aren't really my thing.",
            NOTMERM = "I'm not fishy, scaly, or smelly enough for that.",
            NOKELP = "only_used_by_wurt",
            HASMERMLEADER = "only_used_by_wurt",
            },
        APPLYELIXIR =
        {
            TOO_SUPER = "That's strong stuff.",
            NO_ELIXIRABLE = "only_used_by_wendy",
		},
        APPLYMODULE =
        {
            COOLDOWN = "only_used_by_wx78",
            NOTENOUGHSLOTS = "only_used_by_wx78",
        },
        APPRAISE =
        {
            NOTNOW = "Nah, can't do that right now.",
        },
        ATTUNE =
        {
            NOHEALTH = "Aahhh... I don't think my chassis could really take that.",
        },
        BATHBOMB =
        {
            GLASSED = "No reason to glass what's already glassed.",
            ALREADY_BOMBED = "No reason to bomb what's already bombed.",
        },
        BEDAZZLE =
        {
            BURNING = "only_used_by_webber",
            BURNT = "only_used_by_webber",
            FROZEN = "only_used_by_webber",
            ALREADY_BEDAZZLED = "only_used_by_webber",
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",
        },
        BUILD =
        {
            MOUNTED = "They never gave me extendo-arms.",
            HASPET = "Already got an annoying creature of my own.",
			TICOON = "Already got a chubby wanderer.",
            BUSY_STATION = "Come on, mate. Time's ticking.",
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "Gotta hurry myself up.",
        },
        CAST_POCKETWATCH =
		{
			GENERIC = "only_used_by_wanda",
			REVIVE_FAILED = "only_used_by_wanda",
			WARP_NO_POINTS_LEFT = "only_used_by_wanda",
			SHARD_UNAVAILABLE = "only_used_by_wanda",
		},
        CAST_SPELLBOOK =
		{
			NO_TOPHAT = "only_used_by_waxwell",
		},
        CASTAOE =
		{
			NO_MAX_SANITY = "only_used_by_waxwell",
            NOT_ENOUGH_EMBERS = "only_used_by_willow",
            NO_TARGETS = "only_used_by_willow",
            CANT_SPELL_MOUNTED = "only_used_by_willow",
            SPELL_ON_COOLDOWN = "only_used_by_willow",
            NO_BATTERY = "only_used_by_winona",
			NO_CATAPULTS = "only_used_by_winona",
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "only_used_by_wurt",
        },
        CHANGEIN =
        {
            GENERIC = "Nah, my jacket is too comfy.",
            BURNING = "I'd like to retain my flammables, thanks.",
            INUSE = "Guess I should let this yobbo finish.",
            NOTENOUGHHAIR = "You need to work on that hair, mate.",
            NOOCCUPANT = "Yeah, I don't think those would look very good on me.",
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "only_used_by_wx78",
            CHARGE_FULL = "only_used_by_wx78",
        },
        COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "This one lost the measuring contest.",
            OVERSIZEDVEGGIES_TOO_SMALL = "Looks like this'un didn't weigh up.",
		},
        CONSTRUCT =
        {
            INUSE = "Someone else got to it first.",
            NOTALLOWED = "Nah, I don't think that goes in there.",
            EMPTY = "I don't have the right stuff.",
            MISMATCH = "... That wasn't right.",
            NOTREADY = "Gotta wait for things to calm down, I reckon.",
        },
        COOK =
        {
            GENERIC = "I'm definitely not a cooking drone.",
            INUSE = "Guess I should let this yobbo finish.",
            TOOFAR = "They never gave me extendo-arms.",
        },
        DIRECTCOURIER_MAP =
        {
            NOTARGET = "only_used_by_walter",
        },
        DISMANTLE =
		{
			COOKING = "Hurry up, mate.",
			INUSE = "Guess I should let this yobbo finish.",
			NOTEMPTY = "It's full of rubbish, gotta get that out first.",
        },
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "only_used_by_wanda",
        },
        DRAW =
        {
            NOIMAGE = "Gotta get a reference for this.",
        },
        ENTER_GYM =
        {
            NOWEIGHT = "only_used_by_wolfang",
            UNBALANCED = "only_used_by_wolfang",
            ONFIRE = "only_used_by_wolfang",
            SMOULDER = "only_used_by_wolfang",
            HUNGRY = "only_used_by_wolfang",
            FULL = "only_used_by_wolfang",
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "I wouldn't want salt water messing me up either.",
        },
        FISH_OCEAN =
		{
			TOODEEP = "It's clearly the wrong type of stick with string attached to it.",
		},
        GIVE =
        {
            GENERIC = "Nah, definitely can't put that there.",
            DEAD = "... I was a bit late there, I'm afraid.",
            SLEEPING = "Angels never sleep. Guess you're not one of them.",
            BUSY = "Guess I should let this yobbo finish.",
            ABIGAILHEART = "Ah, that makes me feel like rubbish.",
            GHOSTHEART = "I dunno about that one.",
            NOTGEM = "It's not shiny or tumbled enough.",
            WRONGGEM = "Wrong thingo.",
            NOGENERATORSKILL = "Wouldn't wanna shock myself!",
            NOTSTAFF = "It needs the right shape, or something.",
            MUSHROOMFARM_NEEDSSHROOM = "Need to chuck a mushy in there instead.",
            MUSHROOMFARM_NEEDSLOG = "Need to chuck a living log in there instead.",
            MUSHROOMFARM_NOMOONALLOWED = "Stupid things seem to jump straight back out.",
            SLOTFULL = "Nah, I don't think I can do that.",
            FOODFULL = "Deeefinitely already something in there.",
            NOTDISH = "That's not food. Not that I'd know.",
            DUPLICATE = "Don't need to double up.",
            NOTSCULPTABLE = "That wouldn't be artistismally pleasing.",
            NOTATRIUMKEY = "It needs the right shape, or something.",
            CANTSHADOWREVIVE = "Something's definitely off here.",
            WRONGSHADOWFORM = "Something's definitely off here.",
            NOMOON = "It needs some of that good moon juice.",
			PIGKINGGAME_MESSY = "Too much junk lyin' around. Yeah yeah, I know.",
			PIGKINGGAME_DANGER = "I got more important stuff to do. Like not die.",
			PIGKINGGAME_TOOLATE = "Looks like I missed my chance.",
			CARNIVALGAME_INVALID_ITEM = "I'm out of stupid bird currency.",
			CARNIVALGAME_ALREADY_PLAYING = "Someone is already having the time of their life.",
            SPIDERNOHAT = "Yeah, I dunno about that one.",
            TERRARIUM_REFUSE = "It needs sumthin a bit more dark and nightmarish.",
            TERRARIUM_COOLDOWN = "More waiting. Hooray.",
            NOTAMONKEY = "'Ungle bungle!' Hur hur hur, just kidding.",
            QUEENBUSY = "She's too busy monkeying around. As in, doing nothing.",
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "Already got that one stored away in this rotating fish-case.",
		},
        GIVETOPLAYER =
        {
            FULL = "You've gotta sort out your stuff, mate.",
            DEAD = "Well, wasn't that well timed.",
            SLEEPING = "Oi, wake up, you yobbo!",
            BUSY = "Hurry up, I got other stuff to do!",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "You've gotta sort out your stuff, mate.",
            DEAD = "Well, wasn't that well timed.",
            SLEEPING = "Oi, wake up, you yobbo!",
            BUSY = "Hurry up, I got other stuff to do!",
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "Nah, don't think that's a go.",
        },
        HEAL =
        {
            NOT_MERM = "I'm not scaly and smelly enough, I guess.",
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "That weird spider kid would have a better time with this.",
        },
        HITCHUP =
        {
            NEEDBEEF = "Need a ringer for a beefy friend.",
            NEEDBEEF_CLOSER = "Get over here, you lazy rag.",
            BEEF_HITCHED = "Already tied up.",
            INMOOD = "It's too 'excited' for that.",
        },
        LOOKAT = --fail strings for close inspection
		{
			-- Winona specific
			ROSEGLASSES_INVALID = "only_used_by_winona",
			ROSEGLASSES_COOLDOWN = "only_used_by_winona",
            ROSEGLASSES_DISMISS = "only_used_by_winona",
            ROSEGLASSES_STUMPED = "only_used_by_winona",
			--
		},
        LOWER_SAIL_FAIL =
        {
            "Gah, crap.",
            "Missed the shot on that one.",
            "This is not my thing.",
        },
        MARK =
        {
            ALREADY_MARKED = "Already cast my vote.",
            NOT_PARTICIPANT = "This one doesn't involve me.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "Yeah, I'd like to keep my head in it's socket, thanks.",
            INUSE = "Guess I should let this yobbo finish.",
			SLEEPING = "Get up, you lazy knob!",
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "It's clearly the wrong type of stick with string attached to it.",
		},
        OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "I'm definitely not a cooking drone.",
			SHADOWMAGIC = "If only there was a tape to teach me magic tricks.",
		},
        PICK =
        {
            NOTHING_INSIDE = "S' totally empty.",
        },
        PICKUP =
        {
			RESTRICTION = "I'm not the right type of drone for that.",
			INUSE = "Guess I should let this yobbo finish.",
            NOTMINE_SPIDER = "only_used_by_webber",
            NOTMINE_YOTC =
            {
                "You do not belong to me.",
                "Not my animated vegetable.",
            },
			NO_HEAVY_LIFTING = "only_used_by_wanda",
            FULL_OF_CURSES = "Great, I can touch that and somehow be in an even worse situation.",
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "I know all there is to know about useless plants!",
            FERTILIZER = "I know all there is to know about useless crap!",
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "It's empty.",
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "It's empty.",
        },
        --wickerbottom specific action
        READ =
        {
            GENERIC = "only_used_by_waxwell_and_wicker",
            NOBIRDS = "only_used_by_waxwell_and_wicker",
            NOWATERNEARBY = "only_used_by_waxwell_and_wicker",
            TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
            WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
            BIRDSBLOCKED = "only_used_by_waxwell_and_wicker",
            NOFIRES =       "only_used_by_waxwell_and_wicker",
            NOSILVICULTURE = "only_used_by_waxwell_and_wicker",
            NOHORTICULTURE = "only_used_by_waxwell_and_wicker",
            NOTENTACLEGROUND = "only_used_by_waxwell_and_wicker",
            NOSLEEPTARGETS = "only_used_by_waxwell_and_wicker",
            TOOMANYBEES = "only_used_by_waxwell_and_wicker",
            NOMOONINCAVES = "only_used_by_waxwell_and_wicker",
            ALREADYFULLMOON = "only_used_by_waxwell_and_wicker",
        },
        REMOTE_TELEPORT =
		{
			NOSKILL = "only_used_by_winona",
			NODEST = "only_used_by_winona",
		},
        REMOVEMODULES =
        {
            NO_MODULES = "only_used_by_wx78",
        },
        REPAIR =
        {
            WRONGPIECE = "Seems a bit off to me.",
        },
        REPLATE =
        {
            MISMATCH = "Wrong type'a dish... Why is this important?",
            SAMEDISH = "No reason to double up.",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "Gotta time it better. 1, 2, 3, 4...",
            BAD_TIMING1 = "Nope, nope, nope, get that nasty stuff off me!",
            BAD_TIMING2 = "Gah, crud it!",
        },
        RUMMAGE =
		{
			GENERIC = "I dunno if I can really do that.",
			INUSE = "Hurry up, I got stuff to go do...",
            NOTMASTERCHEF = "I'm definitely not a cooking drone.",
            NOTAMERM = "Maybe if I smelt a bit more like fish.",
            NOTSOULJARHANDLER = "Not my place to go rummaging around.",
            RESTRICTED = "Surprisingly thief-proof.",
		},
        SADDLE =
        {
            TARGETINCOMBAT = "It needs to take a breather. Slow breaths and all that.",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "Should probably let that thing sleep before I get my head pulled from its socket.",
			GENERIC = "That is not a shaveable thing.",
			NOBITS = "Can't really shave if there's nothing there.",
            REFUSE = "only_used_by_woodie",
            SOMEONEELSESBEEFALO = "As funny as it would be to shave someone else's pet...",
		},
        SING_FAIL =
        {
            SAMESONG = "only_used_by_wathgrithr",
        },
        SLAUGHTER =
        {
            TOOFAR = "You got away this time...",
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "Ugh, I think I forgot something.",
        },
		STORE =
		{
			GENERIC = "Chock-a-block.",
			NOTALLOWED = "Naww, that's not made for that.",
			INUSE = "Guess I should let this yobbo finish.",
            NOTMASTERCHEF = "I'm definitely not a cooking drone.",
            NOTSOULJARHANDLER = "None of my business, this is.",
            RESTRICTED = "Surprisingly thief-proof.",
		},
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "Already got that one stored away in my braincase.",
            CANTLEARN = "Incomprehensible.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "That's not... gah, why am I even bothering with these shoddy paper maps?",

			--MapSpotRevealer/messagebottle
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "If you think about it, everything down here is already buried.",--Likely trying to read messagebottle treasure map in caves

            STASH_MAP_NOT_FOUND = "There's no X. Whoever wrote this was some joke of a pirate.",-- Likely trying to read stash map  in world without stash
        },
        TELLSTORY =
		{
			GENERIC = "only_used_by_walter",
			NOT_NIGHT = "only_used_by_walter",
			NO_FIRE = "only_used_by_walter",
		},
        UNLOCK =
        {
        	WRONGKEY = "I dunno if I can really do that.",
        },
        UPGRADE =
        {
            BEDAZZLED = "only_used_by_webber",
        },
        USEITEMON =
        {
            --GENERIC = "I can't use this on that!",

            --construction is PREFABNAME_REASON
            BEEF_BELL_INVALID_TARGET = "Nah, can't exactly do that.",
            BEEF_BELL_ALREADY_USED = "Someone already snagged that one.",
            BEEF_BELL_HAS_BEEF_ALREADY = "Already keyed and paired.",
            
			NOT_MINE = "This beefalo isn't mine.",
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "That wasn't the right one. Uhh... I'm all out.",
        	KLAUS = "Ah, you ... !",
			QUAGMIRE_WRONGKEY = "Guess I'd better scrounge up the right one.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "Keeping air for later isn't really a priority of mine.",
        },
        WRITE =
        {
            GENERIC = "Eh, I don't really see the need for that.",
            INUSE = "Guess I should let this yobbo finish.",
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "That's not gonna happen.",
            ALREADYACTIVE = "It's already busy, I reckon.",
            NORESPONSE = "S' toddled off somewhere.",
            RIGHTTHERE = "Gonna have to wait.",
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "Already stored that one away inside my braincase.",
        },
        CARVEPUMPKIN =
		{
			INUSE = "That's too bad, I was gonna carve a-",
			BURNING = "Not my brightest moment.",
		},
		DECORATESNOWMAN =
		{
			INUSE = "Someone else is already making an eldritch abomination.",
			HASHAT = "Already dapper as ever.",
			STACKEDTOOHIGH = "I can't reach up past my head!",
			MELTING = "Old mate's about to become a puddle.",
		},
        MUTATE =
        {
            NOGHOST = "only_used_by_wendy",
            NONEWMOON = "only_used_by_wendy",
            NOFULLMOON = "only_used_by_wendy",
            NOTNIGHT = "only_used_by_wendy",
            CAVE = "only_used_by_wendy",
        },
		MODSLINGSHOT =
		{
			NOSLINGSHOT = "only_used_by_walter",
		},
		POUNCECAPTURE =
		{
			MISSED = "Too physical for me. Gah!",
        },
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "I need to scrounge up the right stuff.",
		NO_TECH = "I dunno how to make that. But if I can get a connection...",
		NO_STATION = "I'm no construction drone, that's for sure.",
	},

	ACTIONFAIL_GENERIC = "Nah, don't think I can do that.",
	ANNOUNCE_BOAT_LEAK = "I doubt this'll be good for my servos.",
	ANNOUNCE_BOAT_SINK = "Damn it, and I hadn't even...",
    ANNOUNCE_PREFALLINVOID = "I feel like I'm about to be the butt of a joke...",
	ANNOUNCE_DIG_DISEASE_WARNING = "That might've helped. I think.", --removed
	ANNOUNCE_PICK_DISEASE_WARNING = "Stinks something awful.", --removed
	ANNOUNCE_ADVENTUREFAIL = "...How did I get here?",
    ANNOUNCE_MOUNT_LOWHEALTH = "Ah, poor thing needs a patch up.",

    --waxwell and wickerbottom specific strings
    ANNOUNCE_TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
    ANNOUNCE_WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
    ANNOUNCE_NOWATERNEARBY = "only_used_by_waxwell_and_wicker",

    	--waxwell specific
	ANNOUNCE_SHADOWLEVEL_ITEM = "only_used_by_waxwell",
	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "only_used_by_waxwell",
	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "only_used_by_waxwell",
	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "only_used_by_waxwell",
	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "only_used_by_waxwell",

    --wolfgang specific
    ANNOUNCE_NORMALTOMIGHTY = "only_used_by_wolfang",
    ANNOUNCE_NORMALTOWIMPY = "only_used_by_wolfang",
    ANNOUNCE_WIMPYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_MIGHTYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_EXITGYM = {
        MIGHTY = "only_used_by_wolfang",
        NORMAL = "only_used_by_wolfang",
        WIMPY = "only_used_by_wolfang",
    },

	ANNOUNCE_BEES = "Gah, little flying pests!",
	ANNOUNCE_BOOMERANG = "Ouch! I feel like a disgrace.",
	ANNOUNCE_CHARLIE = "I can hear you, creeping around in the dark!",
	ANNOUNCE_CHARLIE_ATTACK = "Gah! I think I've been found out!",
	ANNOUNCE_CHARLIE_MISSED = "only_used_by_winona", --winona specific
	ANNOUNCE_COLD = "SSServos are acccting uppp...",
	ANNOUNCE_HOT = "Ohhhh... should have installed water cooling...",
	ANNOUNCE_CRAFTING_FAIL = "I need to scrounge up the right stuff.",
	ANNOUNCE_DEERCLOPS = "Sounds like I should get ready to book it.",
	ANNOUNCE_CAVEIN = "Falling stuff on the way! Don't feeling like getting any dents.",
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"Sounds like I should run as fast as my little legs can go.",
		"I've got places to be, and they're not here!",
		"Wouldn't wanna lose my balance.",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "Here ya go, you great ugly thing.",
        "Yeah yeah, it's all yours.",
        "Take this, and leave me alone.",
	},
	ANNOUNCE_SACREDCHEST_YES = "I seem to have met the criteria.",
	ANNOUNCE_SACREDCHEST_NO = "I seem to have failed the criteria.",
    ANNOUNCE_DUSK = "It's getting dark. That's not going to help with the collection process.",

    --wx-78 specific
    ANNOUNCE_CHARGE = "only_used_by_wx78",
	ANNOUNCE_DISCHARGE = "only_used_by_wx78",

    -- Winona specific
    ANNOUNCE_ROSEGLASSES =
    {
        "only_used_by_winona",
        "only_used_by_winona",
        "only_used_by_winona",
    },
    ANNOUNCE_CHARLIESAVE =
    {
        "only_used_by_winona",
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "only_used_by_winona",

	ANNOUNCE_EAT =
	{
		GENERIC = "Great, what a good use of my time.",
		PAINFUL = "Blurgh. Why am I doing this to myself...",
		SPOILED = "Ughhhh... I really shouldn'ta done that...",
		STALE = "Guhh, normal food is awful enough, let alone this.",
		INVALID = "My poor servos.",
        YUCKY = "I'm not designed to process that.",

        --Warly specific ANNOUNCE_EAT strings
		COOKED = "only_used_by_warly",
		DRIED = "only_used_by_warly",
        PREPARED = "only_used_by_warly",
        RAW = "only_used_by_warly",
		SAME_OLD_1 = "only_used_by_warly",
		SAME_OLD_2 = "only_used_by_warly",
		SAME_OLD_3 = "only_used_by_warly",
		SAME_OLD_4 = "only_used_by_warly",
        SAME_OLD_5 = "only_used_by_warly",
		TASTY = "only_used_by_warly",
    },

    ANNOUNCE_FOODMEMORY = "only_used_by_warly",

    ANNOUNCE_ENCUMBERED =
    {
        "Not... built for... hauling...",
        "Why can't I be in my... entertainment field... for this...",
        "*creak*... *crack*...",
        "...if only someone else could... do it for me...",
        "Gah!...",
        "I wish I had a tape... to help with this...",
        "Is this stupid thing... really worth doing my back in for?",
        "Hrrrng... gah...",
        "I was never... never meant for this kind of thing...",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"I feel like something awful is about to happen.",
		"Huh? Who was that?",
		"I feel like I should start doing what I do best.",
	},
    ANNOUNCE_RUINS_RESET = "Seems like the cycle has gone around once again.",
    ANNOUNCE_SNARED = "Help! I'm stuck!",
    ANNOUNCE_SNARED_IVY = "I knew I shouldn't waste my time with plants!",
    ANNOUNCE_REPELLED = "My arms aren't strong enough to get past that.",
	ANNOUNCE_ENTER_DARK = "Uhh, visual input is down?...",
	ANNOUNCE_ENTER_LIGHT = "Whew, that was a close one.",
	ANNOUNCE_FREEDOM = "Ha! I'm out of here.",
	ANNOUNCE_HIGHRESEARCH = "How informative.",
	ANNOUNCE_HOUNDS = "Oh, no no no... I've got stuff to go dig up!",
	ANNOUNCE_WORMS = "Just a few more minutes... please!",
    ANNOUNCE_WORMS_BOSS = "Don't let this be the end...",
    ANNOUNCE_ACIDBATS = "Jeez. That's the sound of terror, if ever I've heard it.",
	ANNOUNCE_HUNGRY = "If you see this quote, please message me on discord at NeddoFreddo. You've found a bug!\n(Yes, this is serious.)",
	ANNOUNCE_HUNT_BEAST_NEARBY = "That particular lump of sod looked newer than the rest.",
	ANNOUNCE_HUNT_LOST_TRAIL = "Ahhh... I think I've lost it.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "Lost it, and I don't think it was my eyesight that time.",
    ANNOUNCE_HUNT_START_FORK = "I might be in for some risky business.",
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "Whew. I think I did it.",
    ANNOUNCE_HUNT_WRONG_FORK = "Geez. This doesn't feel safe.",
    ANNOUNCE_HUNT_AVOID_FORK = "Yeah... this seems better.",
	ANNOUNCE_INV_FULL = "I'm carrying around too much of this junk!",
	ANNOUNCE_KNOCKEDOUT = "Ugh... I feel awful.",
	ANNOUNCE_LOWRESEARCH = "That was not very informative.",
	ANNOUNCE_MOSQUITOS = "Insectoids approaching!",
    ANNOUNCE_NOWARDROBEONFIRE = "I'd like to retain my flammables, thanks.",
    ANNOUNCE_NODANGERGIFT = "I'd like to retain my life, thanks.",
    ANNOUNCE_NOMOUNTEDGIFT = "Looks like I need to get off this mound of meat.",
	ANNOUNCE_NODANGERSLEEP = "Should probly not die before I die temporarily.",
	ANNOUNCE_NODAYSLEEP = "Nah. Don't usually feel the urge to sleep during the day.",
	ANNOUNCE_NODAYSLEEP_CAVE = "Naww. Not really feeling it.",
	ANNOUNCE_NOHUNGERSLEEP = "I should tend to my itch before I get removed in my sleep.",
	ANNOUNCE_NOSLEEPONFIRE = "Yeah, nah.",
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "only_used_by_wx78",
	ANNOUNCE_NODANGERSIESTA = "I'd like to retain my life, thanks.",
	ANNOUNCE_NONIGHTSIESTA = "Nah. Isn't the time for a kip yet.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "I need a proper sleep right now, not a siesta.",
	ANNOUNCE_NOHUNGERSIESTA = "I should tend to my itch before I snooze.",
	ANNOUNCE_NO_TRAP = "That felt... anticlimactic?",
	ANNOUNCE_PECKED = "My hull is not resistant to peck marks!",
	ANNOUNCE_QUAKE = "Sounds like a bad time on the way.",
	ANNOUNCE_RESEARCH = "Learning stuff is fun, not going to lie.",
	ANNOUNCE_SHELTER = "It's nice and sheltered under here.",
	ANNOUNCE_THORNS = "Gah!",
	ANNOUNCE_BURNT = "Ow. I'm not really one to handle hot stuff.",
	ANNOUNCE_TORCH_OUT = "See ya, torch.",
	ANNOUNCE_THURIBLE_OUT = "It's empty.",
	ANNOUNCE_FAN_OUT = "I'm not a fan of what just happened, hur hur hur.",
    ANNOUNCE_COMPASS_OUT = "I feel you, mate, magnetic fields suck.",
	ANNOUNCE_TRAP_WENT_OFF = "Ah! Clumsy!",
	ANNOUNCE_UNIMPLEMENTED = "Gah! That gives me the most awful feeling.",
	ANNOUNCE_WORMHOLE = "Ugh, that'll take forever to clean outta my joints...",
    ANNOUNCE_WORMHOLE_SAMESPOT = "only_used_by_winona",
	ANNOUNCE_TOWNPORTALTELEPORT = "Woah, I was there, now I'm here!",
	ANNOUNCE_CANFIX = "\nLooks fixer-upper-able.",
	ANNOUNCE_ACCOMPLISHMENT = "I've got the biggest brain of all!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "Mmm, brain so big...",
	ANNOUNCE_INSUFFICIENTFERTILIZER = "Who taught you to be greedy like that?",
	ANNOUNCE_TOOL_SLIP = "Whoops! Starting to wish I installed pincers instead...",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Whew. That could have caused some shorting.",
	ANNOUNCE_TOADESCAPING = "I'd get bored if a bunch of mosquitoes tried to take me down.",
	ANNOUNCE_TOADESCAPED = "See ya, slimy toad cake.",


	ANNOUNCE_DAMP = "Not this stuff again...",
	ANNOUNCE_WET = "If I don't think about it, it'll go away, right?",
	ANNOUNCE_WETTER = "Guhhh, water is my least favourite substance...",
	ANNOUNCE_SOAKED = "Aaargh, I'm soaked! Get it off, get it off!",

	ANNOUNCE_WASHED_ASHORE = "About time - land! Better dry off quick...",

    ANNOUNCE_DESPAWN = "Hang on, why am I doing this? I still have to-",
	ANNOUNCE_BECOMEGHOST = "oOooOooo!!",
	ANNOUNCE_GHOSTDRAIN = "Normally I'm not one to care for departed humans, but it feels different this time.",
	ANNOUNCE_PETRIFED_TREES = "I think I heard a faraway hissing sound... Probly just the wind.",
	ANNOUNCE_KLAUS_ENRAGE = "Oh no, oh no, what have I done?!",
	ANNOUNCE_KLAUS_UNCHAINED = "If I could retch, I would.",
	ANNOUNCE_KLAUS_CALLFORHELP = "Hey, getting someone else to do it for you is *my* thing!",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "Oh? I think there's something cemented away in here...",
		GLASS_LOW = "Come on man, just a couple more good hits...",
		GLASS_REVEAL = "Aha! It's a... rock?",
		IDOL_MED = "Oh? I think there's something cemented away in here...",
		IDOL_LOW = "Come on man, just a couple more good hits..",
		IDOL_REVEAL = "Aha! It's a... rock?",
		SEED_MED = "Oh? I think there's something cemented away in here...",
		SEED_LOW = "Come on man, just a couple more good hits..",
		SEED_REVEAL = "Aha! It's a... rock?",
	},

    --hallowed nights
    ANNOUNCE_SPOOKED = "Ahh!! Got me that time.",
	ANNOUNCE_BRAVERY_POTION = "I reckon I've temporarily gotten over my fear of lumber.",
	ANNOUNCE_MOONPOTION_FAILED = "I don't have any instructional tapes on potion brewing.",

	--winter's feast
	ANNOUNCE_EATING_NOT_FEASTING = "Yeah yeah, 'sharing is caring' and all that.",
	ANNOUNCE_WINTERS_FEAST_BUFF = "Ugh, is that... the holiday spirit, coursing through my veins? Yuck.",
	ANNOUNCE_IS_FEASTING = "Covering food in icing doesn't make eating it less torturous...",
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "It's gone. That feels better.",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "Come on mate, you've got two legs and a dream.",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "That's the stuff!",
    ANNOUNCE_REVIVED_FROM_CORPSE = "\"Welcome back to reality,\" me.",

    ANNOUNCE_FLARE_SEEN = "Someone's calling for help? But I've got so much work to do...",
    ANNOUNCE_MEGA_FLARE_SEEN = "Gahh, my location's been revealed!",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "Something approaching on very-big-shadow vector.",

    --willow specific
	ANNOUNCE_LIGHTFIRE =
	{
		"only_used_by_willow",
    },

    --winona specific
    ANNOUNCE_HUNGRY_SLOWBUILD =
    {
	    "only_used_by_winona",
    },
    ANNOUNCE_HUNGRY_FASTBUILD =
    {
	    "only_used_by_winona",
    },

    --wormwood specific
    ANNOUNCE_KILLEDPLANT =
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_GROWPLANT =
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_BLOOMING =
    {
        "only_used_by_wormwood",
    },

    --wortox specfic
    ANNOUNCE_SOUL_EMPTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_EMPTY_NICE =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_EMPTY_NAUGHTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_FEW =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_FEW_NICE =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_FEW_NAUGHTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_MANY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_MANY_NICE =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_MANY_NAUGHTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD_NICE =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD_NAUGHTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD_WARNING =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD_AVOIDED =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_PANFLUTE_BUFF_ACTIVE =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_PANFLUTE_BUFF_USED =
    {
        "only_used_by_wortox",
    },

    --walter specfic
    ANNOUNCE_AMMO_SLOT_OVERSTACKED = "only_used_by_walter",
	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
	{
		"only_used_by_walter",
		"only_used_by_walter",
	},
    ANNOUNCE_SLINGHSOT_NO_AMMO_SKILL = "only_used_by_walter",
	ANNOUNCE_SLINGHSOT_NO_PARTS_SKILL = "only_used_by_walter",
	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
	{
        "only_used_by_walter",
	},
	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
    {
        "only_used_by_walter",
	},
	ANNOUNCE_WOBY_RETURN =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_SIT =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_FOLLOW =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_PRAISE =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_FORAGE =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_WORK =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_COURIER =
	{
		"only_used_by_walter",
	},
	ANNOUNCE_WOBY_REMEMBERCHEST_FAIL =
	{
        "only_used_by_walter",
	},

    -- wx specific
    ANNOUNCE_WX_SCANNER_NEW_FOUND = "only_used_by_wx78",
    ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "only_used_by_wx78",

    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "Some drones have utilitarian purposes. I am not one of them.",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "Gah! I'm not a cooking drone.",
    QUAGMIRE_ANNOUNCE_LOSE = "Why does my chassis feel... scaly?",
    QUAGMIRE_ANNOUNCE_WIN = "Somehow, despite all odds, I did it?",

    ANNOUNCE_ROYALTY =
    {
        "Ah! What's happening to m- Your majesty!",
        "Woahwoahwoah, why am I bending over?! Your highness.",
        "Ah! What's happening to m- My leige!",
    },
    ANNOUNCE_ROYALTY_JOKER =
    {
        "Ah! What's happening to m- You donkey!",
        "Woahwoahwoah, why am I bending over?! Your foolishness.",
        "Ah! What's happening to m- My sneeze!",
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "Zap, zap, zap, here we crack.",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "Woah! Maybe I'm not such a wimp after all...",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "Wimpness, get outta here!",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "I'm about to be the most productive entertainment drone!",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "Oh, whew. No more of that nasty water stuff.",
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "Looks like I'll be staying awake for now.",

    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "Crap, crap, crap, no more zap.",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "I can feel my arms turning back into limp noodles.",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Nice to be somewhat less of a wimp for a little bit.",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "Back to my predetermined purpose, I guess.",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "Back to being as waterproof as usual. As in not at all.",
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "I'm no longer overclocked.",

	ANNOUNCE_OCEANFISHING_LINESNAP = "Grreeeat, now I can do something worthwhile.",
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "I think I'm supposed to reel it in.",
	ANNOUNCE_OCEANFISHING_GOTAWAY = "That fish was an escapee.",
	ANNOUNCE_OCEANFISHING_BADCAST = "That was a shocking cast. Not that it matters.",
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"Why am I wasting my time with this?!",
		"Why would I even want to catch something? So I can gum up my servos with salty goop?",
		"Come on man, there's stuff to be dug up!",
		"If only I could entertain myself these days.",
	},

	ANNOUNCE_WEIGHT = "It weighs: {weight}",
	ANNOUNCE_WEIGHT_HEAVY  = "This fat oaf weighs: {weight}",

	ANNOUNCE_WINCH_CLAW_MISS = "My eyesight is not good enough for leading targets.",
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "Huh? Oh, I thought I got it.",

    --Wurt announce strings
    ANNOUNCE_KINGCREATED = "only_used_by_wurt",
    ANNOUNCE_KINGDESTROYED = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_THRONE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_HOUSE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "only_used_by_wurt",
    ANNOUNCE_READ_BOOK =
    {
        BOOK_SLEEP = "only_used_by_wurt",
        BOOK_BIRDS = "only_used_by_wurt",
        BOOK_TENTACLES =  "only_used_by_wurt",
        BOOK_BRIMSTONE = "only_used_by_wurt",
        BOOK_GARDENING = "only_used_by_wurt",
		BOOK_SILVICULTURE = "only_used_by_wurt",
		BOOK_HORTICULTURE = "only_used_by_wurt",

        BOOK_FISH = "only_used_by_wurt",
        BOOK_FIRE = "only_used_by_wurt",
        BOOK_WEB = "only_used_by_wurt",
        BOOK_TEMPERATURE = "only_used_by_wurt",
        BOOK_LIGHT = "only_used_by_wurt",
        BOOK_RAIN = "only_used_by_wurt",
        BOOK_MOON = "only_used_by_wurt",
        BOOK_BEES = "only_used_by_wurt",

        BOOK_HORTICULTURE_UPGRADED = "only_used_by_wurt",
        BOOK_RESEARCH_STATION = "only_used_by_wurt",
        BOOK_LIGHT_UPGRADED = "only_used_by_wurt",
    },

    ANNOUNCE_WEAK_RAT = "You're not in shape. Not that I'm one to judge.",

    ANNOUNCE_CARRAT_START_RACE = "On my mark! Go!",

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "Uh, how about you go the other way!",
        "Turn around, you wretched vegetable!",
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "As fun as sleeping on the job is, now's not the time!",
    ANNOUNCE_CARRAT_ERROR_WALKING = "This isn't a walkathon, mate!",
    ANNOUNCE_CARRAT_ERROR_STUNNED = "Just get over it and keep going!",

    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",
    ANNOUNCE_GHOST_HINT = "only_used_by_wendy",
    ANNOUNCE_GHOST_TOY_NEAR = {
        "only_used_by_wendy",
    },
	ANNOUNCE_SISTURN_FULL = "only_used_by_wendy",
    ANNOUNCE_SISTURN_FULL_EVIL = "only_used_by_wendy",
    ANNOUNCE_SISTURN_FULL_BLOSSOM = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_DEATH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_RETRIEVE = "only_used_by_wendy",
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_SUMMON =
	{
		LEVEL1 = "only_used_by_wendy",
		LEVEL2 = "only_used_by_wendy",
		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
		LEVEL2 = "only_used_by_wendy",
		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_NOINSPIRATION = "only_used_by_wathgrithr",
    ANNOUNCE_NOTSKILLEDENOUGH = "only_used_by_wathgrithr",
    ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "only_used_by_wathgrithr",
    ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "only_used_by_wathgrithr",
    ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "only_used_by_wathgrithr",

    ANNOUNCE_WANDA_YOUNGTONORMAL = "only_used_by_wanda",
    ANNOUNCE_WANDA_NORMALTOOLD = "only_used_by_wanda",
    ANNOUNCE_WANDA_OLDTONORMAL = "only_used_by_wanda",
    ANNOUNCE_WANDA_NORMALTOYOUNG = "only_used_by_wanda",

	ANNOUNCE_POCKETWATCH_PORTAL = "Ugh... I can feel the integrity of the storyline ripping apart...",

	ANNOUNCE_POCKETWATCH_MARK = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_RECALL = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "only_used_by_wanda",

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "Woah! I can feel something writing to my hard drive.",
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "Already had that stored away in my braincase.",
    ANNOUNCE_ARCHIVE_NO_POWER = "S'gotta be juiced up.", --WAYPOINT 5/08/22

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "I've learned more about a silly sack of starch. Great.",
    },

    ANNOUNCE_PLANT_RANDOMSEED = "This seed doesn't seem to have a predetermined outcome.",

    ANNOUNCE_FERTILIZER_RESEARCHED = "A great use of my time, this is.",

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"Ow, ow, ow.",
		"Gahh, I feel like my case is about to melt.",
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "And that's that.",

	ANNOUNCE_TALK_TO_PLANTS =
	{
        "Just as long as the plants don't start talking back.",
        "... aaaand, that's my daily socialising quota done! Can I leave now?",
		"I don't think plants really have ears.",
        "I can think of a million better ways to spend my time.",
        "It must be hard doing nothing all day, hey plant?",
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "3, 2, 1... Ready or not, here I come!",
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "Fun and games isn't really my thing.",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"Gotcha.",
		"Found you, idiot.",
		"How predictable.",
		"Fancy seeing you here.",
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "One more, then I can get back to work.",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "That's it, I'm done.",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "{name} really saved my butt. Now I can leave.",
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "Time's almost up - it's almost a shame.",
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "*Ehhh ehhhh.*",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "I've gone for quite a hike, haven't I.",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "Should be around here somewhere.",
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "Gotcha!",

	ANNOUNCE_TICOON_START_TRACKING	= "Chubbo over here has found the scent.",
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "You're no truffle pig, are you?",
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "S'pose I should follow it.",
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "Fine, I'll follow ya.",
	ANNOUNCE_TICOON_NEAR_KITCOON = "Looks like slowcoach has found something.",
	ANNOUNCE_TICOON_LOST_KITCOON = "Someone else got to that one first.",
	ANNOUNCE_TICOON_ABANDONED = "Guess I'll have to do this myself.",
	ANNOUNCE_TICOON_DEAD = "That seems a bit harsh. Rest in peace, slowpoke.",

    -- YOTB
    ANNOUNCE_CALL_BEEF = "Get over here!",
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "Too far away from the bell post.",
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "Fur patterns aren't the greatest use of my precious hard drive space.",

    -- AE4AE
    ANNOUNCE_EYEOFTERROR_ARRIVE = "I guess this sort of nonsense is normal around here.",
    ANNOUNCE_EYEOFTERROR_FLYBACK = "Welcome back.",
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "Guess that gives me some time to continue searching.",

    -- PIRATES
    ANNOUNCE_CANT_ESCAPE_CURSE = "Gah. That'd be too simple, wouldn't it?",
    ANNOUNCE_MONKEY_CURSE_1 = "Uhhh... biological parts don't mesh well with my precepts.",
    ANNOUNCE_MONKEY_CURSE_CHANGE = "I hope I don't transform into a telephone. Or a fax machine.", --myhome@monkey.com.au
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "Whew! I can get back to my search protocol.",

    ANNOUNCE_PIRATES_ARRIVE = "Oh no, no, no. Please leave me alone!!",

    ANNOUNCE_BOOK_MOON_DAYTIME = "only_used_by_waxwell_and_wicker",

    ANNOUNCE_OFF_SCRIPT = "Gahh, I messed up my lines!",

    ANNOUNCE_COZY_SLEEP = "Ahh... That's a nice feeling.",

    --
	ANNOUNCE_TOOL_TOOWEAK = "Gahh! Must be my weak noodle arms.",

    ANNOUNCE_LUNAR_RIFT_MAX = "Gahh!! Where was the epilepsy warning?!",
    ANNOUNCE_SHADOW_RIFT_MAX = "Guess I oughta see what that was all about.",

    ANNOUNCE_SCRAPBOOK_FULL = "My bap is already all scrooked-out. Oops, other way round.",

    ANNOUNCE_CHAIR_ON_FIRE = "Yeeowww!",

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "Gotta slip, slop, slap.",

    ANNOUNCE_COACH =
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_END_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_NOTEAM =
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },

    ANNOUNCE_YOTD_NOBOATS = "Gotta be closer to the start.",
    ANNOUNCE_YOTD_NOCHECKPOINTS = "Needs checkpoints to be a real race.",
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "Needs more boats for my mates.",

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "Guess this den's not made for deeper waters.",
    ANNOUNCE_OTTERBOAT_DENBROKEN = "Uh oh. Sorry otters, this is on me.",

    ANNOUNCE_GATHER_MERM = "Must be a Merm thing.",

    -- rifts 4
    ANNOUNCE_EXIT_GELBLOB = "Gah! I'm covered in it!",
	ANNOUNCE_SHADOWTHRALL_STEALTH = "Owch! Someone's asking to be shocked...",
    ANNOUNCE_RABBITKING_AGGRESSIVE = "Something's digging around down there.",
    ANNOUNCE_RABBITKING_PASSIVE = "Mild tremors underfoot.",
    ANNOUNCE_RABBITKING_LUCKY = "Your sparkle has caught my eye...",
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "Gotcha!",
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "Guess you couldn't grow carrots here?",

    -- Hallowed Nights 2024
	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "Gahh!!",

    -- Winter's Feast 2024
	ANNOUNCE_SNOWBALL_TOO_BIG = "That snowball's big, and it's not getting bigger.",
	ANNOUNCE_SNOWBALL_NO_SNOW = "Need more snow.",

    -- Meta 5
    ANNOUNCE_WENDY_BABYSITTER_SET = "only_used_by_wendy",
    ANNOUNCE_WENDY_BABYSITTER_STOP = "only_used_by_wendy",

	ANNOUNCE_WORTOX_REVIVER_FAILTELEPORT = "I'm not built for teleportation...",

    ANNOUNCE_NO_ABIGAIL_FLOWER = "only_used_by_wendy",

    ANNOUNCE_ELIXIR_BOOSTED = "Good for the vitality, that was.",
    ANNOUNCE_ELIXIR_GHOSTVISION = "Guhh. Feels a bit weird.",
    ANNOUNCE_ELIXIR_PLAYER_SPEED = "Betcha can't catch me.",

    ANNOUNCE_ABIGAIL_HIDING = "only_used_by_wendy",

    ANNOUNCE_EXLIIR_TOO_SUPER = "They must get more potent with age.",

	BATTLECRY =
	{
		GENERIC = "Gah! I'm not a combat drone!",
		PIG = "Guess I can't negotiate with it...",
		PREY = "Get outta my sight, vermin!",
		SPIDER = "Here comes the pest control! Hur hur hur.",
		SPIDER_WARRIOR = "Die, die, die!",
		DEER = "Perish, innocent creature!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "Maybe I should stick to entertainment.",
		PIG = "Offensive tactics failed.",
		PREY = "Vermin definitely have the speed advantage.",
		SPIDER = "I guess that makes *me* the pest...",
		SPIDER_WARRIOR = "Pest control tactics failed.",
	},

	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "\"Welcome back to reality,\" me.",
        MULTIPLAYER_PORTAL_MOONROCK = "Can't say I'd recommend messing with forces beyond your control.",
        MOONROCKIDOL = "Never really been much for gods and stuff.",
        CONSTRUCTION_PLANS = "Great, more building for me to do.",

        ANTLION =
        {
            GENERIC = "What a great, ugly thing.",
            VERYHAPPY = "I'd be fine without this thing as my friend.",
            UNHAPPY = "I think our temporary friendship is over.",
        },
        ANTLIONTRINKET = "It's not the right kind of lost memory I'm looking for - but it's pretty close.",
        SANDSPIKE = "Even the sand seems out to get me.",
        SANDBLOCK = "Even the sand seems out to stop me from doing my job.",
        GLASSSPIKE = "It's hard, it's shiny, and it doesn't go anywhere.", --HA HA HA
        GLASSBLOCK = "It's hard, it's shiny, and it doesn't go anywhere.",
        ABIGAIL_FLOWER =
        {
            GENERIC = "This thing seems very, very important to someone. How interesting...",
			LEVEL1 = "The leaves are starting to unfurl.",
			LEVEL2 = "It's almost opened up.",
			LEVEL3 = "I wonder what distant memories you hold.",

			-- deprecated
            LONG = "This thing seems very, very important to someone. How interesting...",
            MEDIUM = "The leaves are starting to unfurl.",
            SOON = "It's almost opened up.",
            HAUNTED_POCKET = "I wonder what distant memories you hold.",
            HAUNTED_GROUND = "I wonder what distant memories you hold.",
        },

        BALLOONS_EMPTY = "A bunch of deflated, sad sacks. Just like me, hur hur hur.",
        BALLOON = "Looks like I'm not the only one with an entertainment precept.",
		BALLOONPARTY = "'S masterful how he gets the tiny balloons inside. I'm impressed.",
		BALLOONSPEED =
        {
            DEFLATED = "Just another entertainment sack.",
            GENERIC = "This one seems to invoke a childlike glee in the holder.",
        },
		BALLOONVEST = "Don't feel like getting bits of rubber in my joints.",
		BALLOONHAT = "Don't feel like getting bits of rubber in my joints.",

        BERNIE_INACTIVE =
        {
            BROKEN = "Just a raggedy pile of junk, now.",
            GENERIC = "Ah, a fellow entertainer. How do you do?",
        },

        BERNIE_ACTIVE = "Hard at work, making people happy. I can respect that.",
        BERNIE_BIG = "Guess entertainment isn't your only job.",

        BOOKSTATION =
		{
			GENERIC = "Studyin' is for people with too much spare time.",
			BURNT = "Ha. Bet it took all her stupid books with it.",
		},
        BOOK_BIRDS = "Books are so last year.",
        BOOK_TENTACLES = "A book? Tapes are more useful, if you ask me.",
        BOOK_GARDENING = "I don't need to know how to waste my time gardening.",
		BOOK_SILVICULTURE = "Silviculture is for people who want to settle down.",
		BOOK_HORTICULTURE = "I don't need to know how to waste my time gardening.",
        BOOK_SLEEP = "I already know how to shut down, thank you very much.",
        BOOK_BRIMSTONE = "I'd much like to avoid burning it all to a crisp.",

        BOOK_FISH = "The ocean is full enough as is.",
        BOOK_FIRE = "Could be useful. For a book.",
        BOOK_WEB = "My interpretation of that is much more efficient.",
        BOOK_TEMPERATURE = "Nothin that a well-tended fire couldn't do.",
        BOOK_LIGHT = "I can see just fine without some holy light, thanks.",
        BOOK_RAIN = "Rain, rain, go away.",
        BOOK_MOON = "This book? Doesn't phase me.",
        BOOK_BEES = "She's allied with the drones, has she?",

        BOOK_HORTICULTURE_UPGRADED = "I still don't need to know how to waste my time gardening.",
        BOOK_RESEARCH_STATION = "Gahh! Hey, that's plagiarism!!",
        BOOK_LIGHT_UPGRADED = "I can see just fine without some holy light, thanks.",

        FIREPEN = "Great, she can burn down everything I know and love.",

        PLAYER =
        {
            GENERIC = "'S going on, mate?",
            ATTACKER = "Something's up with that one.",
            MURDERER = "I think I'll leave %s alone.",
            REVIVER = "Good on ya, %s,",
            GHOST = "Guess I should help you out, shouldn't I?",
            FIRESTARTER = "Fire never gets anyone anywhere. Trust me.",
        },
        WILSON =
        {
            GENERIC = "Let me guess. 'Science' is your middle name?",
            ATTACKER = "Science-%s has got something on the brain.",
            MURDERER = "Guess I gotta worry about getting disassembled now, too.",
            REVIVER = "Idiot McGee has done something useful for once.",
            GHOST = "Nice work. Just give me a minute and I'll fix that right up for you.",
            FIRESTARTER = "Combustion is a form of science? Sounds like an excuse to me.",
        },
        WOLFGANG =
        {
            GENERIC = "Brute strength isn't gonna help me search. But thanks.",
            ATTACKER = "Wouldn't want to get into a scrap with you, would I?",
            MURDERER = "I can feel my 'flight or flight' instincts kicking in.",
            REVIVER = "Soft on the inside, I guess.",
            GHOST = "Not so strong now, huh? Hur hur hur.",
            FIRESTARTER = "More fire. Just what I wanted.",
        },
        WAXWELL =
        {
            GENERIC = "%s, whassa meaning of that confused look?",
            ATTACKER = "What a shifty looking man.",
            MURDERER = "So shifty, I think I might shift out of here.",
            REVIVER = "He shifted that ghost back to the real world.",
            GHOST = "Jeez, that's a thousand-yard stare if I've ever seen one.",
            FIRESTARTER = "Shifty, shifty, shifty.",
        },
        WX78 =
        {
            GENERIC = "I don't think you're an 'entertainment' drone, are you %s?",
            ATTACKER = "Yep, definitely not an entertainment drone...",
            MURDERER = "This had better not be a security bot coup.",
            REVIVER = "Decent job, I won't lie. Maybe I'll take notes.",
            GHOST = "Even a measly entertainment drone like me wouldn't make a mistake like *that*.",
            FIRESTARTER = "I can smell melting insulation from yonks away. Hmm...",
        },
        WILLOW =
        {
            GENERIC = "S'garn on, %s?",
            ATTACKER = "I'm glad I'm somewhat fireproof. Somewhat.",
            MURDERER = "You don't have to be such a murderous arson-hole, %s.",
            REVIVER = "%s has been reigniting people's inner fires. Or something poetic like that.",
            GHOST = "%s needs some firestarters for her kindling.",
            FIRESTARTER = "Fire, fire, fire.",
        },
        WENDY =
        {
            GENERIC = "Got any precious memories you'd be happy to lose, %s?",
            ATTACKER = "Don't hurt me, I'm just an innocent memory-snatcher!",
            MURDERER = "How hypocritical, hey %s?",
            REVIVER = "How sickly sweet of you, %s.",
            GHOST = "Wouldn't want to lose all those memories, would you %s?",
            FIRESTARTER = "Death and acrid smoke follow you like a curse, %s.",
        },
        WOODIE =
        {
            GENERIC = "If you see anything black, rectangular, and stuck in a tree... let me know, will ya?",
            ATTACKER = "My tape-hunting friend is a bit more hostile than I remember.",
            MURDERER = "A murderous axe-wielder? Reminds me of a certain guy.",
            REVIVER = "Digging up tapes, and saving people's lives. What's next, %s?",
            GHOST = "Is this your audition for a horror movie?",
            BEAVER = "That isn't a normal human thing, is it?",
            BEAVERGHOST = "Got something stuck in your teeth, %s?",
            MOOSE = "Those hooves don't look very good for digging up tapes.",
            MOOSEGHOST = "Fleshy forms are so restricting, aren't they, %s?",
            GOOSE = "That's some panicked wildlife... oh wait, it's %s!",
            GOOSEGHOST = "Something ruffling your feathers, %s?",
            FIRESTARTER = "Aren't you supposed to protect the trees, not burn them?",
        },
        WICKERBOTTOM =
        {
            GENERIC = "%s is giving me the evil eye.",
            ATTACKER = "Got a book on being a psychopath, do you %s?",
            MURDERER = "%s is about to publish a thesis on being a murderer.",
            REVIVER = "Maybe books aren't so bad after all.",
            GHOST = "Hur hur hur. Look where you and your collection of books ended up.",
            FIRESTARTER = "Going to write a report on how to be pointlessly destructive, are we?",
        },
        WES =
        {
            GENERIC = "Clowns are okay, so long as they don't turn into spaghetti.", --the year was 1943
            ATTACKER = "I'm even more unsettled than I was before.",
            MURDERER = "%s doesn't get social convention. Including the not murdering part.",
            REVIVER = "You're probably more useful than me, I'll give you that.",
            GHOST = "Still as silent as ever, hur hur hur.",
            FIRESTARTER = "%s let fire do the talking.",
        },
        WEBBER =
        {
            GENERIC = "S'garn on, %s?",
            ATTACKER = "I'd best keep my distance from %s.",
            MURDERER = "Jeez. I'd best get the bug spray.",
            REVIVER = "%s is a fine example of the cycle of life.",
            GHOST = "You're definitely no ordinary spider.",
            FIRESTARTER = "Might be news to you, but fire does this thing called 'spreading.'",
        },
        WATHGRITHR =
        {
            GENERIC = "Ah, a fellow entertainer. How are ya, %s?",
            ATTACKER = "%s is taking her role a bit too seriously.",
            MURDERER = "Time to do what I do best, I think.",
            REVIVER = "I thought you were larping as a warrior, not a doctor.",
            GHOST = "%s let the whole warrior thing get to her.",
            FIRESTARTER = "I respected you, but that's gone out the window now.",
        },
        WINONA =
        {
            GENERIC = "Please don't take me apart, %s.",
            ATTACKER = "I don't think using a weapon counts as 'taking someone apart.'",
            MURDERER = "At least take me apart using actual tools, yeah?",
            REVIVER = "The human body is just a very complex machine, if you think about it.",
            GHOST = "Someone needs to engineer you back to life.",
            FIRESTARTER = "Fire is a strange way to take something apart. I hope I'm not next...",
        },
        WORTOX =
        {
            GENERIC = "A fellow traveller from another place. S'goin on?",
            ATTACKER = "You're definitely coloured like a pest.",
            MURDERER = "The red colour is nature's way of saying 'screw off.'",
            REVIVER = "Do I have a soul? How philosophical of you to ask.",
            GHOST = "From another realm, and still dead as a doornail.",
            FIRESTARTER = "Should've expected nothing less.",
        },
        WORMWOOD =
        {
            GENERIC = "And I thought *I* was a product of boredom.",
            ATTACKER = "Do I really need to get the hedge trimmers ready?",
            MURDERER = "Time to whipper-snipper this whippersnapper.",
            REVIVER = "Guess that means you have medicinal properties, %s.",
            GHOST = "Well, doesn't that defy all logic.",
            FIRESTARTER = "Such sweet irony.",
        },
        WARLY =
        {
            GENERIC = "Ah, a connoisseur of film? Makes for a nice change.",
            ATTACKER = "I'm sure there are easier ways to get ingredients, %s.",
            MURDERER = "%s is about to whip up a long pork delight.",
            REVIVER = "%s is doing his due diligence.",
            GHOST = "I could hire you to act in a horror film, %s.",
            FIRESTARTER = "The fire is supposed to stay *under* the pot, %s.",
        },

        WURT =
        {
            GENERIC = "Find any junk in the swamp, %s?",
            ATTACKER = "%s smells fishy. Well, she always does.",
            MURDERER = "Just another fishy sod, ready to be dispatched.",
            REVIVER = "%s brought them back to reality.",
            GHOST = "%s looks about ready for the bottom feeders.",
            FIRESTARTER = "Such naïveté is so inconvenient.",
        },

        WALTER =
        {
            GENERIC = "Why don't you 'scout' me out some tapes, %s?",
            ATTACKER = "A slingshot will probably beat tapes, if it comes down to it.",
            MURDERER = "Guess I'll soon find out if I can outrun slingshot shots.",
            REVIVER = "%s has finally gotten his 'don't be an annoying ankle-biter' badge.",
            GHOST = "Now's not the time to be having fun, %s.",
            FIRESTARTER = "There's a joke to be made about firestarting badges.",
        },

        WANDA =
        {
            GENERIC = "Another human wanting to take me apart. Just what I wanted...",
            ATTACKER = "For an... old? lady, you're quite violent.",
            MURDERER = "You'll at least use tools to disassemble me, right??",
            REVIVER = "All these time shenanigans are messing with my head...",
            GHOST = "You're a fellow tinkerer, so I guess I'll help.",
            FIRESTARTER = "Please stay away from my tapes!",
        },

        WONKEY =
        {
            GENERIC = "Just some ape. Hopefully it doesn't get poo on my stuff.",
            ATTACKER = "I don't think poo is my biggest concern anymore.",
            MURDERER = "Feels like it's gonna observe me at night.",
            REVIVER = "Maybe if I'm nice, I'll get invited into it's monkey home.",
            GHOST = "An abomination of nature.",
            FIRESTARTER = "Oh, great. It's pyromanic too.",
        },

        MIGRATION_PORTAL =
        {
        --    GENERIC = "If I had any friends, this could take me to them.",
        --    OPEN = "If I step through, will I still be me?",
        --    FULL = "It seems to be popular over there.",
        },
        GLOMMER =
        {
            GENERIC = "You're nice enough. Just keep that awful goop away from my everything.",
            SLEEPING = "I'd snooze, but I've got too much stuff to do.",
        },
        GLOMMERFLOWER =
        {
            GENERIC = "It's caked with a light grey goop.",
            DEAD = "Thassa depressing sight.",
        },
        GLOMMERWINGS = "I'm sure there's some sorta use for these, if I search hard enough.",
        GLOMMERFUEL = "I think I'll keep this nasty stuff at arm's length.",
        BELL = "I'm not sure how I found this, but it feels extremely powerful.",
        STATUEGLOMMER =
        {
            GENERIC = "Idolising things with a statue. How old school.",
            EMPTY = "Destroying art is my specialty.",
        },

        LAVA_POND_ROCK = "I'm not here to do a geology tour.",

		WEBBERSKULL = "I can feel an otherworldly force compelling me to bury it.",
		WORMLIGHT = "I'm in no rush to glow in the dark, thanks.",
		WORMLIGHT_LESSER = "I'm in no rush to glow in the dark, thanks.",
		WORM =
		{
		    PLANT = "I'm not fawning over that fauna.",
		    DIRT = "Just another thing to avoid getting in my servos.",
		    WORM = "I think I may have dug up one too many things...",
		},
        WORMLIGHT_PLANT = "I'm not fawning over that fauna.",
		MOLE =
		{
			HELD = "I don't want this thing messing up my precious stuff.",
			UNDERGROUND = "I'd better hurry up before it gets to all the buried goodies first.",
			ABOVEGROUND = "Little thief, taking what it doesn't own. I guess that's a bit like me.",
		},
		MOLEHILL = "A hole fulla stashed goodies.",
		MOLEHAT = "I'll stick with my tape, thank you very much.",

		EEL = "Oh good, I can fill my chassis full of wet AND salty goop!",
		EEL_COOKED = "Oh good, I can fill my chassis full of wet AND salty goop!",
		UNAGI = "Sorry, I've never really been much of an eel guy.",
		EYETURRET = "The less fighting I have to do, the better.",
		EYETURRET_ITEM = "I should deploy this thing so I don't have to fight.",
		MINOTAURHORN = "That thing woulda turned me into a pile of cogs.",
		MINOTAURCHEST = "The spoils of all my hard work.",
		THULECITE_PIECES = "Bits and pieces - not the exact ones I need...",
		POND_ALGAE = "I'm not here to do an algae tour.",
		GREENSTAFF = "I don't think I'm responsible enough to wield this thing.",
		GIFT = "Social conventions are dumb.",
        GIFTWRAP = "Social conventions are dumb.",
		POTTEDFERN = "I don't really understand 'decoration.'",
        SUCCULENT_POTTED = "'Decorating' never really caught on with me.",
		SUCCULENT_PLANT = "I'm not here to do a succulent tour.",
		SUCCULENT_PICKED = "Even normal humans don't really eat this. I certainly won't be.",
		SENTRYWARD = "Could help me protect my stuff from those people tryna take it apart...",
        TOWNPORTAL =
        {
			GENERIC = "I'm not risking getting sand in me. No thanks.",
			ACTIVE = "It's ready, but I'm still not a fan of sand.",
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "I can use it to exchange my existence here.",
			ACTIVE = "I won't lie, it's tempting, but I have... stuff to do.",
		},
        WETPAPER = "Wet, wet, wet.",
        WETPOUCH = "Who knows, someone could have left their things in here...",
        MOONROCK_PIECES = "Smaller pieces of a greater whole.",
        MOONBASE =
        {
            GENERIC = "That hole in the middle looks very intentional.",
            BROKEN = "Needs fixing, but I dunno if I can spare the time.",
            STAFFED = "I'm too impatient for this...",
            WRONGSTAFF = "The handle doesn't really fit in.",
            MOONSTAFF = "Magic.",
        },
        MOONDIAL =
        {
			GENERIC = "Guess I could use it to track the moon beast.",
			NIGHT_NEW = "It's a 'new' moon, even though it's the same one.",
			NIGHT_WAX = "It's a waxing moon.",
			NIGHT_FULL = "It's a full moon.",
			NIGHT_WANE = "This reminds me of a certain croissant-headed fellow.", --hehrehrehreyreher
			CAVE = "Dunno what larrikin built this down here.",
			WEREBEAVER = "only_used_by_woodie", --woodie specific
			GLASSED = "Uhhhh, uh oh. That isn't right.",
        },
		THULECITE = "Smaller parts made into a greater whole.",
		ARMORRUINS = "This makes me feel like I might stand a chance.",
		ARMORSKELETON = "I'm okay not having boney bits, to be honest.",
		SKELETONHAT = "... It doesn't really contour to my head.",
		RUINS_BAT = "My noodle arms'll struggle with this thing.",
		RUINSHAT = "This should give my delicate insides the protection they deserve.",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "Seems pretty chill 'round here.",
            WARN = "It's vibrating a little bit.",
            WAXING = "I think it's warning me that awful things are about to happen.",
            STEADY = "Awful things are definitely happening!",
            WANING = "The awful things are almost gone, thankfully.",
            DAWN = "I'm basically free of the awfulness. Whew.",
            NOMAGIC = "Seems pretty chill 'round here.",
		},
		BISHOP_NIGHTMARE = "If I had instincts, they'd be telling me to scram.",
		ROOK_NIGHTMARE = "You're a damn wretched thing, aren't you?",
		KNIGHT_NIGHTMARE = "It almost looks as desolate as me.",
		MINOTAUR = "That great thing'll turn me into a pile of cogs and sprockets!",
		SPIDER_DROPPER = "As long as it doesn't call it's friends, I think I'll be right.",
		NIGHTMARELIGHT = "What a funny looking device.",
		NIGHTSTICK = "This makes me feel like one'a those patrol bots from way back.",
		GREENGEM = "Another flavour a rock.",
		MULTITOOL_AXE_PICKAXE = "If it's one less thing I need to lug around, I'm all for it.",
		ORANGESTAFF = "To be honest, I'm not really built for walking either. This might help.",
		YELLOWAMULET = "I can feel its power coursing through my wires!",
		GREENAMULET = "This makes me aware of a million different ways to use stuff.",
		SLURPERPELT = "'S a hairy, soggy thing.",

		SLURPER = "Dunno why, but this thing doesn't really intimidate me.",
		SLURPER_PELT = "'S a hairy, soggy thing.",
		ARMORSLURPER = "Gahh. I really hate this.",
		ORANGEAMULET = "No more doing in my back!",
		YELLOWSTAFF = "Indistinguishable from magic.",
		YELLOWGEM = "I didn't come all the way out here to start a rock collection.",
		ORANGEGEM = "Might be useful. Not that I'm an expert.",
        OPALSTAFF = "Indistinguishable from science.",
        OPALPRECIOUSGEM = "Fancy lookin' rock.",
        TELEBASE =
		{
			VALID = "Ready to get schmoovin'.",
			GEMS = "Purple gems seem ta be the key ingredient here.",
		},
		GEMSOCKET =
		{
			VALID = "Good to go.",
			GEMS = "Needs to be gemmed up.",
		},
		STAFFLIGHT = "The power of a sun, in the palm of my hand...",
        STAFFCOLDLIGHT = "The power of a moon, in the palm of my hand...",

        ANCIENT_ALTAR = "I didn't come here looking for ancient altars, but this seems pretty cool anyway.",

        ANCIENT_ALTAR_BROKEN = "It's busted up.",

        ANCIENT_STATUE = "Jeez, some people shouldn't be allowed near chisels.",

        LICHEN = "Even this desolate pit is full of 'food.'",
		CUTLICHEN = "I don't really wanna get death-flavoured plant inside me.",

		CAVE_BANANA = "I can add it to my collection of 'things I really shouldn't eat.'",
		CAVE_BANANA_COOKED = "I can add it to the collection of 'things I really shouldn't put in my mouth.'",
		CAVE_BANANA_TREE = "Well, if I ever want to gum up my insides with mush...",
		ROCKY = "More things that could turn me into pulp. Good-o.", --WAYPOINT 20/09/22

		COMPASS =
		{
			GENERIC="Spending forever inside some chamber really messed up my sense of direction.",
			N = "North.",
			S = "South.",
			E = "East.",
			W = "West.",
			NE = "Northeast.",
			SE = "Southeast.",
			NW = "Northwest.",
			SW = "Southwest.",
		},

        HOUNDSTOOTH = "Yanking stuff out of dead bodies isn't normally my thing.",
        ARMORSNURTLESHELL = "This makes me a bit less insecure. Literally.",
        BAT = "Just like rats, except they can fly too. Fantastic.",
        BATBAT = "It puts me back together as I use it. Strange.",
        BATWING = "It's probably caked with guano. I'm good.",
        BATWING_COOKED = "Fried guano-caked bat leg is still guano-caked bat leg.",
        BATCAVE = "I'd best steer clear.",
        BEDROLL_FURRY = "I can't sleep - whether it's inside a fluffy bag or not.", --Sleeping is the same - whether it's inside a fluffy bag or not. --changing the quote so it makes more sense with insomiac
        BUNNYMAN = "Creepy looking dude. Just leave me alone, and we'll be best mates.",
        FLOWER_CAVE = "More plant goop, but I guess this one's a bit more utilitarian.",
        GUANO = "Thankfully 'farming' isn't really my thing, or else I might need to touch this stuff.",
        LANTERN = "Not being as blind as a bat is a pastime of mine.",
        LIGHTBULB = "Bit less technological than usual.",
        MANRABBIT_TAIL = "That thing really got butchered, didn't it?",
        MUSHROOMHAT = "Really brings out my inner whimsy.",
        MUSHROOM_LIGHT2 =
        {
            ON = "Like the inside of a cathode tube.",
            OFF = "That would be more useful turned on, I think.",
            BURNT = "Fire has a tendency to do that.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "Like the inside of a cathode tube.",
            OFF = "That would be more useful turned on, I think.",
            BURNT = "Fire has a tendency to do that.",
        },
        SLEEPBOMB = "Don't particularly want a mildew infestation, to be honest.",
        MUSHROOMBOMB = "Very scientific.",
        SHROOM_SKIN = "What a diverse collection of things I shouldn't get inside me.",
        TOADSTOOL_CAP =
        {
            EMPTY = "I should avoid falling in that.",
            INGROUND = "Biology is so gross.",
            GENERIC = "I've seen thousands of mushrooms down here. What's one more?",
        },
        TOADSTOOL =
        {
            GENERIC = "What a great ugly thing. And it wants to kill me.",
            RAGE = "It *really* wants to kill me now.",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "Fungus has a tendency to go where it isn't wanted. Hmmm.",
            BURNT = "Seeya.",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "Fungus, schmungus.",
            BLOOM = "Blooming fungus, schmooming schmungus.",
            ACIDCOVERED = "Ugh. Looks corrosive.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "I definitely wouldn't want to eat that.\nBut I guess that applies to everything.",
            BLOOM = "Don't feel the need to censor yourself, shroom.",
            ACIDCOVERED = "Ugh. Looks corrosive.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "Wouldn't want those growing inside me. Ouch.",
            BLOOM = "I should leave before its spores get inside me.",
            ACIDCOVERED = "Ugh. Looks corrosive.",
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "Even grosser than regular shrooms, somehow.",
            ACIDCOVERED = "Ugh. Looks corrosive.",
        },
        SPORE_TALL =
        {
            GENERIC = "'Spore blimey,' hur hur hur.",
            HELD = "And into the depths of my jacket it goes.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "'Spore blimey,' hur hur hur.",
            HELD = "And into the depths of my jacket it goes.",
        },
        SPORE_SMALL =
        {
            GENERIC = "'Spore blimey,' hur hur hur.",
            HELD = "And into the depths of my jacket it goes.",
        },
        RABBITHOUSE =
        {
            GENERIC = "Damn. Someone has watched too many fairy tales.",
            BURNT = "No more whimsy.",
        },
        SLURTLE = "Life finds a way, I suppose.",
        SLURTLE_SHELLPIECES = "If it was a good day, I'd think of something poetic about this.",
        SLURTLEHAT = "Aerodynamic.",
        SLURTLEHOLE = "If I jumped in there it'd be a death sentence.",
        SLURTLESLIME = "Better keep this stuff at arm's length.",
        SNURTLE = "Guess that's a mutation.",
        SPIDER_HIDER = "Not the biggest fan of that thing.",
        SPIDER_SPITTER = "Nasty thing.",
        SPIDERHOLE = "I guess it's a bit more exciting than a regular rock. A bit.",
        SPIDERHOLE_ROCK = "I guess it's a bit more exciting than a regular rock. A bit.",
        STALAGMITE = "Is it composite, meta-whatsit, or I-don't-care-eous?",
        STALAGMITE_TALL = "Is it composite, meta-whatsit, or I-don't-care-eous?",

        TURF_CARPETFLOOR = "Not as comfortable as my entertainment chamber.",
        TURF_CHECKERFLOOR = "Furnishings aren't really my priority right now.",
        TURF_DIRT = "I need to dig up plastic junk, not dirt.",
        TURF_FOREST = "I need to dig up plastic junk, not dirt.",
        TURF_GRASS = "I need to dig up plastic junk, not dirt.",
        TURF_MARSH = "I need to dig up plastic junk, not goop.",
        TURF_METEOR = "I need to dig up plastic junk, not rock.",
        TURF_PEBBLEBEACH = "I need to dig up plastic junk, not sand.",
        TURF_ROAD = "Furnishings aren't really my priority right now.",
        TURF_ROCKY = "I need to dig up plastic junk, not rock.",
        TURF_SAVANNA = "I need to dig up plastic junk, not dirt.",
        TURF_WOODFLOOR = "Furnishings aren't really my priority right now.",

		TURF_CAVE="I need to dig up plastic junk, not rock.",
		TURF_FUNGUS="I need to dig up plastic junk, not goop.",
		TURF_FUNGUS_MOON = "I need to dig up plastic junk, not fancy goop.",
		TURF_ARCHIVE = "I need to dig up plastic junk, not some old tiles.",
		TURF_SINKHOLE="I need to dig up plastic junk, not rock.",
		TURF_UNDERROCK="I need to dig up plastic junk, not rock.",
		TURF_MUD="I need to dig up plastic junk, not mud.",

		TURF_DECIDUOUS = "I need to dig up plastic junk, not dirt.",
		TURF_SANDY = "I need to dig up plastic junk, not sand.",
		TURF_BADLANDS = "I need to dig up plastic junk, not sand.",
		TURF_DESERTDIRT = "I need to dig up plastic junk, not dirt.",
		TURF_FUNGUS_GREEN = "I need to dig up plastic junk, not goop.",
		TURF_FUNGUS_RED = "I need to dig up plastic junk, not goop.",
		TURF_DRAGONFLY = "Furnishings aren't really my priority right now.",

        TURF_SHELLBEACH = "Furnishings aren't really my priority right now.",

        TURF_RUINSBRICK = "I need to dig up plastic junk, not some old tiles.",
		TURF_RUINSBRICK_GLOW = "I need to dig up plastic junk, not some old tiles.",
		TURF_RUINSTILES = "I need to dig up plastic junk, not some old tiles.",
		TURF_RUINSTILES_GLOW = "I need to dig up plastic junk, not some old tiles.",
		TURF_RUINSTRIM = "I need to dig up plastic junk, not some old tiles.",
		TURF_RUINSTRIM_GLOW = "I need to dig up plastic junk, not some old tiles.",

        TURF_MONKEY_GROUND = "I need to dig up plastic junk, not sand.",

        TURF_CARPETFLOOR2 = "Not as comfortable as my entertainment chamber.",
        TURF_MOSAIC_GREY = "Furnishings aren't really my priority right now.",
        TURF_MOSAIC_RED = "Furnishings aren't really my priority right now.",
        TURF_MOSAIC_BLUE = "Furnishings aren't really my priority right now.",

        TURF_BEARD_RUG = "That's disgusting.",

		POWCAKE = "This is loner scientist food.",
        CAVE_ENTRANCE = "I'm used to being blocked off by now.",
        CAVE_ENTRANCE_RUINS = "I'm used to being blocked off by now.",

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "Dunno if I can get past this one.",
            OPEN = "Hopefully this giant hole is fulla people's old junk.",
            FULL = "Dunno how a cave can be occupied, but here we are.",
        },
        CAVE_EXIT =
        {
            GENERIC = "Dunno if I can get past this one.",
            OPEN = "My pockets can never be too full of tape junk.",
            FULL = "Dunno how the surface can be 'full,' but here we are.",
        },

		MAXWELLPHONOGRAPH = "Not a bad tune, if you ask me.",--single player
		BOOMERANG = "It smells of beer and cheap parmigiana.",
		PIGGUARD = "Don't think this guy is up for diplomatics.",
		ABIGAIL =
		{
            LEVEL1 =
            {
                "A lost wanderer. How's the day?",
                "A lost wanderer. How's the day?",
            },
            LEVEL2 =
            {
                "A lost wanderer. How's the day?",
                "A lost wanderer. How's the day?",
            },
            LEVEL3 =
            {
                "A lost wanderer. How's the day?",
                "A lost wanderer. How's the day?",
            },
		},

		ADVENTURE_PORTAL = "More strange swirly holes. In we go!",
		AMULET = "Good for a lone ranger like me, I reckon.",
		ANIMAL_TRACK = "Tracking that thing looks like a giant time sink.",
		ARMORGRASS = "My jacket probably does a better job than this.",
		ARMORMARBLE = "Don't know if my servos are cracked up for that.",
		ARMORWOOD = "Maybe my fragile casing stands a chance now.",
		ARMOR_SANITY = "Jeez. What's wrong with regular armour?",
		ASH =
		{
			GENERIC = "It has an imprint of some incinerated thing.",
			REMAINS_GLOMMERFLOWER = "It has an imprint of an incinerated flower.",
			REMAINS_EYE_BONE = "It has an imprint of an incinerated eyebone.",
			REMAINS_THINGIE = "It has an imprint of an incinerated something-or-other.",
		},
		AXE = "Guh, I wish surviving didn't involve so much legwork.",
		BABYBEEFALO =
		{
			GENERIC = "Maybe if I befriend it now, it won't try to kill me when it's older.",
		    SLEEPING = "Night night, you big stinker.",
        },
        BUNDLE = "We're no better than the people leaving this stuff I'm digging up.",
        BUNDLEWRAP = "I don't wanna wrap up my stuff just to leave it lying around.",
		BACKPACK = "Packed up, n' ready to go.",
		BACONEGGS = "Only a dog would eat this.", --when the title card is yellow :flushed:
		BANDAGE = "I reckon I could keep my chassis in one piece with this.",
		BASALT = "It has salt in its name. I'm not touching it.", --removed
		BEARDHAIR = "This makes me glad I can't grow hair.",
		BEARGER = "Don't really plan on getting torn to shreds today, if I'm honest.",
		BEARGERVEST = "This might keep my joints from locking up.",
		ICEPACK = "I don't really have much need for refrigeration.",
		BEARGER_FUR = "Can't say putting outfits together is my specialty.",
		BEDROLL_STRAW = "Don't really feel like roughing it out here.", --Not that I wanted to rough it out here, but I don't think I have a choice. --changing the quote so it makes more sense with insomiac
		BEEQUEEN = "I'm definitely NOT honey-proof!",
		BEEQUEENHIVE =
		{
			GENERIC = "A pattern on the ground has never made me so uncomfortable.",
			GROWING = "Gahh!",
		},
        BEEQUEENHIVEGROWN = "If I had skin, it'd be crawling at the sight of that.",
        BEEGUARD = "A fluffy monarchist.",
        HIVEHAT = "This'll bring more attention to me than I'd like.",
        MINISIGN =
        {
            GENERIC = "I don't know if 'function over form' is really an art style.",
            UNDRAWN = "I'm not an artistry drone, but I guess I could give it a crack...",
        },
        MINISIGN_ITEM = "This is one of the few things I should bother planting.",
		BEE =
		{
			GENERIC = "A drone with a sole purpose.",
			HELD = "Drone mates forever.",
		},
		BEEBOX =
		{
			READY = "A potent box of sweet, gooey, sap. I should start running now.",
			FULLHONEY = "A potent box of sweet, gooey, sap. I should start running now.",
			GENERIC = "I have enslaved the drones.",
			NOHONEY = "If it was me in their position, I'd have gotten a 'motivating' electric shock.",
			SOMEHONEY = "Patience is a virtue. One that I don't have.",
			BURNT = "I've got mixed feelings about that.",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "That's a spore infestation waiting to happen.",
			LOTS = "S'more spores.",
			SOME = "I don't know why I'm wasting my time with this.",
			EMPTY = "It's a log.",
			ROTTEN = "I'm safe from the mushrooms, for now.",
			BURNT = "It's firewood now.",
			SNOWCOVERED = "The cold has stopped them from doing anything.\nNever thought I could find mushrooms relatable.",
		},
		BEEFALO =
		{
			FOLLOWER = "I guess this guy could save me some legwork.",
			GENERIC = "'S a simple creature. Must be nice.",
			NAKED = "Gahh, don't make me feel bad.",
			SLEEPING = "I don't have time for 'sleeping'.",
            --Domesticated states:
            DOMESTICATED = "At least there's no risk of this one taking me out while I'm not looking.",
            ORNERY = "Someone made this one mad.",
            RIDER = "Beefalo riding beats walking. Marginally.",
            PUDGY = "Better than me eating the food, I guess.",
            MYPARTNER = "This one saves me from a lot of walking. Don't you, mate?",
            DEAD = "See ya later, old mate.",
            DEAD_MYPARTNER = "Rest in peace, old bugger.",
		},

		BEEFALOHAT = "I guess this'll keep me warm.",
		BEEFALOWOOL = "'Spose I could use this to stop my servos acting up in the cold.",
		BEEHAT = "Keeps my delicate visage safe from tiny stingers.",
        BEESWAX = "It's sweet, but I guess it isn't sticky.",
		BEEHIVE = "Drone headquarters.",
		BEEMINE = "Weaponised worker rage.",
		BEEMINE_MAXWELL = "Weaponised evil.",--removed
		BERRIES = "Just because my tape deck is shaped like a mouth, doesn't mean I have to use it as one.", --tvquote
		BERRIES_COOKED = "Don't really feel like shoving that into my face.", --tvquote
        BERRIES_JUICY = "Ready to burst and coat my insides with sticky juice.",
        BERRIES_JUICY_COOKED = "I cooked the juice out of them. Still don't wanna be full of mush.",
		BERRYBUSH = --all tvquote'd
		{
			BARREN = "I should leave it unfertilised.",
			WITHERED = "Too hot for it. Not that I really need it.",
			GENERIC = "A bush that grows plenty of mush.",
			PICKED = "At least it's cleared of dangerous mush. For now.",
			DISEASED = "Dun look too healthy.", --removed
			DISEASING = "Guhh, what's that awful smell?", --removed
			BURNING = "Oh no! Anyway...",
		},
		BERRYBUSH_JUICY = --all tvquote'd
		{
			BARREN = "What a shock, it needs fertilising.",
			WITHERED = "I can relate to that, it's a bloody scorcher.",
			GENERIC = "That's a lot of mush to gum up my insides with.",
			PICKED = "Someone was kind enough to get rid of all the dangerous mush.",
			DISEASED = "Dun look too healthy.", --removed
			DISEASING = "Guhh, what's that awful smell?", --removed
			BURNING = "What a shame.",
		},
		BIGFOOT = "This beast is too immense for my optical receptors!",--removed
		BIRDCAGE =
		{
			GENERIC = "Bird research facility.",
			OCCUPIED = "I've got one in there, but I don't really know what to do with it.",
			SLEEPING = "Still has to sleep, even when trapped.",
			HUNGRY = "Gahh! I keep forgetting creatures need to eat food.",
			STARVING = "Just because I don't need to eat, doesn't mean I should torture this guy.",
			DEAD = "Uhm... oops.",
			SKELETON = "I should really have given it food.",
		},
		BIRDTRAP = "I could use this to waste my time catching innocent creatures. I guess.", --WAYPOINT 23/09/22
		CAVE_BANANA_BURNT = "A burnt, mushy stick. Fantastic.",
		BIRD_EGG = "The promise of life. A promise that I really shouldn't eat.",
		BIRD_EGG_COOKED = "Not very promising anymore, but just as dangerous.",
		BISHOP = "H-hey! How about a little drone-to-drone?",
		BLOWDART_FIRE = "Just as long as I stay away from the target, I'll be right.",
		BLOWDART_SLEEP = "Bee venom is known to cause immediate shutdown.",
		BLOWDART_PIPE = "Fighting without putting myself in danger? Sounds pretty good.",
		BLOWDART_YELLOW = "That'll give ya a jolt.",
		BLUEAMULET = "Never was one for jewellery, 'specially not the type that freezes my bolts off.",
		BLUEGEM = "It feels cold, but that's probably just because I'm warm.",
		BLUEPRINT =
		{
            COMMON = "Instructional tapes are more my style.",
            RARE = "Reading is way too much work for me.",
        },
        SKETCH = "...A picture? Why settle for that when I've got movies!",
        COOKINGRECIPECARD =
		{
			GENERIC = "A tape'd be a much more efficient way to store that.",
		},
		BLUE_CAP = "A probably poisonous clump of goop.",
		BLUE_CAP_COOKED = "Cooked poisonous goop is still poisonous goop.",
		BLUE_MUSHROOM =
		{
			GENERIC = "...Where's my tape on foraging?",
			INGROUND = "The sun seems to have scared it off. How relatable, hur hur hur.",
			PICKED = "Probably for the best.",
		},
		BOARDS = "Making these is too much work for me. I'm no saw horse.",
		BONESHARD = "I wonder if I've got this stuff inside me...",
		BONESTEW = "If I wanted to fry all my circuits at once, that'd be the way.",
		BUGNET = "I can catch the wrong kind of bugs.",
		BUSHHAT = "I don't know if I'm 'one with nature' enough for this.",
		BUTTER = "Biology is weird. But this is extra weird.",
		BUTTERFLY =
		{
			GENERIC = "If only I had time to gawk at the local fauna.",
			HELD = "I've successfully pretended to be a human child.",
		},
		BUTTERFLYMUFFIN = "Isn't food supposed to fill you up?",
		BUTTERFLYWINGS = "Murdering the wildlife is a questionable use of time.",
		BUZZARD = "The concept of 'peace and quiet' is news to this loser.",

		SHADOWDIGGER = "Would be nice having a shovel-wielding bodyguard.",
        SHADOWDANCER = "Hur, hur, hur. Look at him go.",

		CACTUS =
		{
			GENERIC = "I don't want those spines in my hands. Or anywhere, to be honest.",
			PICKED = "It's less spiny now, I guess.",
		},
		CACTUS_MEAT_COOKED = "Eating is not my favourite activity. Specially not when there's spikes involved.",
		CACTUS_MEAT = "I think I'll pass, thanks.",
		CACTUS_FLOWER = "If only I had hair to put it in.",

		COLDFIRE =
		{
			EMBERS = "I think... I think I'm supposed to put more wood on it.",
			GENERIC = "It'll keep me from overheating for a little while.",
			HIGH = "Not that I'm a survival expert, but... I don't think that's a good thing.",
			LOW = "It's cool enough for me. I'm no fusspot.",
			NORMAL = "It'll keep my system from overheating for a little while.",
			OUT = "Out like a campfire in the wilderness.",
		},
		CAMPFIRE =
		{
			EMBERS = "I think... I think I'm supposed to put more wood on it.",
			GENERIC = "It'll keep my joints unfrozen for a little while.",
			HIGH = "Not that I'm a survival expert, but... I don't think that's a good thing.",
			LOW = "It's warm enough for me. I'm no fusspot.",
			NORMAL = "It'll keep my joints unfrozen for a little while.",
			OUT = "Out like a campfire in the wilderness.",
		},
		CANE = "I guess it'll help me find people's buried crap faster.", --tvquote
		CATCOON = "More animals. Just so long as it doesn't try to 'play.'",
		CATCOONDEN =
		{
			GENERIC = "We appear to share a hobby in hoarding trinkets.",
			EMPTY = "Its hoarding days are over.",
		},
		CATCOONHAT = "The animal was scalped and turned into a hat. Joyous.",
		COONTAIL = "There's no cat attached.",
		CARROT = "Wouldn't wanna eat this. I'd get too dirty.",
		CARROT_COOKED = "Ah, it's mushy. The worst texture.",
		CARROT_PLANTED = "Just another thing to ignore, unless it's an orange grave marker.",
		CARROT_SEEDS = "Living potential... the potential to waste my time!",
		CARTOGRAPHYDESK =
		{
			GENERIC = "Pen and paper is such a limiting medium.",
			BURNING = "Fire and smoke is even more limiting.",
			BURNT = "Ash and dust is even more limiting.",
		},
		WATERMELON_SEEDS = "Living potential... the potential to waste my time!",
		CAVE_FERN = "It's not tough enough to use as material... so I'm ignoring it.",
		CHARCOAL = "It's leaving marks all over my hands.",
        CHESSPIECE_PAWN = "How poetic.",
        CHESSPIECE_ROOK =
        {
            GENERIC = "The most valuable piece on the board. Or wait, is that...",
            STRUGGLE = "I feel like a wizard is behind this...",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "That looks awfully equine for a 'knight.'",
            STRUGGLE = "I feel like a wizard is behind this...",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "His preachings reacheth not mine ears. Heh.",
            STRUGGLE = "I feel like a wizard is behind this...",
        },
        CHESSPIECE_MUSE = "I don't trust anything with a mask that looks like that.",
        CHESSPIECE_FORMAL = "He's dressed more like an uppity twerp.",
        CHESSPIECE_HORNUCOPIA = "At least this food can't hurt me.",
        CHESSPIECE_PIPE = "I'm not sure if I'd look dapper doing that, or like an idiot.",
        CHESSPIECE_DEERCLOPS = "What an ugly mug.",
        CHESSPIECE_BEARGER = "I could break it with a pick, and pretend that's the real deal.",
        CHESSPIECE_MOOSEGOOSE =
        {
            "Is it a moose, or a goose? In my opinion, it's a rock.", --why is this string formatted like this? lol
        },
        CHESSPIECE_DRAGONFLY = "If I had a castle, this would make a decent gargoyle.",
		CHESSPIECE_MINOTAUR = "Why do we feel the need to document all the things we've murdered?",
        CHESSPIECE_BUTTERFLY = "How quaint.",
        CHESSPIECE_ANCHOR = "Not much difference between this and a real anchor.",
        CHESSPIECE_MOON = "The art of abstract form. Never been much for it.",
        CHESSPIECE_CARRAT = "Animal, vegetable, or mineral?",
        CHESSPIECE_MALBATROSS = "Another horrifying visage.",
        CHESSPIECE_CRABKING = "I don't bow to shellfish.",
        CHESSPIECE_TOADSTOOL = "That one got a faceful of Medusa.",
        CHESSPIECE_STALKER = "A memory.",
        CHESSPIECE_KLAUS = "It's too early for the holidays.",
        CHESSPIECE_BEEQUEEN = "I don't bow to rocks. Or insects.",
        CHESSPIECE_ANTLION = "An immortalised identity crisis.",
        CHESSPIECE_BEEFALO = "...I don't think beefalo are a chess piece.",
		CHESSPIECE_KITCOON = "They probably know chess better than I do.",
		CHESSPIECE_CATCOON = "The scavenger's form.",
        CHESSPIECE_MANRABBIT = "In chess, the rabbit can burrow under enemy lines. Something like that.",
        CHESSPIECE_GUARDIANPHASE3 = "Does it count as a trophy if I made it myself?",
        CHESSPIECE_EYEOFTERROR = "I'd start a staring contest, but I might have an unfair advantage.",
        CHESSPIECE_TWINSOFTERROR = "Eye don't really get the appeal behind this.",
        CHESSPIECE_DAYWALKER = "A granite porcine statue, for where I reside.",
        CHESSPIECE_DAYWALKER2 = "That bastard tried to keep me from my tapes.",
        CHESSPIECE_DEERCLOPS_MUTATED = "What a horrific glass-eyed beast. Glad it's stone now.",
        CHESSPIECE_WARG_MUTATED = "What's wrong with making a statue of something nice?",
        CHESSPIECE_BEARGER_MUTATED = "Destroyer of forests and lives; now just a rock.",
        CHESSPIECE_SHARKBOI = "A statue to flexible allegiances.",
        CHESSPIECE_WORMBOSS = "What I got for digging too deep.",
        CHESSPIECE_YOTS = "Festivities aren't my forte.",

        CHESSJUNK1 = "It's junk, and there's lots of it. Not quite what I'm looking for...",
        CHESSJUNK2 = "I've got junk on the brain.",
        CHESSJUNK3 = "... Nope, those gears are definitely too big.",
		CHESTER = "Hope you don't mind the taste of old plastic, mate.",
		CHESTER_EYEBONE =
		{
			GENERIC = "The keys to my living chest full of junk.",
			WAITING = "Having a snooze, are we?",
		},
		COOKEDMANDRAKE = "Sentient vegetables are somehow less appealing than normal ones.",
		COOKEDMEAT = "This is far beyond 'well done.'",
		COOKEDMONSTERMEAT = "Jeez, and I thought normal meat was horrid enough.",
		COOKEDSMALLMEAT = "At least it's not raw anymore. I guess.",
		COOKPOT =
		{
			COOKING_LONG = "I'm not the most patient drone.",
			COOKING_SHORT = "Come on, come on, come on...",
			DONE = "I hope it won't gum up my insides too much.",
			EMPTY = "An unused vessel is such a waste.",
			BURNT = "If I wasn't preoccupied, I'd see this as a lesson in irony.",
		},
		CORN = "Little poppy sweet things. Good for destroying microelectronics.",
		CORN_COOKED = "Still terrible for microelectronics.",
		CORN_SEEDS = "Living potential... the potential to waste my time!",
        CANARY =
		{
			GENERIC = "Ahh, it's CMYK. Bit too advanced for me.",
			HELD = "I'll find a magenta bird and a cyan bird. Just wait, okay?",
		},
        CANARY_POISONED = "Doesn't look too good. It must not be RGB compatible.",

		CRITTERLAB = "I'm half tempted to curl up and hide away, myself.",
        CRITTER_GLOMLING = "I suppose you could eat all that food I don't need.",
        CRITTER_DRAGONLING = "I've stolen the baby from the nest.",
		CRITTER_LAMB = "I feel less at risk of getting mucus in my joints.",
        CRITTER_PUPPY = "What an adorable little wretch.",
        CRITTER_KITTEN = "Maybe it could help me find some junk.",
        CRITTER_PERDLING = "A thief, just like me. 'Cept we steal different things.",
		CRITTER_LUNARMOTHLING = "I don't see what's wrong with a lantern.",

		CROW =
		{
			GENERIC = "That bird has camera eyes.", --tvheadquote
			HELD = "Just don't spy on me too much, okay?",
		},
		CUTGRASS = "I guess carrying around plants is something I'm gonna have to get used to.",
		CUTREEDS = "As long as they aren't full of insects.",
		CUTSTONE = "I'm not a logistics drone. Why does everything have to be so heavy?",
		DEADLYFEAST = "Even deadlier than regular food.", --unimplemented
		DEER =
		{
			GENERIC = "A fellow creature of terrible eyesight. I think yours is worse, though.",
			ANTLER = "I know how it feels, having to walk around with a great big head like that.",
		},
        DEER_ANTLER = "Couldn't imagine growing one of these every year.",
        DEER_GEMMED = "Being remotelly controlled is a familiar feeling.",
		DEERCLOPS = "...I'm more concerned about my joints getting crushed now.",
		DEERCLOPS_EYEBALL = "Ripped from that horrible thing's skull.",
		EYEBRELLAHAT =	"There's nothing humorous about this.",
		DEPLETED_GRASS =
		{
			GENERIC = "It looks like a decent source of material. Maybe.",
		},
        GOGGLESHAT = "I've never really been much for fashion.",
        DESERTHAT = "Function over form. Just the way I like it.",
        ANTLIONHAT = "Well, isn't this grist to the mill.",
		DEVTOOL = "What an awful stench.",
		DEVTOOL_NODEV = "I might collapse from the smell if I get any closer to it.",
		DIRTPILE = "If I was a janitorial drone, I'd be going off at that.",
		DIVININGROD =
		{
			COLD = "What a terrible signal.", --singleplayer
			GENERIC = "Taping a radio to a stick isn't really an 'invention.'", --singleplayer
			HOT = "Gahh, I can hardly hold it still!", --singleplayer
			WARM = "It's too weak to even recognise.", --singleplayer
			WARMER = "Making some sort of progress.", --singleplayer
		},
		DIVININGRODBASE =
		{
			GENERIC = "What a strange, runic... thing.", --singleplayer
			READY = "Runes definitely aren't my specialty.", --singleplayer
			UNLOCKED = "Well, it's taken my key, and it's not giving it back.", --singleplayer
		},
		DIVININGRODSTART = "I feel a familial connection to this.", --singleplayer
		DRAGONFLY = "Why do I keep putting myself at such risk?!",
		ARMORDRAGONFLY = "Looks like I have to scorch myself to use this. Great.",
		DRAGON_SCALES = "Gahh! Shouldn'ta touched that.",
        DRAGONFLYCHEST =
		{
			GENERIC = "Nice and roomy. Fireproof too!",
            UPGRADED_STACKSIZE = "If I was a logistics drone, I'd be mighty satisfied at that.",
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "Doesn't look too hot.",
			GENERIC = "That's how I feel when I haven't 'entertained' in a while.", --no gems
			NORMAL = "I/O.", --one gem
			HIGH = "And the heat goes on.", --HANDS OF A GOVERNMENT MAN
		},

        HUTCH = "I guess I'm okay with my stuff getting caked with slime. I guess.",
        HUTCH_FISHBOWL =
        {
            GENERIC = "Conversation fish, you destroyed my life.",
            WAITING = "It needs an electric shock so it keeps doing its thing.",
        },
		LAVASPIT =
		{
			HOT = "Gahh! Best not touch that!",
			COOL = "It's just some rock now.",
		},
		LAVA_POND = "I'm not one for swimming. 'Specially not now.",
		LAVAE = "And I thought I was a hothead, hur hur hur.",
		LAVAE_COCOON = "Jeez, that's pretty brutal.",
		LAVAE_PET =
		{
			STARVING = "It's 'starving,' but I don't think it eats 'food.'",
			HUNGRY = "It's hungry. Can't relate.",
			CONTENT = "Chill as a pill.",
			GENERIC = "I guess you're my friend now.",
		},
		LAVAE_EGG =
		{
			GENERIC = "I'm not a rock expert, but this one seems a bit special.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "Rock needs warming up.",
			COMFY = "I don't think this egg can be fried.",
		},
		LAVAE_TOOTH = "I had one of these when I cracked out of my TV-fetus. Just kidding.",

		DRAGONFRUIT = "It's pretty to look at. Not so pretty to eat.",
		DRAGONFRUIT_COOKED = "Cooking fruit seems to make it worse.",
		DRAGONFRUIT_SEEDS = "Living potential... the potential to waste my time!",
		DRAGONPIE = "Squishy fruit stashed inside a pastry is still squishy fruit.",
		DRUMSTICK = "I caught it using a snare, hur hur hur.",
		DRUMSTICK_COOKED = "It was cooked by someone called Tom. And his 2 twin brothers.",
		DUG_BERRYBUSH = "Portable circuit wreckers.",
		DUG_BERRYBUSH_JUICY = "This feels like a dangerous thing for me to carry around.",
		DUG_GRASS = "I should plant it - it'd mean less weight on my back, for one.",
		DUG_MARSH_BUSH = "I have no idea how I got this, but it belongs in the ground.",
		DUG_SAPLING = "Guess I oughta bring out my inner gardening drone.",
		DURIAN = "Out of all the fruits I've seen, this is the worst one yet!",
		DURIAN_COOKED = "Guhh! Why did I do that!",
		DURIAN_SEEDS = "Living potential... the potential to waste my time!",
		EARMUFFSHAT = "This'll keep my speakers from freezing up.",
		EGGPLANT = "At least this vegetable is funny, hur hur hur.",
		EGGPLANT_COOKED = "It's still a vegetable. A starchy one, at that.",
		EGGPLANT_SEEDS = "Living potential... the potential to waste my time!",

		ENDTABLE =
		{
			BURNT = "Depressing.",
			GENERIC = "Someone's been flexing their neo-classicism muscle out in the wilderness.",
			EMPTY = "What's neo-classicism without flowers?",
			WILTED = "Flowers do that, I've noticed.",
			FRESHLIGHT = "Saves my optical sensors some work.",
			OLDLIGHT = "Might need a recharge.", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE =
		{
			BURNING = "Gahh, there goes some useful resources.",
			BURNT = "Fickle, dark, and cracked. Just like me, hur hur hur.",
			CHOPPED = "Such is life.",
			POISON = "Gotta say, this is *not* something I'm mentally prepared for.",
			GENERIC = "That looks like it could be a decent burial site... maybe.",
		},
		ACORN = "I should probly plant it.",
        ACORN_SAPLING = "Too young for someone to have buried something.",
		ACORN_COOKED = "I wasted it by turning it into food.",
		BIRCHNUTDRAKE = "Time to whipper-snipper this whippersnapper.",
		EVERGREEN =
		{
			BURNING = "Gahh, there goes some useful resources.",
			BURNT = "Fickle, dark, and cracked. Just like me, hur hur hur.",
			CHOPPED = "Such is life.",
			GENERIC = "A tree. About what I expected from the wilderness.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "Gahh, there goes some useful resources.",
			BURNT = "Fickle, dark, and cracked. Just like me, hur hur hur.",
			CHOPPED = "Such is life.",
			GENERIC = "I'm no expert, but this tree seems pretty normal.",
		},
		TWIGGYTREE =
		{
			BURNING = "Gahh, there goes some useful resources.",
			BURNT = "Fickle, dark, and cracked. Just like me, hur hur hur.",
			CHOPPED = "Such is life.",
			GENERIC = "Maybe someone jammed their stuff in between the branches.",
			DISEASED = "I hope it doesn't infect me...", --unimplemented
		},
		TWIGGY_NUT_SAPLING = "A little twiggy sap. Something familiar about that.", --WAYPOINT 27/09/2022
        TWIGGY_OLD = "A stiff breeze will knock that over.",
		TWIGGY_NUT = "Give it a few days, and we'll be welcoming another frail twig to the family.",
		EYEPLANT = "If I had fight or flight responses, that thing would be setting them off.",
		INSPECTSELF = "Running self diagnostics. Yep, it's me.",
		FARMPLOT =
		{
			GENERIC = "Something about this feels irrelevant.",
			GROWING = "I don't really need more plants in my life.",
			NEEDSFERTILIZER = "It needs a feed.",
			BURNT = "Oh no, it got burnt.",
		},
		FEATHERHAT = "Now I can fraternise with flying avioids.",
		FEATHER_CROW = "Surely it can't spy on me now.",
		FEATHER_ROBIN = "Another feather in my cap.",
		FEATHER_ROBIN_WINTER = "One less spirit of winter in the world.",
		FEATHER_CANARY = "Guess we couldn't find a magenta bird. Or a cyan one.",
		FEATHERPENCIL = "The decorative feather evades me.",
        COOKBOOK = "A book of timewasters.",
		FEM_PUPPET = "She's stuck.", --single player
		FIREFLIES =
		{
			GENERIC = "How iridescent. Anyway...",
			HELD = "Catching fireflies really brings out my inner glee.",
		},
		FIREHOUND = "A martyr, if you want to be fancy about it.",
		FIREPIT =
		{
			EMBERS = "I think... I think I need to put more fuel on it?",
			GENERIC = "Being able to see definitely is nice.",
			HIGH = "I'm no survival expert, but this seems a bit unsafe..?",
			LOW = "Good enough for me, if I'm honest.",
			NORMAL = "Being able to see definitely is nice.",
			OUT = "It's on standby, ready for use.",
		},
		COLDFIREPIT =
		{
			EMBERS = "I think... I think I need to put more fuel on it?",
			GENERIC = "Staying cool definitely is nice.",
			HIGH = "I'm no survival expert, but this seems a bit unsafe..?",
			LOW = "Good enough for me, if I'm honest.",
			NORMAL = "Staying cool definitely is nice.",
			OUT = "It's on standby, ready for use.",
		},
		FIRESTAFF = "Well, the world's already turning, so how bad could it be?",
		FIRESUPPRESSOR =
		{
			ON = "At least my purpose isn't as mundane as this.",
			OFF = "Having a tactical nap.",
			LOWFUEL = "Needs a top up, I reckon.",
		},

		FISH = "I don't know. It's full of organs and bones and stuff.",
		FISHINGROD = "I'd more be fishing for junk, than fish.",
		FISHSTICKS = "Seafood shaped like funny squares is still seafood.",
		FISHTACOS = "What a vile smell.",
		FISH_COOKED = "Jeez, couldn't even have removed the bones first?",
		FLINT = "Its usefulness outweighs its heaviness. Guess I'll take it.",
		FLOWER =
		{
            GENERIC = "I'm not here to gaze idly at flowers.",
            ROSE = "Really. I'm not here to look at plants!",
        },
        FLOWER_WITHERED = "That's what a lack of sun will do to ya.",
		FLOWERHAT = "I can prance about and generally act like a twerp with this.",
		FLOWER_EVIL = "I don't need an excuse not to touch it.",
		FOLIAGE = "Never was much for salad.",
		FOOTBALLHAT = "That makes me feel better 'bout my flimsy construction.",
        FOSSIL_PIECE = "Not what I was looking for, but not necessarily unwanted.",
        FOSSIL_STALKER =
        {
			GENERIC = "This is testing what little puzzle skills I have.",
			FUNNY = "Hur hur hur. Looks like me in the morning.",
			COMPLETE = "It's so satisfying when everything clicks into place.",
        },
        STALKER = "The old bones have come alive.",
        STALKER_ATRIUM = "Is this my reckoning for all the trespassing I've done?",
        STALKER_MINION = "Oh, yuck, yuck, yuck.",
        THURIBLE = "It's reminding me of things I wanna forget.",
        ATRIUM_OVERGROWTH = "Runes, runes, runes... nah, got no idea.",
		FROG =
		{
			DEAD = "Rest in croak.",
			GENERIC = "This one looks awfully territorial.",
			SLEEPING = "Night night.",
		},
		FROGGLEBUNWICH = "Don't like sandwiches, especially not when they're full of legs.",
		FROGLEGS = "Tiny legs. That's just made my day.",
		FROGLEGS_COOKED = "I'm going to dream of tiny legs tonight.",
		FRUITMEDLEY = "So much sugar and sweet juices. No thanks.",
		FURTUFT = "Silverfox strands.",
		GEARS = "Too big for my needs. Still, might be useful.",
		GHOST = "I'm not really one for cheap spooks.",
		GOLDENAXE = "It's like regular legwork, but fancier.",
		GOLDENPICKAXE = "Hard labour has never been so luxurious.",
		GOLDENPITCHFORK = "What a great fork. And at such a high pitch.",
		GOLDENSHOVEL = "Now I can extract buried garbage in style.",
		GOLDNUGGET = "I might glean a nugget of use from this.",
		GRASS =
		{
			BARREN = "Should probably help it out there.",
			WITHERED = "Too hot for resource production.",
			BURNING = "Thin, strawy stuff makes a lot of fire.",
			GENERIC = "This plant seems more useful than the food ones.",
			PICKED = "Back to square one for that plant.",
			DISEASED = "Dun look too healthy.", --removed
			DISEASING = "Guhh, what's that awful smell?", --removed
		},
		GRASSGEKKO =
		{
			GENERIC = "A resource-making mate.",
			DISEASED = "This dude needs some tending to.", --unimplemented
		},
		GREEN_CAP = "I don't want its shroom fumes intoxicating my sensors.",
		GREEN_CAP_COOKED = "It might make me more in tune with nature. But it probably won't.",
		GREEN_MUSHROOM =
		{
			GENERIC = "How interesting. The wilderness is full of mushrooms.",
			INGROUND = "This one seems to be a late riser.",
			PICKED = "Free from spore infestation.",
		},
		GUNPOWDER = "I've considered quitting my path of destruction.",
		HAMBAT = "Not like I was going to use that meat for much else.",
		HAMMER = "Looks like my path of destruction isn't over yet.",
		HEALINGSALVE = "Must be some kind of body magic.", --tvquote
		HEATROCK =
		{
			FROZEN = "I'd have no need for this if I had proper cooling.",
			COLD = "It's a rock that's slightly cold.",
			GENERIC = "The grooves store the temperature... something-or-other... yeah.",
			WARM = "Feels like it's been left in the sun for a bit.",
			HOT = "Should keep me snug as a bug.",
		},
		HOME = "I don't really feel the urge to settle down.",
		HOMESIGN =
		{
			GENERIC = "Someone scribbled some lines onto it. Doesn't mean anything to me.",
            UNWRITTEN = "It's simply begging to be written on.",
			BURNT = "It says \"CHARCOAL CHARCOAL CHARCOAL CHAR-\"",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "Someone scribbled some lines onto it. Doesn't mean anything to me.",
            UNWRITTEN = "It's simply begging to be written on.",
			BURNT = "It says \"CHARCOAL CHARCOAL CHARCOAL CHAR-\"",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "Someone scribbled some lines onto it. Doesn't mean anything to me.",
            UNWRITTEN = "It's simply begging to be written on.",
			BURNT = "It says \"CHARCOAL CHARCOAL CHARCOAL CHAR-\"",
		},
		HONEY = "Looks like it could render me null and void.",
		HONEYCOMB = "A prison the bees built for themselves.",
		HONEYHAM = "Two sticky things paired together. Not my favourite combination.",
		HONEYNUGGETS = "I should stay as far away from honey as I can.",
		HORN = "A low-budget way of fulfilling my purpose.",
		HOUND = "Enter: the devil, I suppose.",
		HOUNDCORPSE =
		{
			GENERIC = "I overcame it.",
			BURNING = "I overcame it... with fire.",
			REVIVING = "This is not something I've accounted for.",
		},
		HOUNDBONE = "There are dead things everywhere. Nothing new.",
		HOUNDMOUND = "A hovel made of death. Poetic.",
		ICEBOX = "I can refrigerate my collection of effective cyanide.",
		ICEHAT = "I can feel my spine ache just by looking at it.",
		ICEHOUND = "A martyr of the frost variety.",
		INSANITYROCK =
		{
			ACTIVE = "My head is throbbing too much for me to bother reading that.",
			INACTIVE = "Didn't realise ants believed in the afterlife, hur hur hur.",
		},
		JAMMYPRESERVES = "Somehow worse for me than just berries.",

		KABOBS = "... I'm guessing you don't eat the sticks.",
		KILLERBEE =
		{
			GENERIC = "This labour drone has been reprogrammed for combat.",
			HELD = "It's held captive.",
		},
		KNIGHT = "Alright, how about you do your thing, and I can do mine? N-Nice and easy!",
		KOALEFANT_SUMMER = "Looks like it might fight back. I shouldn't bother.",
		KOALEFANT_WINTER = "I don't turn white at wintertime.",
        KOALEFANT_CARCASS = "Well, someone went and killed it. That's of no use to me.",
		KRAMPUS = "This thief is gonna steal my stuff!",
		KRAMPUS_SACK = "All the benefits of an archive, without even settling down!",
		LEIF = "Gahh!! Is this my payback for all the digging??",
		LEIF_SPARSE = "Gahh!! Is this my payback for all the digging??",
		LIGHTER  = "That's smart, carrying one of those around.",
		LIGHTNING_ROD =
		{
			CHARGED = "Don't know if I installed surge protectors.",
			GENERIC = "Better than the sky using *me* to complete a circuit.",
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "What a mean looking rag.",
			CHARGED = "That static will fry a circuit a mile away.",
		},
		LIGHTNINGGOATHORN = "Ripping things from skulls seems to be becoming my specialty.",
		GOATMILK = "Multiple ways to short myself, all in one jar!",
		LITTLE_WALRUS = "What an adorable little wretch.",
		LIVINGLOG = "How's it going?",
		LOG =
		{
			BURNING = "That's a strange way of making a fire.",
			GENERIC = "More goodies to stash in my jacket pockets.",
		},
		LUCY = "Jeez, I hope I don't sound like *that.*",
		LUREPLANT = "Some intrepid thing.",
		LUREPLANTBULB = "I can help it explore the world.",
		MALE_PUPPET = "Looks like this guy is stuck.", --single player

		MANDRAKE_ACTIVE = "You're slowly convincing me to rip out my hearing modules.",
		MANDRAKE_PLANTED = "Probably just some variety of lettuce.",
		MANDRAKE = "Nevermind, lettuce isn't a root. It also doesn't have a face.",

        MANDRAKESOUP = "The benefits of this soup may outweigh the negatives.",
        MANDRAKE_COOKED = "Maybe it is just some root veggie after all.",
        MAPSCROLL = "It looks like someone was *this* close to being productive.",
        MARBLE = "Could maybe be an upgrade to my flimsy shell...",
        MARBLEBEAN = "Definitely a very 'hands-on' way to tell a fairy tale.",
        MARBLEBEAN_SAPLING = "... Checks out.",
        MARBLESHRUB = "I wonder if that'd count as topiary or carving.",
        MARBLEPILLAR = "Some see decoration, I see useful resources.",
        MARBLETREE = "No one speaks for this tree.", --heehoo da lorrix!
        MARSH_BUSH =
        {
			BURNT = "I might get ash in my joints instead of spikes.",
            BURNING = "Bit of an impromptu campfire.",
            GENERIC = "Lots of things to avoid out here.",
            PICKED = "That musta scratched real bad.",
        },
        BURNT_MARSH_BUSH = "I might get ash in my joints instead of spikes.",
        MARSH_PLANT = "I'm not here to do a flora tour.",
        MARSH_TREE =
        {
            BURNING = "Bit of an impromptu campfire.",
            BURNT = "I might get ash in my joints instead of spikes.",
            CHOPPED = "Such is life.",
            GENERIC = "I could chop it so I don't get spiked.",
        },
        MAXWELL = "Funny, I don't recognise him.",--single player
        MAXWELLHEAD = "Now that's showmanship.",--removed
        MAXWELLLIGHT = "I hope it's not watching me.",--single player
        MAXWELLLOCK = "Looks like it wants a key of some kind.",--single player
        MAXWELLTHRONE = "I'd need built in cushions to sit on that.",--single player
        MEAT = "Took a lot of work to get that. Too bad it's not very useful.",
        MEATBALLS = "Meat plus meat is still meat.", --WAYPOINT 11/10/22
        MEATRACK =
        {
            DONE = "This seems like one of the less awful things to eat out here.",
            DRYING = "It's all strung out with nowhere to go.",
            DRYINGINRAIN = "I'm no foodie, but that seems counter-intuitive.",
            GENERIC = "Drying meat might make it more bearable.",
            BURNT = "Hardly a shock. It was just some sticks and rope.",
            DONE_NOTMEAT = "It might be alright. Might.",
            DRYING_NOTMEAT = "It's all strung out with nowhere to go.",
            DRYINGINRAIN_NOTMEAT = "I'm no foodie, but that seems counter-intuitive.",
        },
        MEAT_DRIED = "It looks... okay, but I still hope I don't have to eat it.",
        MERM = "Quite a fishy fella, aren'tcha?",
        MERMHEAD =
        {
            GENERIC = "Well, isn't that just marvelous.",
            BURNT = "And here I thought things couldn't get any better.",
        },
        MERMHOUSE =
        {
            GENERIC = "Sleeping on the ground looks more comfy than that.",
            BURNT = "Don't think charcoal really makes a good mattress.",
        },
        MINERHAT = "Keeps my busy hands free.",
        MONKEY = "It's a hairier, smellier human. Can't say I trust it.",
        MONKEYBARREL = "Well, they clearly don't live alone.", --
        MONSTERLASAGNA = "That's the least subtle way to poison someone I think I've seen.",
        FLOWERSALAD = "Arranging leaves in a fancy pattern doesn't make them tastier.",
        ICECREAM = "Rapid cooling. I guess this food serves some kind of purpose.",
        WATERMELONICLE = "I can put my head in cryogenic stasis.",
        TRAILMIX = "Sticky juices and salty nuts. No thanks.",
        HOTCHILI = "That's one way to suffer some heat damage.",
        GUACAMOLE = "Some kinda... green paste?",
        MONSTERMEAT = "I should throw it away and never look back.",
        MONSTERMEAT_DRIED = "Normal jerky's alright. Dunno about this.",
        MOOSE = "Getting 'disassembled' is not on my to-do list.", --
        MOOSE_NESTING_GROUND = "Those sticks aren't there by accident. I'd bet on it.",
        MOOSEEGG = "I don't trust grey ellipses.",
        MOSSLING = "That's definitely a threat to my productivity.",
        FEATHERFAN = "It's not an electric fan, but it's better than nothing.",
        MINIFAN = "Pff. There are more sophisticated ways to be an entertainer.",
        GOOSE_FEATHER = "Tailoring is definitely not my specialty.",
        STAFF_TORNADO = "I don't know if I'm responsible enough to wield this.",
        MOSQUITO =
        {
            GENERIC = "I may be a thief too, but at least I don't have a schnozz like that.",
            HELD = "I've caught you. I'm not sure why, but I have.",
        },
        MOSQUITOSACK = "Oh good. Someone else's bodily fluids.",
        MOUND = --tvquote'd
        {
            DUG = "Someone really rifled around in there.",
            GENERIC = "Dead to morrow.",
        },
        NIGHTLIGHT = "It'd be a clever use of nightmares, if it wasn't terrifying.",
        NIGHTMAREFUEL = "Ah, the familiar scent of packing peanuts.",
        NIGHTSWORD = "Sharpened trauma.",
        NITRE = "I've got more important things to remember than which rock does what.",
        ONEMANBAND = "To entertain and enthrall.",
        OASISLAKE =
		{
			GENERIC = "Cute little billabong.",
			EMPTY = "I feel a growing urge to go on a hysteria-induced tirade.", --Dunno why this billabong is empty. It's not even hot.
		},
        PANDORASCHEST = "Opening that would be a roll of the dice.",
        PANFLUTE = "It's no video player, but at least it's elegant.",
        PAPYRUS = "Could write a huge instruction booklet onto this.",
        WAXPAPER = "Plastic doesn't exactly rot, so I don't really need it.",
        PENGUIN = "You're dressed like a bit of a twerp, aren't you?",
        PERD = "I wasn't going to eat those berries, anyway. Go for it.",
        PEROGIES = "You can't hide the meat from me by sealing it away into little pouches.",
        PETALS = "Should destroying plants really be my priority?",
        PETALS_EVIL = "Just because they're evil doesn't mean they were past redemption.",
        PHLEGM = "Of all the things to even consider sticking in my gob... why this?",
        PICKAXE = "My back isn't cut out for all this effort.\nIt's enough work carrying my great big head around.",
        PIGGYBACK = "I can carry more stuff... but I'm disturbed for life.",
        PIGHEAD =
        {
            GENERIC = "Couldn't have just talked things out? Settled your differences?",
            BURNT = "How morose.",
        },
        PIGHOUSE =
        {
            FULL = "Someone's home.",
            GENERIC = "If I'm in luck, these pigs might have tapes I can, ehm, borrow.",
            LIGHTSOUT = "I'd ask to borrow a cup of flour, but I don't know if that'll work.",
            BURNT = "Any trace of tapes has been burnt to a crisp. Damn.",
        },
        PIGKING = "He must store all that gold under his fat flaps.",
        PIGMAN =
        {
            DEAD = "Rest in porker.",
            FOLLOWER = "Welcome to the gang, mate.",
            GENERIC = "At least it has the decency to put on a grass skirt.",
            GUARD = "Don't think this guy is up for diplomatics.",
            WEREPIG = "Oh no. Please leave me alone!", --WAYPOINT 31/10/22
        },
        PIGSKIN = "Seems a bit messed up to carry this. And make things with it.",
        PIGTENT = "If I'm in luck, these pigs might have tapes I can, ehm, borrow.", --wtf is a 'pig tent' lmaooo
        PIGTORCH = "Someone has lit a shrine to their idols.",
        PINECONE = "S'pose I should stick it in the ground.",
        PINECONE_SAPLING = "My lumber farm has begun.",
        LUMPY_SAPLING = "A little lumpy sap.",
        PITCHFORK = "Three points and a dream.",
        PLANTMEAT = "Regular meat looks divine compared to this.",
        PLANTMEAT_COOKED = "It's just begging to be thrown out.",
        PLANT_NORMAL =
        {
            GENERIC = "This is not the greatest use of my time.",
            GROWING = "It'll get there someday.",
            READY = "It's finished growing. Not that I really care.",
            WITHERED = "It got a good scorching.",
        },
        POMEGRANATE = "Looks like a warrior's brain.",
        POMEGRANATE_COOKED = "All those little seeds look deadly to me.",
        POMEGRANATE_SEEDS = "Living potential... the potential to waste my time!",
        POND = "If someone's left their secrets down there... I don't think I can get 'em.",
        POOP = "I really don't want that all down the inside of my jacket.", --That's going to get all down the inside of my jacket. Great.
        FERTILIZER = "Guhh. Survival is so grotty.",
        PUMPKIN = "I can proudly say that my head is bigger.",
        PUMPKINCOOKIE = "Someone made this all nice and sweet. Too bad I'm not eating it.",
        PUMPKIN_COOKED = "So mushy, it's practically a liquid.",
        PUMPKIN_LANTERN = "How seasonal.",
        PUMPKIN_SEEDS = "Living potential... the potential to waste my time!",
        PURPLEAMULET = "I don't know if I wanna put my brain through that.",
        PURPLEGEM = "It's vibrating slightly. Nah, must just be my shaky hands.",
        RABBIT =
        {
            GENERIC = "A small, fluffy, wasteland scavenger.",
            HELD = "Please don't scavenge a hole in my pockets.",
        },
        RABBITHOLE =
        {
            GENERIC = "Could be a burial site ... ?",
            SPRING = "Locked off from the outside world.",
        },
        RAINOMETER =
        {
            GENERIC = "What an archaic way of reading the weather.",
            BURNT = "Should have watched the weatherman instead.",
        },
        RAINCOAT = "Ahh, this'll keep me nice and safe.",
        RAINHAT = "Keeps my delicate insides free of moisture.",
        RATATOUILLE = "Nah. Too starchy and vegetable-y for my tastes.",
        RAZOR = "Guhh, shaving sounds so gross.",
        REDGEM = "I can feel it tingling. Hm... I must have knocked my funnybone.",
        RED_CAP = "I'm no analysis drone.",
        RED_CAP_COOKED = "Technically, it's a vegetable, so it gets a no from me.",
        RED_MUSHROOM =
        {
            GENERIC = "A little clump of fungus.",
            INGROUND = "This one has a healthy sleep schedule.",
            PICKED = "Just a gross little hole in the ground now.",
        },
        REEDS =
        {
            BURNING = "Gahh, dammit.",
            GENERIC = "I'm sure I could do something useful with that.",
            PICKED = "It's been mowed down.",
        },
        RELIC = "Makes me wonder if ancient societies had tapes.",
        RUINS_RUBBLE = "Yeah, could knock 'er back up.",
        RUBBLE = "More destroyed stuff.",
        RESEARCHLAB =
        {
            GENERIC = "Hah. So primitive.",
            BURNT = "No problem, I've still got my tapes.",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "I think those are antennas. I can appreciate that.",
            BURNT = "I'll be fine, so long as I can get a signal.",
        },
        RESEARCHLAB3 = --manip
        {
            GENERIC = "I've seen enough glowing triangles for one lifetime.",
            BURNT = "One less glowing triangle in the world.",
        },
        RESEARCHLAB4 = --presti
        {
            GENERIC = "I'm not sure what to think of this, I'll be honest.",
            BURNT = "Guess I'll never get to decide what I thought of it.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "Seems a bit egotistical to make an effigy of yourself.",
            BURNT = "That's what you get for your ego.",
        },
        RESURRECTIONSTONE = "I was never one for runes and bones.",
        ROBIN =
        {
            GENERIC = "These walls have ears. Or eyes.",
            HELD = "Keep your friends close, but your observers closer.",
        },
        ROBIN_WINTER =
        {
            GENERIC = "You may be winter-themed, but I still don't trust you.",
            HELD = "For a spy, it's very soft.",
        },
        ROBOT_PUPPET = "Gahh! I need to lend my robo-mate a hand!", --single player
        ROCK_LIGHT =
        {
            GENERIC = "Lava? I hardly know 'er!",--removed
            OUT = "Lava? I hardly know 'er!",--removed
            LOW = "Lava? I hardly know 'er!",--removed
            NORMAL = "Lava? I hardly know 'er!",--removed
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "Don't know if I wanna subject my back to that.",
            RAISED = "The world is playing jenga. With rocks.",
        },
        ROCK = "Is it composite, meta-whatsit, or I-don't-care-eous?", --tvquote
        PETRIFIED_TREE = "That's not a normal tree thing, is it??",
        ROCK_PETRIFIED_TREE = "That's not a normal tree thing, is it??",
        ROCK_PETRIFIED_TREE_OLD = "That's not a normal tree thing, is it??",
        ROCK_ICE =
        {
            GENERIC = "Frozen.",
            MELTED = "Just a puddle of water I don't plan on splashing.",
        },
        ROCK_ICE_MELTED = "Just a puddle of water I don't plan on splashing.",
        ICE = "This water doesn't wanna run.",
        ROCKS = "I'm not sure if their usefulness outweighs their heaviness.",
        ROOK = "You're mechanical, I'm not. Dunno if we can get along.",
        ROPE = "All the survival guys on tape always talk about this.",
        ROTTENEGG = "Stinks like a --- -----. Oop, censor caught that one.",
        ROYAL_JELLY = "Bee upgrade module. I don't plan on eating it.",
        JELLYBEAN = "As long as they don't explode into sticky juice.",
        SADDLE_BASIC = "Riding will be smelly. But, I won't have to walk...",
        SADDLE_RACE = "Don't think I'll have to walk around myself anymore.",
        SADDLE_WAR = "Doesn't look like the most comfortable ride.",
        SADDLEHORN = "I don't trust a beefalo left alone with its saddle.",
        SALTLICK = "If that salt gets anywhere near me, I'm doomed.",
        BRUSH = "Maybe I'm glad I don't have hair.",
		SANITYROCK =
		{
			ACTIVE = "My sound mind has made it angry.",
			INACTIVE = "My fragile state of mind has scared it off.",
		},
		SAPLING =
		{
			BURNING = "Gahh! I needed those resources!",
			WITHERED = "Should be alright if it takes a chill pill.",
			GENERIC = "A stunted little thing.",
			PICKED = "Maybe if we stopped stripping it of its branches, it'd finish growing.",
			DISEASED = "Dun look too healthy.", --removed
			DISEASING = "Guhh, what's that awful smell?", --removed
		},
   		SCARECROW =
   		{
			GENERIC = "If it's meant to scare off lone drones, it's doing a good job.",
			BURNING = "The strawman tactic is so fickle.",
			BURNT = "No more scaring things off.",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "I'm a scavenger, not an artist.",
			BLOCK = "Is this really the best use of my time?",
			SCULPTURE = "Hmm. Not half bad.",
			BURNT = "Maybe the burnt wheel is an artistic statement.",
   		},
        SCULPTURE_KNIGHTHEAD = "Its head got lopped off.",
		SCULPTURE_KNIGHTBODY =
		{
			COVERED = "S'weird. I didn't know marble could rust.",
			UNCOVERED = "Good thing I didn't keep smashing it.",
			FINISHED = "Feels complete now. Maybe I did something right?",
			READY = "I don't think this is your average statue.",
		},
        SCULPTURE_BISHOPHEAD = "Someone's running around chopping off heads. I hope I'm not next.",
		SCULPTURE_BISHOPBODY =
		{
			COVERED = "Gotta say, I didn't expect to find this kinda thing out here.",
			UNCOVERED = "Looks like someone went at it with an axe. Aside from me, I mean.",
			FINISHED = "That gave me a weird sense of completedness.",
			READY = "I don't think this is your average statue.",
		},
        SCULPTURE_ROOKNOSE = "'S that... a big marble cactus?",
		SCULPTURE_ROOKBODY =
		{
			COVERED = "Feels like it's looking at me from under there.",
			UNCOVERED = "Welcome to reality, mate.",
			FINISHED = "I feel whole again, now.",
			READY = "I don't think this is your average statue.",
		},
        GARGOYLE_HOUND = "Quit giving me the evil eye.",
        GARGOYLE_WEREPIG = "Gotta admire the carving skill there.",
		SEEDS = "Living potential... the potential to waste my time!",
		SEEDS_COOKED = "It's an innocent little snack. Not what I need right now.", --tvquote
		SEWING_KIT = "I'm not looking forward to poking my hands with that tiny needle.",
		SEWING_TAPE = "All we need is some lube, and we can fix anything.",
		SHOVEL = "A useful tool for extracting lost memories.",
		SILK = "Pretty gross. But I think it's useful.",
		SKELETON = "Well, that's not very reassuring.",
		SCORCHED_SKELETON = "If I had any sense, I'd see that as a warning.",
        SKELETON_NOTPLAYER = "That's funny. They're not shaped like me.",
		SKULLCHEST = "An easy way of saying 'I'm emotionally unstable.'", --removed
		SMALLBIRD =
		{
			GENERIC = "It was gifted with life.",
			HUNGRY = "Gahh, I keep forgetting creatures need food.",
			STARVING = "I really oughtta feed it.",
			SLEEPING = "Now's not the time for rest and relaxation.",
		},
		SMALLMEAT = "A tiny sack of gristle and flesh. No thanks.",
		SMALLMEAT_DRIED = "It looks a bit more edible now. A bit.",
		SPAT = "Hur hur hur. Looks like me in the morning.",
		SPEAR = "That'll do more damage than my limp noodle arms.",
		SPEAR_WATHGRITHR = "I'll be the most murderous drone that ever lived.",
		WATHGRITHRHAT = "This'll really keep my stuff safe.",
		SPIDER =
		{
			DEAD = "I squashed it.",
			GENERIC = "A fluffy little sod with eight legs.",
			SLEEPING = "Wouldn't wanna interrupt its beauty sleep.",
		},
		SPIDERDEN = "Wouldn't want to fall in that.",
		SPIDEREGGSACK = "The longer I have these in my pocket, the less safe I feel.",
		SPIDERGLAND = "This goop actually seems like it'll help.",
		SPIDERHAT = "The last thing I wanna do is attract the spiders.",
		SPIDERQUEEN = "Oh, oh no. I'm sorry for killing your children!!",
		SPIDER_WARRIOR =
		{
			DEAD = "Done and dusted.",
			GENERIC = "An angry little sod with eight angry little legs.",
			SLEEPING = "Just keep on sleepin', mate.",
		},
		SPOILED_FOOD = "And here I thought food couldn't possibly get any worse.",
        STAGEHAND =
        {
			AWAKE = "Gahh! I knew I was being watched.",
			HIDING = "A perfectly set table, in the middle of nowhere? Nice try.",
        },
        STATUE_MARBLE =
        {
            GENERIC = "Thought I'd be seeing more trees out here, and less of... this.",
            TYPE1 = "It's okay. It doesn't have a head, so it can't watch me.",
            TYPE2 = "I'd feel guilty if I destroyed that.",
            TYPE3 = "All these statues are confusing me more than anything.", --bird bath type statue
        },
		STATUEHARP = "It's okay. It doesn't have a head, so it can't watch me.",
		STATUEMAXWELL = "Who on earth is that? Looks like a bit of a twerp.",
		STEELWOOL = "If I ever wanted a new paintjob, that'd be how I'd prime myself.",
		STINGER = "Great at poking holes in delicate TV screens.",
		STRAWHAT = "I can look like a farmer type.",
		STUFFEDEGGPLANT = "Putting other food inside a starchy purple sausage doesn't make it any nicer.",
		SWEATERVEST = "Makes me look quite snappy.",
		REFLECTIVEVEST = "I'm not a construction drone.",
		HAWAIIANSHIRT = "Almost makes me wish I could sip down some cold coconut juice.",
		TAFFY = "Don't really know about gumming up my delicate internals.",
		TALLBIRD = "I don't think this bird is a fan of thieves.",
		TALLBIRDEGG = "I stole it from its mum.",
		TALLBIRDEGG_COOKED = "I don't want to eat it. It's full of shell pieces.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "I didn't know eggs had a vibrate function.",
			GENERIC = "It's swaying back and forth. I think that's good?",
			HOT = "Looks a bit redder than usual.",
			LONG = "Might be a bit of a long'un.",
			SHORT = "Here we go, we're almost done.",
		},
		TALLBIRDNEST =
		{
			GENERIC = "It isn't a buried memory, but it might be worth stealing anyway.",
			PICKED = "Robbed.",
		},
		TEENBIRD =
		{
			GENERIC = "It's getting smarter as it gets older. Don't know if I like that.",
			HUNGRY = "I'm doing my best! I keep forgetting that you need food...",
			STARVING = "I feel like I'm being threatened here. Should definitely feed it.",
			SLEEPING = "Night, you sketchy thing.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "That was a lot of hard work! Had better be worth it.", --single player
			GENERIC = "For travelling between worlds? Sounds familiar.", --single player
			LOCKED = "Might have to give up my radio-mate.", --single player
			PARTIAL = "Getting there. Still gotta ways to go.", --single player
		},
		TELEPORTATO_BOX = "It's a box, but there's no tape slot on it.", --single player
		TELEPORTATO_CRANK = "If I knew how to tinker, I'd use it to upgrade my poor old back.", --single player
		TELEPORTATO_POTATO = "Someone had a laugh or two making that.", --single player
		TELEPORTATO_RING = "A big, metal ring is a funny thing to carry around.", --single player
		TELESTAFF = "From one place to another, quick as a flash.",
		TENT =
		{
			GENERIC = "I've never felt the urge to sleep. Curious, that.", --A little place for safe shutdowns. --changing the quote so it makes more sense with insomiac
			BURNT = "Might as well sleep on the forest floor.",
		},
		SIESTAHUT =
		{
			GENERIC = "Nahh. Maybe some other time.", --Cute little shelter for a quick kip. --changing the quote so it makes more sense with insomiac
			BURNT = "Provides about as much shade as a desert.",
		},
		TENTACLE = "Is this what I get for trespassing?",
		TENTACLESPIKE = "Well, isn't that just horrid. Least it'll keep me safe.",
		TENTACLESPOTS = "I don't think my censors will let me describe it.",
		TENTACLE_PILLAR = "I'm not sure if I wanna think about that.",
        TENTACLE_PILLAR_HOLE = "Oh, fantastic. More slimy holes to jump in.",
		TENTACLE_PILLAR_ARM = "Little limbs. Just asking to be chopped.",
		TENTACLE_GARDEN = "I'm not sure if I wanna think about that.",
		TOPHAT = "Doesn't quite match my jacket, but it looks alright.",
		TORCH = "I feel a bit safer now.",
		TRANSISTOR = "Could spare the time for a little bit of tinkering.",
		TRAP = "I can waste my time catching innocent creatures.",
		TRAP_TEETH = "I better watch my step. Wouldn't wanna trap myself.",
		TRAP_TEETH_MAXWELL = "Wouldn't want to stand anywhere near that.", --single player
		TREASURECHEST =
		{
			GENERIC = "I'm more the type to leave things in their proper place. On the ground.",
			BURNT = "Everything inside returned to the floor.",
            UPGRADED_STACKSIZE = "Endless space for plastic junk. How about that?",
		},
		TREASURECHEST_TRAP = "Don't mind if I do, hur hur hur...",
        CHESTUPGRADE_STACKSIZE = "This 'lunar magic' nonsense makes my head ache.", -- Describes the kit upgrade item.
		COLLAPSEDCHEST = "Just a pile of rubble now.",
		SACRED_CHEST =
		{
			GENERIC = "It's whispering to me. My instincts are telling me to ignore it.",
			LOCKED = "Feels like I'm being judged.",
		},
		TREECLUMP = "Wait- hang on! I was trying to go that way!", --removed

		TRINKET_1 = "People hold onto such strange things.", --Melted Marbles
		TRINKET_2 = "If it worked, I could do some 'entertaining,' hur hur hur.", --Fake Kazoo
		TRINKET_3 = "It's stuck, but it's knot my problem.", --Gord's Knot
		TRINKET_4 = "Whoever they made this little statue after must have been really important.", --Gnome
		TRINKET_5 = "Whadda quaint little thing.", --Toy Rocketship
		TRINKET_6 = "Too messed up and fried for me to use.", --Frazzled Wires --common tape reward
		TRINKET_7 = "I don't feel like proving how terrible my eyesight is.", --Ball and Cup
		TRINKET_8 = "If my head gets a hole, I could plug it with this.", --Rubber Bung
		TRINKET_9 = "Someone buried their sewing kit with their memories.", --Mismatched Buttons --tape reward
		TRINKET_10 = "Don't think these'll make eating any less awful.", --Dentures
		TRINKET_11 = "I'd ask him for advice, but I gotta feeling he'd just lie.", --Lying Robot
		TRINKET_12 = "Guhh. Well, isn't that just putrid.", --Dessicated Tentacle
		TRINKET_13 = "Whoever they made this little statue after must have been really important.", --Gnomette
		TRINKET_14 = "A vessel for the least awful human drink.", --Leaky Teacup
		TRINKET_15 = "Gahh! I can't say that!", --Pawn
		TRINKET_16 = "Gahh! I can't say that!", --Pawn
		TRINKET_17 = "If I had any interest in eating, I guess I'd need some cutlery.", --Bent Spork  --tape reward
		TRINKET_18 = "What a nice present this'd make.", --Trojan Horse
		TRINKET_19 = "That looks like a treadmill problem waiting to happen.", --Unbalanced Top
		TRINKET_20 = "Finally... some relief from all this carrying.", --Backscratcher
		TRINKET_21 = "I don't exactly plan on doing any baking.", --Egg Beater
		TRINKET_22 = "What an odd thing to bury with your secrets.", --Frayed Yarn --tape reward
		TRINKET_23 = "If I ever find anything to replace my sneakers, I'm in luck.", --Shoehorn
		TRINKET_24 = "Feels like my chances of surviving just increased by a tiny bit.", --Lucky Cat Jar
		TRINKET_25 = "Smells almost as bad as certain humans.", --Air Unfreshener
		TRINKET_26 = "What is this? I'm already sick of it.", --Potato Cup
		TRINKET_27 = "Could make for a decent impromptu antenna.", --Coat Hanger --tape reward
		TRINKET_28 = "Gonna be honest, I don't know much about chess.", --Rook
        TRINKET_29 = "Gonna be honest, I don't know much about chess.", --Rook
        TRINKET_30 = "Chess is s'posed to promote critical thinking. Maybe it's worth a shot.", --Knight
        TRINKET_31 = "Chess is s'posed to promote critical thinking. Maybe it's worth a shot.", --Knight
        TRINKET_32 = "I'd prefer to gaze into one of my tapes.", --Cubic Zirconia Ball
        TRINKET_33 = "Hmm. I hope it isn't cursed.", --Spider Ring
        TRINKET_34 = "Not sure if this severed hand can really help me.", --Monkey Paw
        TRINKET_35 = "I almost wish I could drink it.", --Empty Elixir
        TRINKET_36 = "Not really designed to fit in a tape deck, sadly.", --Faux fangs
        TRINKET_37 = "Well, s'broken, so it's no good now.", --Broken Stake
        TRINKET_38 = "Looks like their magnification is set to 1x. Not very helpful.", -- Binoculars Griftlands trinket
        TRINKET_39 = "I can protect one of my hands. Hooray.", -- Lone Glove Griftlands trinket
        TRINKET_40 = "Wonder if I could prove to that pig his prices are bogus.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "Yet another foreign goop I don't want inside me.", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "Ah, memories. Not quite the ones I'm looking for, though...", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "Such sweet childhood innocence.", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "Maybe it can be my tinkering buddy, back at base.", -- Broken Terrarium ONI trinket
        TRINKET_45 = "Ahh, a fellow entertainment module! Hello?!", -- Odd Radio ONI trinket
        TRINKET_46 = "The heat from that would ruin my precious rolls of magnetic tape.", -- Hairdryer ONI trinket

        -- The numbers align with the trinket numbers above.
        LOST_TOY_1  = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_2  = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_7  = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_10 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_11 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_14 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_18 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_19 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_42 = "Aha, someone's lost memory! Dunno if I can really steal this one...",
        LOST_TOY_43 = "Aha, someone's lost memory! Dunno if I can really steal this one...",

        HALLOWEENCANDY_1 = "Sticky and sweet. Nooo thanks.",
        HALLOWEENCANDY_2 = "How horrible. I'm still not going to eat it.",
        HALLOWEENCANDY_3 = "This isn't even candy. Still not gonna touch it.",
        HALLOWEENCANDY_4 = "The only thing worse than sticky things is wriggly things.",
        HALLOWEENCANDY_5 = "At least I don't have teeth to rot.",
        HALLOWEENCANDY_6 = "I can barely stomach looking at it. Guhh.",
        HALLOWEENCANDY_7 = "This feels sinister, even for candy.", --raisins
        HALLOWEENCANDY_8 = "Don't know if I really want this gumming up my tape slot.",
        HALLOWEENCANDY_9 = "Does all candy have to be sweet?",
        HALLOWEENCANDY_10 = "Don't know if I really want this gumming up my tape slot.",
        HALLOWEENCANDY_11 = "Guhh, that's horrible.",
        HALLOWEENCANDY_12 = "The only thing worse than sticky things is wriggly things.", --ONI meal lice candy
        HALLOWEENCANDY_13 = "Guarantee it'd taste horrid. Don't even need to try it.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "This awful stuff is hardly the spice of life.", --Hot Lava pepper candy
        CANDYBAG = "I could use it to easily dispose of all this candy.", --WAYPOINT 31/10/2022

		HALLOWEEN_ORNAMENT_1 = "It's so spooky, I'm white as a sheet.", --ghost
		HALLOWEEN_ORNAMENT_2 = "Now I can decorate my base with flying rats.", --batilisk
		HALLOWEEN_ORNAMENT_3 = "I guess decoration can be kinda fun, heh.", --wood?
		HALLOWEEN_ORNAMENT_4 = "Gah! Don't touch those little spikes.", --tentacle
		HALLOWEEN_ORNAMENT_5 = "As long as it doesn't cover the tree in tiny webs.", --spider
		HALLOWEEN_ORNAMENT_6 = "Bit worried it'll swoop me, to be honest.", --crow

		HALLOWEENPOTION_DRINKS_WEAK = "A little swig of magic juice.",
		HALLOWEENPOTION_DRINKS_POTENT = "I feel like a master brewer now, hur hur.",
        HALLOWEENPOTION_BRAVERY = "It'll cure my wimpiness. On the mental side, anyway.",
		HALLOWEENPOTION_MOON = "Brings upon the mutant nights.",
		HALLOWEENPOTION_FIRE_FX = "A little fancy fireworks show.",
		MADSCIENCE_LAB = "Dunno if I have an 'inner mad scientist.' Guess I'll find out.",
		LIVINGTREE_ROOT = "'S the most evil-looking terrarium I've ever seen.",
		LIVINGTREE_SAPLING = "Welcome to the world, disturbing little tree.",

        DRAGONHEADHAT = "Might be nice to entertain in a different way.",
        DRAGONBODYHAT = "Might be nice to entertain in a different way.",
        DRAGONTAILHAT = "Might be nice to entertain in a different way.",
        PERDSHRINE =
        {
            GENERIC = "A shrine to thieves. Not me though, I don't think.",
            EMPTY = "It wants some kinda plant.",
            BURNT = "So long, shrine to thieves.",
        },
        REDLANTERN = "Keeps me outta the dark, and looks right fancy doing it.",
        LUCKY_GOLDNUGGET = "A little nugget of luck. Good for me.",
        FIRECRACKERS = "Everyone likes a little pyrotechnics.",
        PERDFAN = "Can fan all my troubles away.",
        REDPOUCH = "I'd feel like rubbish tearing open this nice little pouch.",
        WARGSHRINE =
        {
            GENERIC = "A shrine to devious clay dogs.",
            EMPTY = "It wants a cheeky little light source.",
            BURNING = "A shrine to devious clay dogs.", --for willow to override
            BURNT = "Ah. Maybe sticking a torch in it wasn't the best idea.",
        },
        CLAYWARG =
        {
        	GENERIC = "Gahh! I reckon it's time to engage 'run for my life' mode!",
        	STATUE = "Never had good experiences with random statues in the wild.",
        },
        CLAYHOUND =
        {
        	GENERIC = "Gotta run, gotta run!",
        	STATUE = "Not gonna lie, I really don't trust this.",
        },
        HOUNDWHISTLE = "I'm used to lots of high pitched whining.",
        CHESSPIECE_CLAYHOUND = "Can remind myself of that terrifying experience.",
        CHESSPIECE_CLAYWARG = "A tribute to my trauma.",

		PIGSHRINE =
		{
            GENERIC = "I can use it to build some swine-themed merchandise.",
            EMPTY = "Finally, something to use all that meat for.",
            BURNT = "No more porcine shrine.",
		},
		PIG_TOKEN = "Dunno if a belt really fits my look. Plus it smells like pork.",
		PIG_COIN = "Not bad. I definitely need some decent bodyguards.",
		YOTP_FOOD1 = "It almost looks edible. Almost.",
		YOTP_FOOD2 = "Yeah, nah. Looks like pig slop.",
		YOTP_FOOD3 = "Calling it 'food' is being a bit too generous.",

		PIGELITE1 = "Jeez. You're a couple of sizes up, aren't you?", --BLUE
		PIGELITE2 = "I have the proportions of a stick in comparison.", --RED
		PIGELITE3 = "Those trotters look like pretty good weapons.", --WHITE
		PIGELITE4 = "A green, lean fighting machine.\nActually, I dunno about 'lean.'", --GREEN

		PIGELITEFIGHTER1 = "Jeez. You're a couple of sizes up, aren't you?", --BLUE
		PIGELITEFIGHTER2 = "I have the proportions of a stick in comparison.", --RED
		PIGELITEFIGHTER3 = "Those trotters look like pretty good weapons.", --WHITE
		PIGELITEFIGHTER4 = "A green, lean fighting machine.\nActually, I dunno about 'lean.'", --GREEN

		CARRAT_GHOSTRACER = "Knew I was being stalked...",

        YOTC_CARRAT_RACE_START = "The jog starts here.",
        YOTC_CARRAT_RACE_CHECKPOINT = "Gotta go here, and then there...",
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "The carrots finish up here.",
            BURNT = "Gah. Was kinda looking forward to it.",
            I_WON = "Victory for the TV squad!",
            SOMEONE_ELSE_WON = "And {winner} takes it all.",
        },

		YOTC_CARRAT_RACE_START_ITEM = "I wish setting up a racecourse wasn't so much effort.",
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "Guhh... more manual labour...",
		YOTC_CARRAT_RACE_FINISH_ITEM = "Surely that's the last of it.",

		YOTC_SEEDPACKET = "At least these seeds could be entertaining.",
		YOTC_SEEDPACKET_RARE = "More entertaining than most seeds.",

		MINIBOATLANTERN = "Isn't that quaint.",

        YOTC_CARRATSHRINE =
        {
            GENERIC = "Time to get crafty, carrot style.",
            EMPTY = "Don't mind food sacrifices. Not like I was going to eat it.",
            BURNT = "Well, guess that's that.",
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "Important to have some direction.",
            RAT = "I'm almost jealous of this rat's physical skill.",
            BURNT = "Damnit.",
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "Important to be able to zoom.",
            RAT = "Jeez. That looks like a lotta hard work.",
            BURNT = "Blast it.",
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "Pretty good to have quick reaction times.",
            RAT = "Never was much for reacting.",
            BURNT = "Sod it.",
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "Strength is key. Not that I'd know.",
            RAT = "The rat is probably stronger than I am.",
            BURNT = "Crud it.",
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "Time for a training montage.",
        YOTC_CARRAT_GYM_SPEED_ITEM = "This one makes me feel a bit rocky.", --hehehehrehreyeher
        YOTC_CARRAT_GYM_STAMINA_ITEM = "Time for a training montage.",
        YOTC_CARRAT_GYM_REACTION_ITEM = "This one makes me feel a bit rocky.",

        YOTC_CARRAT_SCALE_ITEM = "Seems a bit harsh. It's just a vegetable.",
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "We're really scrutinising these poor carrots, are we?",
            CARRAT = "Well, that's vegetables for ya.",
            CARRAT_GOOD = "A useful veggie? I'll be darned.",
            BURNT = "Darn it.",
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "A shrine to the furry, smelly, gods.",
            EMPTY = "Sacrifices seem to be becoming regular around here.",
            BURNT = "No more sacrifices.",
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "Need a lazy beef to style.",
            OCCUPIED = "Not the prettiest creatures by default, are they?",
            BURNT = "Maybe I shouldn't bother with this.",
        },
        BEEFALO_GROOMER_ITEM = "Seeing as I don't have hair, I dunno anything about grooming.",

        YOTR_RABBITSHRINE =
        {
            GENERIC = "An ode to the love of carrots. Can't relate.",
            EMPTY = "Rabbits eat carrots, right?",
            BURNT = "Well, so much for that.",
        },

        NIGHTCAPHAT = "Another strange ritual I don't understand.",

        YOTR_FOOD1 = "Well. Isn't that just rancid.",
        YOTR_FOOD2 = "If I ever wanted to sabotage a delicately crafted machine, that'd be the way.",
        YOTR_FOOD3 = "Is that jelly? I pass by default.",
        YOTR_FOOD4 = "I bet they're full of rabbit hair.",

        YOTR_TOKEN = "Holding onto this is gonna give me the shakes.",

        COZY_BUNNYMAN = "Looks readier for bed than I've ever been.",

        HANDPILLOW_BEEFALOWOOL = "A weapon for pillow-to-pillow combat.", --3
        HANDPILLOW_KELP = "Smelly, salty, sea pillow.", --2
        HANDPILLOW_PETALS = "I honestly don't think this'll do a lot. Even against pillows.", --1
        HANDPILLOW_STEELWOOL = "This seems like an extreme weapon... for a pillowfight.", --4 (toughest)

        BODYPILLOW_BEEFALOWOOL = "Armour for pillow-to-pillow combat.",
        BODYPILLOW_KELP = "Smelly, salty, sea armour.",
        BODYPILLOW_PETALS = "I honestly don't think this'll help. Even against pillows.",
        BODYPILLOW_STEELWOOL = "Even though it's only a pillowfight... better safe than sorry.",

		BISHOP_CHARGE_HIT = "Gahh!!",
		TRUNKVEST_SUMMER = "A bit of an upgrade to my jacket.",
		TRUNKVEST_WINTER = "I've only just realised how thin my jacket really is.",
		TRUNK_COOKED = "Meat marbled with mucus? Ahh, I'll be right.",
		TRUNK_SUMMER = "It's warm, thick, and light. Just like summer.",
		TRUNK_WINTER = "It's toasty warm, and heavy. Just like winter.",
		TUMBLEWEED = "I'm a bit more methodical in my thievery.", --Just going where the wind takes it.
		TURKEYDINNER = "People put so much effort into making food look nice.",
		TWIGS = "Jeez. They're less twiggy than I am.",
		UMBRELLA = "Keeps that awful stuff out of my delicate inner workings.",
		GRASS_UMBRELLA = "Dunno if I really trust grass to keep me safe.",
		UNIMPLEMENTED = "I really feel like I shouldn't touch this thing.",
		WAFFLES = "Syrup, eggs, and cream. A deadly combination.",
		WALL_HAY =
		{
			GENERIC = "I shouldn't expect a needle.", --Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? Did you expect a needle? 
			BURNT = "Not shocked that happened.",
		},
		WALL_HAY_ITEM = "I don't have time for making a safe haven.",
		WALL_STONE = "This wall can take the brunt, instead of me.",
		WALL_STONE_ITEM = "I can knock up a little sanctuary.",
		WALL_RUINS = "Could wall myself in, and never leave... sounds alright.",
		WALL_RUINS_ITEM = "Feels wrong to be using historical artifacts as a wall.",
		WALL_WOOD =
		{
			GENERIC = "At least I can trust this more than grass.",
			BURNT = "Well, that's not very surprising.",
		},
		WALL_WOOD_ITEM = "Some pocket pickets.",
		WALL_MOONROCK = "Bit too futuristic for my tastes.",
		WALL_MOONROCK_ITEM = "I'm gonna do my back in with all this...",
        WALL_DREADSTONE = "That's certainly a use of resources.",
		WALL_DREADSTONE_ITEM = "I don't know if walls are really my priority right now.",
        WALL_SCRAP = "Why am I constantly surrounded by garbage ...?",
        WALL_SCRAP_ITEM = "Pocket rubbish. What a familiar thing.",
		FENCE = "Keeps things in, but doesn't really keep them out.",
        FENCE_ITEM = "I've got stuff to go dig up. Don't really care for fencing.",
        FENCE_GATE = "I've spent a lot of time behind closed security doors.",
        FENCE_GATE_ITEM = "I've got stuff to go dig up. Don't really care for gating.",
		WALRUS = "Shooting things from far away? You're more of a wimp than me!",
		WALRUSHAT = "Never been much for hats, but I don't mind this one.",
		WALRUS_CAMP =
		{
			EMPTY = "Gives me that eerie feeling that someone used to be here.",
			GENERIC = "That wasn't there before, was it?",
		},
		WALRUS_TUSK = "Wrenched from that weird old guy's face.",
		WARDROBE = --tvquote
		{
			GENERIC = "Don't look in the closet.",
            BURNING = "I got a message for you. Don't go in the closet.",
			BURNT = "Can't look in the closet.",
		},
		WARG = "Gahh!! I hope this isn't the tape patrol!",
        WARGLET = "I'm sorry for digging up all those tapes!!",

		WASPHIVE = "Those drones are in 'attack mode'.",
		WATERBALLOON = "Gah! Get it away from me!",
		WATERMELON = "It's full of enough juice to completely wipe me out.",
		WATERMELON_COOKED = "Cooked a bit, but it's still full of juice.",
		WATERMELONHAT = "Gah, this seems like a terrible idea.",
        WAXWELLJOURNAL =
		{
			GENERIC = "Everyone acts like this book is so important. Why?",
			NEEDSFUEL = "only_used_by_waxwell",
		},
		WETGOOP = "Finally, food that doesn't taste like food.", --FINALLY,                                                       CENTER TEXT
        WHIP = "I can let out my inner patrol bot.",
		WINTERHAT = "Should keep me toasty warm.",
		WINTEROMETER =
		{
			GENERIC = "I'd rather put on my good old friend, 'News Anchor.'",
			BURNT = "It didn't make the cut.",
		},

        WINTER_TREE =
        {
            BURNT = "Winter's Feast is no more.",
            BURNING = "Maybe putting candles on it wasn't the greatest idea.",
            CANDECORATE = "Strange how we're supposed to bury our memories under it.",
            YOUNG = "Time to see if 'festivities' are worth all the fuss.",
        },
		WINTER_TREESTAND =
		{
			GENERIC = "The ground would do a good enough job of that.",
            BURNT = "Winter's Feast is no more.",
		},
        WINTER_ORNAMENT = "The tree is useless without it's trinkets and baubles.", --it's a mith to me what this is in reference to
        WINTER_ORNAMENTLIGHT = "Electricity plus a tree. Seems safe.",
        WINTER_ORNAMENTBOSS = "A cute, tiny, bit of proof that we murdered something.",
		WINTER_ORNAMENTFORGE = "Smells lightly 'a charcoal.",
		WINTER_ORNAMENTGORGE = "I don't recognise what that is.",

        WINTER_FOOD1 = "Why is it a gingerbread man, and not a gingerbread entertainment drone?", --gingerbread cookie
        WINTER_FOOD2 = "I'm shuddering at the thought of sugar inside me.", --sugar cookie
        WINTER_FOOD3 = "Gahh, why does everything have to be so sticky??", --candy cane
        WINTER_FOOD4 = "This seems just as awful as any other food. Dunno what the fuss is about.", --fruitcake
        WINTER_FOOD5 = "I'm not feeling the loga-rhythms on this one.", --yule log cake
        WINTER_FOOD6 = "If I eat this, I'm worried I'll plump up.", --plum pudding
        WINTER_FOOD7 = "Sticky fruit fulla sticky juice. Good, good.", --apple cider
        WINTER_FOOD8 = "This one seems almost bearable. Maybe I could give it a sip...", --hot cocoa
        WINTER_FOOD9 = "It has raw egg in it. That's bloody foul.", --eggnog

		WINTERSFEASTOVEN =
		{
			GENERIC = "I really don't need to spend my time making more food.",
			COOKING = "Why can't we make a tape-themed meal for me?",
			ALMOST_DONE_COOKING = "Almost done. Not that it really affects me.",
			DISH_READY = "Ready to be consumed.",
		},
		BERRYSAUCE = "I dunno how we made berries even stickier, but here we are.",
		BIBINGKA = "You're telling me that's actual rice? Yeah, sure.",
		CABBAGEROLLS = "Don't know how anyone can stomach cabbage.",
		FESTIVEFISH = "Bit too scaly for me.",
		GRAVY = "Needs a dollop of tomato sauce. For sweetness, and that extra tang.", --21st of december
		LATKES = "Crispy textures are somewhat bearable, I'll give it that.",
		LUTEFISK = "Aren't you supposed to cook food before you eat it?",
		MULLEDDRINK = "'Mulled' just about describes my mood right now.",
		PANETTONE = "I'm panne-tone deaf when it comes to food.",
		PAVLOVA = "Sweet and gooey. My worst nightmare.", --I feel a kinship with this food, but that doesn't make it less sticky.
		PICKLEDHERRING = "Yuck. Barely looks prepared.",
		POLISHCOOKIE = "What a two-faced cookie.",
		PUMPKINPIE = "We somehow made pumpkins sweet, sticky, and nasty.",
		ROASTTURKEY = "...You guys know we made this stuff out of rubbish, right?",
		STUFFING = "It's not even stuffed into anything.",
		SWEETPOTATO = "Probably the worst way to cook potato I've ever heard of.",
		TAMALES = "Stuffing meat into something else doesn't make it not meat.",
		TOURTIERE = "Any meat is too much meat. But this is a lot.",

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "Fancy furnishings doesn't make food any less awful.",
			HAS_FOOD = "...Do I have to?",
			WRONG_TYPE = "Not the correct time of year. Thankfully.",
			BURNT = "What a shame...",
		},

		GINGERBREADWARG = "Sweet things. I never trusted 'em.",
		GINGERBREADHOUSE = "Definitely better for looking at than eating.",
		GINGERBREADPIG = "Can't say I really trust gingerbread.",
		CRUMBS = "Poor thing's falling apart.",
		WINTERSFEASTFUEL = "Yuck, it's the holiday spirit.",

        KLAUS = "Oh no, oh no. More things that want to kill me!!",
        KLAUS_SACK = "My inner thief is tingling with excitement.",
		KLAUSSACKKEY = "Looks like a key, I reckon.",
		WORMHOLE =
		{
			GENERIC = "Huh. I wonder what that thing is.",
			OPEN = "Dunno if jumping into a slimy hole fulla teeth is a good idea.",
		},
		WORMHOLE_LIMITED = "Didn't think I could feel sorry for a thing like that.",
		ACCOMPLISHMENT_SHRINE = "I'm not really one ta brag.", --single player
		LIVINGTREE = "Was wonderin' where that eerie feeling of being watched is coming from.",
		ICESTAFF = "If someone ever chases me up for stealing their stuff, this could save me.",
		REVIVER = "Well, isn't that downright horrid.",
		SHADOWHEART = "Gah, what a sinister thing.",
        ATRIUM_RUBBLE =
        {
			LINE_1 = "Buncha idiots didn't figure out agriculture, by the looks of it.",
			LINE_2 = "Looks to me like someone scraped that one off.",
			LINE_3 = "The larrikin who did this one used too much ink.",
			LINE_4 = "Gahh! Well, isn't that disgusting.",
			LINE_5 = "Looks fancy. Wouldn't mind living there, instead of this wasteland.",
		},
        ATRIUM_STATUE = "Dunno what material this is made of, but it's bloody creepy.",
        ATRIUM_LIGHT =
        {
			ON = "Being able to see is nice. Even if it's by a nightmare like this.",
			OFF = "Must be a light switch somewhere round here.",
		},
        ATRIUM_GATE =
        {
			ON = "Feels like it's kinda pulling me in...",
			OFF = "Not gonna lie... I'm not sure if I should be here for this.",
			CHARGING = "This thing is changing, somehow.",
			DESTABILIZING = "Uh oh. Maybe I should start running?",
			COOLDOWN = "Needs a beauty sleep after that.",
        },
        ATRIUM_KEY = "This thing seems important. Not sure if I should be touching it.",
		LIFEINJECTOR = "Could use this to poke at my insides, and fix em up.",
		SKELETON_PLAYER =
		{
			MALE = "%s got his stuff messed up by %s.",
			FEMALE = "%s got her stuff messed up by %s.",
			ROBOT = "%s got their stuff messed up by %s.",
			DEFAULT = "%s got their stuff messed up by %s.",
		},
		HUMANMEAT = "It's not like I need to eat it. Why am I carrying it around?",
		HUMANMEAT_COOKED = "Whoever cooked this'd better not be planning to eat it...",
		HUMANMEAT_DRIED = "Dried. Still not going to touch it. Or think about it.",
		ROCK_MOON = "I should watch my back for killer robots.", --a grand day out :)
		MOONROCKNUGGET = "I should be wary of rogue microwave ovens.",
		MOONROCKCRATER = "Dunno if a rock can really have a 'lens.'",
		MOONROCKSEED = "It's whispering to me, telling me to leave this place.",

        REDMOONEYE = "I can feel it watching me from far away. Can't say I like that.",
        PURPLEMOONEYE = "Not the biggest fan of this thing staring at me.",
        GREENMOONEYE = "Don't judge me! I'm just a poor tape thief.",
        ORANGEMOONEYE = "This one has lazy eye.",
        YELLOWMOONEYE = "A shining star to light the way. Keeps looking at me, though.",
        BLUEMOONEYE = "I'm gonna keep digging up old stuff, and hope nothing bad happens.",

        --Arena Event --gonna ignore forge and gorge for now, since there's no compatibility
        LAVAARENA_BOARLORD = "That's the guy in charge here.",
        BOARRIOR = "You sure are big!",
        BOARON = "I can take him!",
        PEGHOOK = "That spit is corrosive!",
        TRAILS = "He's got a strong arm on him.",
        TURTILLUS = "Its shell is so spiky!",
        SNAPPER = "This one's got bite.",
		RHINODRILL = "He's got a nose for this kind of work.",
		BEETLETAUR = "I can smell him from here!",

        LAVAARENA_PORTAL =
        {
            ON = "I'll just be going now.",
            GENERIC = "That's how we got here. Hopefully how we get back, too.",
        },
        LAVAARENA_KEYHOLE = "It needs a key.",
		LAVAARENA_KEYHOLE_FULL = "That should do it.",
        LAVAARENA_BATTLESTANDARD = "Everyone, break the Battle Standard!",
        LAVAARENA_SPAWNER = "This is where those enemies are coming from.",

        HEALINGSTAFF = "It conducts regenerative energy.",
        FIREBALLSTAFF = "It calls a meteor from above.",
        HAMMER_MJOLNIR = "It's a heavy hammer for hitting things.",
        SPEAR_GUNGNIR = "I could do a quick charge with that.",
        BLOWDART_LAVA = "That's a weapon I could use from range.",
        BLOWDART_LAVA2 = "It uses a strong blast of air to propel a projectile.",
        LAVAARENA_LUCY = "That weapon's for throwing.",
        WEBBER_SPIDER_MINION = "I guess they're fighting for us.",
        BOOK_FOSSIL = "This'll keep those monsters held for a little while.",
		LAVAARENA_BERNIE = "He might make a good distraction for us.",
		SPEAR_LANCE = "It gets to the point.",
		BOOK_ELEMENTAL = "I can't make out the text.",
		LAVAARENA_ELEMENTAL = "It's a rock monster!",

   		LAVAARENA_ARMORLIGHT = "Light, but not very durable.",
		LAVAARENA_ARMORLIGHTSPEED = "Lightweight and designed for mobility.",
		LAVAARENA_ARMORMEDIUM = "It offers a decent amount of protection.",
		LAVAARENA_ARMORMEDIUMDAMAGER = "That could help me hit a little harder.",
		LAVAARENA_ARMORMEDIUMRECHARGER = "I'd have energy for a few more stunts wearing that.",
		LAVAARENA_ARMORHEAVY = "That's as good as it gets.",
		LAVAARENA_ARMOREXTRAHEAVY = "This armor has been petrified for maximum protection.",

		LAVAARENA_FEATHERCROWNHAT = "Those fluffy feathers make me want to run!",
        LAVAARENA_HEALINGFLOWERHAT = "The blossom interacts well with healing magic.",
        LAVAARENA_LIGHTDAMAGERHAT = "My strikes would hurt a little more wearing that.",
        LAVAARENA_STRONGDAMAGERHAT = "It looks like it packs a wallop.",
        LAVAARENA_TIARAFLOWERPETALSHAT = "Looks like it amplifies healing expertise.",
        LAVAARENA_EYECIRCLETHAT = "It has a gaze full of science.",
        LAVAARENA_RECHARGERHAT = "Those crystals will quicken my abilities.",
        LAVAARENA_HEALINGGARLANDHAT = "This garland will restore a bit of my vitality.",
        LAVAARENA_CROWNDAMAGERHAT = "That could cause some major destruction.",

		LAVAARENA_ARMOR_HP = "That should keep me safe.",

		LAVAARENA_FIREBOMB = "It smells like brimstone.",
		LAVAARENA_HEAVYBLADE = "A sharp looking instrument.",

        --Quagmire
        QUAGMIRE_ALTAR =
        {
        	GENERIC = "We'd better start cooking some offerings.",
        	FULL = "It's in the process of digestinating.",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "It's an old statue.",
		QUAGMIRE_PARK_FOUNTAIN = "Been a long time since it was hooked up to water.",

        QUAGMIRE_HOE = "It's a farming instrument.",

        QUAGMIRE_TURNIP = "It's a raw turnip.",
        QUAGMIRE_TURNIP_COOKED = "Cooking is science in practice.",
        QUAGMIRE_TURNIP_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_GARLIC = "The number one breath enhancer.",
        QUAGMIRE_GARLIC_COOKED = "Perfectly browned.",
        QUAGMIRE_GARLIC_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_ONION = "Looks crunchy.",
        QUAGMIRE_ONION_COOKED = "A successful chemical reaction.",
        QUAGMIRE_ONION_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_POTATO = "The apples of the earth.",
        QUAGMIRE_POTATO_COOKED = "A successful temperature experiment.",
        QUAGMIRE_POTATO_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_TOMATO = "It's red because it's full of science.",
        QUAGMIRE_TOMATO_COOKED = "Cooking's easy if you understand chemistry.",
        QUAGMIRE_TOMATO_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_FLOUR = "Ready for baking.",
        QUAGMIRE_WHEAT = "It looks a bit grainy.",
        QUAGMIRE_WHEAT_SEEDS = "Living potential... the potential to waste my time!",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "Living potential... the potential to waste my time!",

        QUAGMIRE_ROTTEN_CROP = "I don't think the altar will want that.",

		QUAGMIRE_SALMON = "Mm, fresh fish.",
		QUAGMIRE_SALMON_COOKED = "Ready for the dinner table.",
		QUAGMIRE_CRABMEAT = "No imitations here.",
		QUAGMIRE_CRABMEAT_COOKED = "I can put a meal together in a pinch.",
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "It's full of delicious, delicious sap.",
			STUMP = "Where'd the tree go? I'm stumped.",
			TAPPED_EMPTY = "Here sappy, sappy, sap.",
			TAPPED_READY = "Sweet golden sap.",
			TAPPED_BUGS = "That's how you get ants.",
			WOUNDED = "It looks ill.",
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "It reminds me of those tentacle monsters.",
			PICKED = "I can't get anymore out of that shrub.",
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "I could grind it up to make a spice.",
		QUAGMIRE_SPOTSPICE_GROUND = "Flavorful.",
		QUAGMIRE_SAPBUCKET = "We can use it to gather sap from the trees.",
		QUAGMIRE_SAP = "It tastes sweet.",
		QUAGMIRE_SALT_RACK =
		{
			READY = "Salt has gathered on the rope.",
			GENERIC = "Science takes time.",
		},

		QUAGMIRE_POND_SALT = "A little salty spring.",
		QUAGMIRE_SALT_RACK_ITEM = "For harvesting salt from the pond.",

		QUAGMIRE_SAFE =
		{
			GENERIC = "It's a safe. For keeping things safe.",
			LOCKED = "It won't open without the key.",
		},

		QUAGMIRE_KEY = "Safe bet this'll come in handy.",
		QUAGMIRE_KEY_PARK = "I'll park it in my pocket until I get to the park.",
        QUAGMIRE_PORTAL_KEY = "This looks science-y.",


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "Are those mushrooms? I'm stumped.",
			PICKED = "I don't think it's growing back.",
		},
		QUAGMIRE_MUSHROOMS = "These are edible mushrooms.",
        QUAGMIRE_MEALINGSTONE = "The daily grind.",
		QUAGMIRE_PEBBLECRAB = "That rock's alive!",


		QUAGMIRE_RUBBLE_CARRIAGE = "On the road to nowhere.",
        QUAGMIRE_RUBBLE_CLOCK = "Someone beat the clock. Literally.",
        QUAGMIRE_RUBBLE_CATHEDRAL = "Preyed upon.",
        QUAGMIRE_RUBBLE_PUBDOOR = "No longer a-door-able.",
        QUAGMIRE_RUBBLE_ROOF = "Someone hit the roof.",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "That clock's been punched.",
        QUAGMIRE_RUBBLE_BIKE = "Must have mis-spoke.",
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "No one's here.",
            "Something destroyed this town.",
            "I wonder who they angered.",
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "Something put a damper on that chimney.",
        QUAGMIRE_RUBBLE_CHIMNEY2 = "Something put a damper on that chimney.",
        QUAGMIRE_MERMHOUSE = "What an ugly little house.",
        QUAGMIRE_SWAMPIG_HOUSE = "It's seen better days.",
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "Some pig's house was ruined.",
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "I guess you're in charge around here?",
            SLEEPING = "It's sleeping, for now.",
        },
        QUAGMIRE_SWAMPIG = "It's a super hairy pig.",

        QUAGMIRE_PORTAL = "Another dead end.",
        QUAGMIRE_SALTROCK = "Salt. The tastiest mineral.",
        QUAGMIRE_SALT = "It's full of salt.",
        --food--
        QUAGMIRE_FOOD_BURNT = "That one was an experiment.",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "I should offer it on the Altar of Gnaw.",
            MISMATCH = "That's not what it wants.",
            MATCH = "Science says this will appease the sky God.",
            MATCH_BUT_SNACK = "It's more of a light snack, really.",
        },

        QUAGMIRE_FERN = "Probably chock full of vitamins.",
        QUAGMIRE_FOLIAGE_COOKED = "We cooked the foliage.",
        QUAGMIRE_COIN1 = "I'd like more than a penny for my thoughts.",
        QUAGMIRE_COIN2 = "A decent amount of coin.",
        QUAGMIRE_COIN3 = "Seems valuable.",
        QUAGMIRE_COIN4 = "We can use these to reopen the Gateway.",
        QUAGMIRE_GOATMILK = "Good if you don't think about where it came from.",
        QUAGMIRE_SYRUP = "Adds sweetness to the mixture.",
        QUAGMIRE_SAP_SPOILED = "Might as well toss it on the fire.",
        QUAGMIRE_SEEDPACKET = "Sow what?",

        QUAGMIRE_POT = "This pot holds more ingredients.",
        QUAGMIRE_POT_SMALL = "Let's get cooking!",
        QUAGMIRE_POT_SYRUP = "I need to sweeten this pot.",
        QUAGMIRE_POT_HANGER = "It has hang-ups.",
        QUAGMIRE_POT_HANGER_ITEM = "For suspension-based cookery.",
        QUAGMIRE_GRILL = "Now all I need is a backyard to put it in.",
        QUAGMIRE_GRILL_ITEM = "I'll have to grill someone about this.",
        QUAGMIRE_GRILL_SMALL = "Barbecurious.",
        QUAGMIRE_GRILL_SMALL_ITEM = "For grilling small meats.",
        QUAGMIRE_OVEN = "It needs ingredients to make the science work.",
        QUAGMIRE_OVEN_ITEM = "For scientifically burning things.",
        QUAGMIRE_CASSEROLEDISH = "A dish for all seasonings.",
        QUAGMIRE_CASSEROLEDISH_SMALL = "For making minuscule motleys.",
        QUAGMIRE_PLATE_SILVER = "A silver plated plate.",
        QUAGMIRE_BOWL_SILVER = "A bright bowl.",
        QUAGMIRE_CRATE = "Kitchen stuff.",

        QUAGMIRE_MERM_CART1 = "Any science in there?", --sammy's wagon
        QUAGMIRE_MERM_CART2 = "I could use some stuff.", --pipton's cart
        QUAGMIRE_PARK_ANGEL = "Take that, creature!",
        QUAGMIRE_PARK_ANGEL2 = "So lifelike.",
        QUAGMIRE_PARK_URN = "Ashes to ashes.",
        QUAGMIRE_PARK_OBELISK = "A monumental monument.",
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "Turns out a key was the key to getting in.",
            LOCKED = "Locked tight.",
        },
        QUAGMIRE_PARKSPIKE = "The scientific term is: \"Sharp pointy thing\".",
        QUAGMIRE_CRABTRAP = "A crabby trap.",
        QUAGMIRE_TRADER_MERM = "Maybe they'd be willing to trade.",
        QUAGMIRE_TRADER_MERM2 = "Maybe they'd be willing to trade.",

        QUAGMIRE_GOATMUM = "Reminds me of my old nanny.",
        QUAGMIRE_GOATKID = "This goat's much smaller.",
        QUAGMIRE_PIGEON =
        {
            DEAD = "They're dead.",
            GENERIC = "He's just winging it.",
            SLEEPING = "It's sleeping, for now.",
        },
        QUAGMIRE_LAMP_POST = "Huh. Reminds me of home.",

        QUAGMIRE_BEEFALO = "Science says it should have died by now.",
        QUAGMIRE_SLAUGHTERTOOL = "Laboratory tools for surgical butchery.",

        QUAGMIRE_SAPLING = "I can't get anything else out of that.",
        QUAGMIRE_BERRYBUSH = "Those berries are all gone.",

        QUAGMIRE_ALTAR_STATUE2 = "What are you looking at?",
        QUAGMIRE_ALTAR_QUEEN = "A monumental monument.",
        QUAGMIRE_ALTAR_BOLLARD = "As far as posts go, this one is adequate.",
        QUAGMIRE_ALTAR_IVY = "Kind of clingy.",

        QUAGMIRE_LAMP_SHORT = "Enlightening.",

        --v2 Winona --resuming quotes here
        WINONA_CATAPULT =
        {
        	GENERIC = "Looks like it'll keep me safe.",
        	OFF = "Needs a recharge.",
        	BURNING = "Gahh!",
        	BURNT = "Well, there goes that plan.",
            SLEEP = "Looks like it'll keep me safe.",
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "Swivelling things that look at you give me the creeps.",
        	OFF = "Needs a zap to get it going.",
        	BURNING = "Gahh!",
        	BURNT = "Well, there goes that plan.",
            SLEEP = "Swivelling things that look at you give me the creeps.",
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "Turns rocks into electricity. Dunno how.",
        	LOWPOWER = "Needs a cheeky refill.",
        	OFF = "Maybe I should fix it up.",
        	BURNING = "Gahh!",
        	BURNT = "Well, there goes that plan.",
        },
        WINONA_BATTERY_HIGH =
        {
        	GENERIC = "Must work using magic, I reckon.",
        	LOWPOWER = "Need ta throw some more gems on.",
        	OFF = "Need ta throw some more gems on.",
        	BURNING = "Gahh!",
        	BURNT = "Well, there goes that plan.",
            OVERLOADED = "She's really squeezing that thing dry.",
        },
        --v3 Winona
		WINONA_REMOTE =
		{
			GENERIC = "I really hope it doesn't work on me.",
			OFF = "... Maybe I should dispose of it when she isn't looking. Just to be safe.",
			CHARGING = "I really hope it doesn't work on me.",
			CHARGED = "I really hope it doesn't work on me.",
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "Might take some notes on this, I reckon.",
            MISSINGSKILL = "only_used_by_winona",
			OFF = "Outta juice.",
			CHARGING = "Might take some notes on this, I reckon.",
			CHARGED = "Might take some notes on this, I reckon.",
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "Teleporting tapes would be easier than manual searching.",
            MISSINGSKILL = "only_used_by_winona",
			OFF = "Outta juice.",
			BURNING = "Gahh!",
			BURNT = "Well, that's cooked.",
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "Hey little guy. Welcome to your life.",
			OFF = "Kipping on the job. Cheeky.",
			SLEEP = "Hey little guy. Welcome to your life.",
			CHARGING = "Kipping on the job. Cheeky.",
			CHARGED = "Kipping on the job. Cheeky.",
		},
		INSPECTACLESBOX = "only_used_by_winona",
		INSPECTACLESBOX2 = "only_used_by_winona",
        INSPECTACLESHAT =
        {
            GENERIC = "Wonder if they let you see into the future.",
            MISSINGSKILL = "only_used_by_winona",
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "My head's not really made for glasses.",
            MISSINGSKILL = "only_used_by_winona",
        },
		CHARLIERESIDUE = "only_used_by_winona",
		CHARLIEROSE = "only_used_by_winona",
        WINONA_MACHINEPARTS_1 = "only_used_by_winona",
        WINONA_MACHINEPARTS_2 = "only_used_by_winona",
		WINONA_RECIPESCANNER = "only_used_by_winona",
		WINONA_HOLOTELEPAD = "only_used_by_winona",
		WINONA_HOLOTELEBRELLA = "only_used_by_winona",

        --Wormwood
        COMPOSTWRAP = "Seems important to that weird plant guy.",
        ARMOR_BRAMBLE = "I can punish my attackers.",
        TRAP_BRAMBLE = "Gah! Wouldn't want to step on that.",

        BOATFRAGMENT03 = "Someone had a sailing misadventure. Hope I'm not next.",
        BOATFRAGMENT04 = "Someone had a sailing misadventure. Hope I'm not next.",
        BOATFRAGMENT05 = "Someone had a sailing misadventure. Hope I'm not next.",
		BOAT_LEAK = "Uhh, uh oh. Give me a sec, I'll get to it...",
        MAST = "I'd rather stick to the land, to be honest.",
        SEASTACK = "I wanna avoid this more than regular rocks. Surprising, honestly.",
        FISHINGNET = "Don't really plan on touching fish, to be honest.", --unimplemented
        ANTCHOVIES = "Well, isn't that just gross.", --unimplemented
        STEERINGWHEEL = "... Do I *have* to go sailing?",
        ANCHOR = "Guess I wouldn't want to float away.",
        BOATPATCH = "Better safe than sorry, and all that.", --WAYPOINT 1/11/22
        DRIFTWOOD_TREE =
        {
            BURNING = "Its drifting got cut short by fire.",
            BURNT = "That's that, I guess.",
            CHOPPED = "Such is the life of a drifter.",
            GENERIC = "It drifted onto this weird beach.",
        },

        DRIFTWOOD_LOG = "Just drifting through life.",

        MOON_TREE =
        {
            BURNING = "Gahh. There goes all that wood.",
            BURNT = "Desires and dreams, burnt to a crisp.",
            CHOPPED = "S'a lot of wood.",
            GENERIC = "Wonder if moon people record their memories on tape.",
        },
		MOON_TREE_BLOSSOM = "Moon juice is getting to my head. I'm almost finding this flower pretty.",

        MOONBUTTERFLY =
        {
        	GENERIC = "Flowers aren't sposed to fly.",
        	HELD = "Just don't fill my pockets with moon dust, kay?",
        },
		MOONBUTTERFLYWINGS = "Kinda smells of baby powder.",
        MOONBUTTERFLY_SAPLING = "Jeez. Guess that's lunar magic for ya.",
        ROCK_AVOCADO_FRUIT = "Apparently it's got food in it. I reckon it's more useful as a rock.",
        ROCK_AVOCADO_FRUIT_RIPE = "S'got the texture of butter. Yuck.",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "Feels like melted butter now.",
        ROCK_AVOCADO_FRUIT_SPROUT = "I'm normally not much for plants, but this'n is kinda cute.",
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "Needs fertilising. Not that it's really my problem.",
			WITHERED = "It's pretty hot outside, to be fair.",
			GENERIC = "Didn't know avocadoes grew on the moon.",
			PICKED = "Guess it'd make a decent resource producer.",
			DISEASED = "Gahh! Smells like rotten garbage.", --unimplemented
            DISEASING = "That harvest just crumbled to bits in my hand.", --unimplemented
			BURNING = "Gahh! Not my rock plant!",
		},
        DEAD_SEA_BONES = "If you ask me, fish oughta stay in the ocean.",
        HOTSPRING =
        {
        	GENERIC = "Not much for swimming, to be honest.",
        	BOMBED = "Bombed ta lunar smithereens.",
        	GLASS = "Glassed like a city from the future.",
			EMPTY = "I reckon someone's been drinking all that moon juice.",
        },
        MOONGLASS = "Moon bits. Could take someone's eye out.",
        MOONGLASS_CHARGED = "Feels like it's about to shatter.",
        MOONGLASS_ROCK = "A remnant of the moon beast.", --tvquote
        BATHBOMB = "Not sure who this is supposed to be 'relaxing' for.",
        TRAP_STARFISH =
        {
            GENERIC = "Gahh. The ocean is fulla such nasty stuff.",
            CLOSED = "Gave me a fright, that did.",
        },
        DUG_TRAP_STARFISH = "Gotcha now, you wretched thing.",
        SPIDER_MOON = --tvquote'd
        {
        	GENERIC = "A survivor of the mutant nights.",
        	SLEEPING = "A sleeper of the mutant nights.",
        	DEAD = "A victim of the mutant nights.",
        },
        MOONSPIDERDEN = "That makes me want to leave this twisted island. Jeez.",
		FRUITDRAGON =
		{
			GENERIC = "Natural life can be so aggressive. Why don'tcha just chill out?",
			RIPE = "That thing's red angry hot.",
			SLEEPING = "Some peace and quiet at last.",
		},
        PUFFIN =
        {
            GENERIC = "Might be waterproof, but you aren't fooling me.",
            HELD = "No more surveillance for you, hur hur hur.",
            SLEEPING = "Even spies have gotta rest up.",
        },

		MOONGLASSAXE = "Guess this makes existing a bit easier.",
		GLASSCUTTER = "That'll cut you into ribbons!",

        ICEBERG =
        {
            GENERIC = "Looks like a bad day waiting to happen.", --unimplemented
            MELTED = "We're free from being dashed. For now.", --unimplemented
        },
        ICEBERG_MELTED = "We're free from being dashed. For now.", --unimplemented

        MINIFLARE = "I'd prefer to go alone, to be honest.",
        MEGAFLARE = "This'll definitely make me get found out. Not sure if I trust it...",

		MOON_FISSURE =
		{
			GENERIC = "Feels like it's teasing me with things I can't know.",
			NOLIGHT = "Gah, that's doing my head in.",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "Simply itching for completedness.",
            GENERIC = "Moon magic definitely isn't my favourite thing.",
        },

        MOON_ALTAR_IDOL = "'S definitely an... object.",
        MOON_ALTAR_GLASS = "Dunno if I can really comprehend this thing.",
        MOON_ALTAR_SEED = "Definitely no ordinary stone.",

        MOON_ALTAR_ROCK_IDOL = "Either that's a funny lookin' rock, or something's stuck inside.",
        MOON_ALTAR_ROCK_GLASS = "Either that's a funny lookin' rock, or something's stuck inside.",
        MOON_ALTAR_ROCK_SEED = "Either that's a funny lookin' rock, or something's stuck inside.",

        MOON_ALTAR_CROWN = "Glad I was able to work that hook thingo.",
        MOON_ALTAR_COSMIC = "Never thought a rock could look lonely.",

        MOON_ALTAR_ASTRAL = "Seems t'be calling out to someone. Or something.",
        MOON_ALTAR_ICON = "It's telling me to... huh? Could you speak up?",
        MOON_ALTAR_WARD = "Dunno if I should shut out or listen to these voices in my head.",

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "Nothing wrong with sticking to land. Nothing at all.",
            BURNT = "Well, I'm definitely not planning on swimming.",
        },
        BOAT_ITEM = "Jeez. Guess I'm not getting outta this.",
        BOAT_GRASS_ITEM = "I'd much prefer a wooden boat. Can't I wait a bit?",
        STEERINGWHEEL_ITEM = "I'm not plannin' on rowing.",
        ANCHOR_ITEM = "Wouldn't want my stuff floating away.\nOr maybe I would if it meant I'd never have to sail again.",
        MAST_ITEM = "Mast I do this to myself? Hur hur hur.",
        MUTATEDHOUND =
        {
        	DEAD = "Whew. Done and done.",
        	GENERIC = "Gahh, shod it! I need help!!",
        	SLEEPING = "Better watch my step so I don't wake it up.",
        },

        MUTATED_PENGUIN =
        {
			DEAD = "Whew. Done and done.",
			GENERIC = "That's a walking freezer block.",
			SLEEPING = "The thing is sleeping. Should leave while I can.",
		},
        CARRAT =
        {
        	DEAD = "That carrat got diced up.",
        	GENERIC = "I'd feel bad about eating this thing no matter what.",
        	HELD = "Yep. That's definitely a carrot-rat.",
        	SLEEPING = "If I was that chef guy, I'd take this opportunity to throw you into a stew.",
        },

		BULLKELP_PLANT =
        {
            GENERIC = "Guess the sea's not immune to weeds either.",
            PICKED = "One less weed in the world.",
        },
		BULLKELP_ROOT = "Don't know if I really wanna farm salty mush.",
        KELPHAT = "I made it into a hat? Have I lost it?",
		KELP = "Gahh, that's disgusting. And it stinks something awful.",
		KELP_COOKED = "Might as well be soup, now.",
		KELP_DRIED = "Salt is terrible for my insides.",

		GESTALT = "I can see visions of... mountains and mountains of tapes...",
        GESTALT_GUARD = "My visions are clouded with violence. Damn, I was enjoying that.",

		COOKIECUTTER = "Get away from my boat, you pilfering pocket-loaf!",
		COOKIECUTTERSHELL = "I pilfered its shell.",
		COOKIECUTTERHAT = "I look like some sorta underwater cretin, wearing this.",
		SALTSTACK =
		{
			GENERIC = "Should definitely avoid that at all costs.",
			MINED_OUT = "No more salt. Dodged a close one there.",
			GROWING = "Gahh, it's growing back!",
		},
		SALTROCK = "Nah. I'm good.",
		SALTBOX = "Keeps food fresh. Definitely not what I need.",

		TACKLESTATION = "I'm questioning whether or not this is productive.",
		TACKLESKETCH = "Someone scribbled on this little ticket.",

        MALBATROSS = "Please don't knock me into the water!!",
        MALBATROSS_FEATHER = "Glad that's over. Jeez.",
        MALBATROSS_BEAK = "It was pulled from that thing's face.",
        MAST_MALBATROSS_ITEM = "Well, isn't that just fancy.",
        MAST_MALBATROSS = "Going faster technically increases the risk. Dunno if I like that.",
		MALBATROSS_FEATHERED_WEAVE = "It's too bristly to use as bedsheets.",

        GNARWAIL =
        {
            GENERIC = "Hur hur hur. Look at this guy's schnozz!",
            BROKENHORN = "Broke his schnozzle.",
            FOLLOWER = "Sorry for laughing at your schnozz.",
            BROKENHORN_FOLLOWER = "Gahh, you bloody idiot.",
        },
        GNARWAIL_HORN = "Stole his schnozzle.",

        WALKINGPLANK = "Hope I never have to use that.",
        WALKINGPLANK_GRASS = "Hope I never have to use that.",
        OAR = "If I have to... my poor joints.",
		OAR_DRIFTWOOD = "If I have to... my poor joints.",

		OCEANFISHINGROD = "It's a stick, with a string on.",
		OCEANFISHINGBOBBER_NONE = "Should use one a those bobbly things.",
        OCEANFISHINGBOBBER_BALL = "A ball shaped bobbler.",
        OCEANFISHINGBOBBER_OVAL = "It's a different shape. What difference's that gonna make?",
		OCEANFISHINGBOBBER_CROW = "Reduced to surveilling the depths.",
		OCEANFISHINGBOBBER_ROBIN = "Reduced to surveilling the depths.",
		OCEANFISHINGBOBBER_ROBIN_WINTER = "Reduced to surveilling the depths.",
		OCEANFISHINGBOBBER_CANARY = "Reduced to surveilling the depths.",
		OCEANFISHINGBOBBER_GOOSE = "Reduced to surveilling the depths.",
		OCEANFISHINGBOBBER_MALBATROSS = "Reduced to surveilling the depths.",

		OCEANFISHINGLURE_SPINNER_RED = "Spinner spinner, fishy dinner.",
		OCEANFISHINGLURE_SPINNER_GREEN = "Spinner spinner, fishy dinner.",
		OCEANFISHINGLURE_SPINNER_BLUE = "Spinner spinner, fishy dinner.",
		OCEANFISHINGLURE_SPOON_RED = "A little spoon for little fish.",
		OCEANFISHINGLURE_SPOON_GREEN = "A little spoon for little fish.",
		OCEANFISHINGLURE_SPOON_BLUE = "A little spoon for little fish.",
		OCEANFISHINGLURE_HERMIT_RAIN = "Bit of a crabby way to catch fish, I reckon.",
		OCEANFISHINGLURE_HERMIT_SNOW = "Bit of a crabby way to catch fish, I reckon.",
		OCEANFISHINGLURE_HERMIT_DROWSY = "Bit of a crabby way to catch fish, I reckon.",
		OCEANFISHINGLURE_HERMIT_HEAVY = "Bit of a crabby way to catch fish, I reckon.",

		OCEANFISH_SMALL_1 = "Some little fish.",
		OCEANFISH_SMALL_2 = "Just don't squirt water at me, okay?",
		OCEANFISH_SMALL_3 = "Definitely bit that bait. Now you're mine.",
		OCEANFISH_SMALL_4 = "Dunno why I spent my time catching this.",
		OCEANFISH_SMALL_5 = "Hur hur hur. At least this one's funny.",
		OCEANFISH_SMALL_6 = "It's kinda pretty. I guess.",
		OCEANFISH_SMALL_7 = "Don't think I'm gonna be keeping it as a pet.",
		OCEANFISH_SMALL_8 = "Never imagined I'd get burnt by a fish.",
        OCEANFISH_SMALL_9 = "Gah! Don't spit on me!",

		OCEANFISH_MEDIUM_1 = "Don't think that's even a fish. S'just mud.",
		OCEANFISH_MEDIUM_2 = "Catching this one was a bit baseless.",
		OCEANFISH_MEDIUM_3 = "Yep. Definitely a fish.",
		OCEANFISH_MEDIUM_4 = "It has funny whiskers. Hur hur.",
		OCEANFISH_MEDIUM_5 = "Well, that's just strange.",
		OCEANFISH_MEDIUM_6 = "Kinda shiny.",
		OCEANFISH_MEDIUM_7 = "Kinda shiny.",
		OCEANFISH_MEDIUM_8 = "Careful, I don't wanna get frostbite.",
        OCEANFISH_MEDIUM_9 = "Funny lookin' fella, aren'tcha?",

		PONDFISH = "Just some grey-lookin' fish.",
		PONDEEL = "Long, thin, and slimy. Yuck.",

        FISHMEAT = "Full of scales, and bones, and... yeah, I'm good.",
        FISHMEAT_COOKED = "It's still fulla scales and bones.",
        FISHMEAT_SMALL = "Full of guts, and salty bits, and... I'll pass.",
        FISHMEAT_SMALL_COOKED = "It's still full of guts. Guhh.",
		SPOILED_FISH = "It's not any better in death than it was in life.",

		FISH_BOX = "Could keep them there if I need 'em for later. Which I won't.",
        POCKET_SCALE = "Maybe someone else'll want some fish.",

		TACKLECONTAINER = "Great, I can stop getting poked with all those hooks.",
		SUPERTACKLECONTAINER = "S'like a little apartment complex for hooks.",

		TROPHYSCALE_FISH =
		{
			GENERIC = "Weighing them beats eating 'em, I guess.",
			HAS_ITEM = "Weight: {weight}\nCaught by: {owner}",
			HAS_ITEM_HEAVY = "Weight: {weight}\nCaught by: {owner}\nGood on ya, that's a big one!",
			BURNING = "Jeez. Hope there wasn't a fish in there.",
			BURNT = "Someone's 'measuring contest' got put in its place.",
			OWNER = "I wasted my time catching this. Don't ask why.\nWeight: {weight}\nCaught by: {owner}",
			OWNER_HEAVY = "I trapped this giant fish in a tank. Good for me.\nWeight: {weight}\nCaught by: {owner}",
		},

		OCEANFISHABLEFLOTSAM = "Goop. Doubt there's anything valuable in there.",

		CALIFORNIAROLL = "Full of little bits. Guaranteed to get everywhere.",
		SEAFOODGUMBO = "Salty, wet, and soupy. Not what I ordered.",
		SURFNTURF = "At least it's not made of ground bits.",

        WOBSTER_SHELLER = "Crabby little fella, aren't ya?",
        WOBSTER_DEN = "Looks like a cozy little spot.",
        WOBSTER_SHELLER_DEAD = "Not like I'm planning on eating it.",
        WOBSTER_SHELLER_DEAD_COOKED = "Ah, I'm good. Someone else can have it.",

        LOBSTERBISQUE = "Sea lice soup. I'll be right.",
        LOBSTERDINNER = "Cooking it alive seemed a bit cruel.",

        WOBSTER_MOONGLASS = "What's up with you, mate?",
        MOONGLASS_WOBSTER_DEN = "It'd be cozier if it wasn't full of glass, I bet.",

		TRIDENT = "I'm a bit worried about the splashback.",

		WINCH =
		{
			GENERIC = "Beats diving down there myself, I guess.",
			RETRIEVING_ITEM = "Ahh, nice and easy. Don't even have to do my back in.",
			HOLDING_ITEM = "Been busy, have we?",
		},

        HERMITHOUSE = {
            GENERIC = "I'm not one for decor. But that looks a bit derelict.",
            BUILTUP = "Dunno why she put me in charge of decorating.",
        },

        SHELL_CLUSTER = "It'd better not be fulla little creatures.",
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "Soft, deep, and buttery smooth.",
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "Doesn't sound too bad.",
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "Bit too ear-piercing for my liking.",
        },

        CHUM = "Bits of dead fish for alive fish to eat up.",

        SUNKENCHEST =
        {
            GENERIC = "Someone's definitely stashed their stuff in here. I guarantee it.",
            LOCKED = "Not gonna let some flimsy lock block me off from my tapes.",
        },

        HERMIT_BUNDLE = "Maybe all these shell bells can do the entertaining for me.",
        HERMIT_BUNDLE_SHELLS = "Maybe all these shell bells can do the entertaining for me.",

        RESKIN_TOOL = "Don't think I really have a 'decorating brain.'",
        MOON_FISSURE_PLUGGED = "Bit of a hacky bodge, but, if it ain't broke...", --WAYPOINT 3/11/22


		----------------------- ROT STRINGS GO ABOVE HERE ------------------

		-- Walter
        WOBYBIG =
        {
            "That's one sizeable beast.",
            "That's one sizeable beast.",
        },
        WOBYSMALL =
        {
            "Bet she'd carry a load of plastic junk well.",
            "Bet she'd carry a load of plastic junk well.",
        },
		WALTERHAT = "Doesn't really fit on my head, I don't think.",
        SLINGSHOT =
		{
			GENERIC = "I hope this kid likes me. That would mess me right up.",
			NOT_MINE = "only_used_by_walter",
		},
		SLINGSHOTAMMO_ROCK = "Ammo of choice for a little pest.",
		SLINGSHOTAMMO_MARBLE = "Ammo of choice for a little pest.",
		SLINGSHOTAMMO_THULECITE = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_GOLD = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_HONEY = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_SLOW = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_FREEZE = "Ammo of choice for a little pest.",
		SLINGSHOTAMMO_POOP = "Isn't that just awful?",
        SLINGSHOTAMMO_STINGER = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_MOONGLASS = "Sharp as a razor.",
        SLINGSHOTAMMO_GELBLOB = "Ammo of choice for a little pest.",
		SLINGSHOTAMMO_SCRAPFEATHER = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_DREADSTONE = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_GUNPOWDER = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_LUNARPLANTHUSK = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_PUREBRILLIANCE = "Ammo of choice for a little pest.",
        SLINGSHOTAMMO_HORRORFUEL = "Ammo of choice for a little pest.",
        PORTABLETENT = "A life in the bush isn't really for me.", --Portable shutdown zone. --changing the quote so it makes more sense with insomiac
        PORTABLETENT_ITEM = "Feel like a right truckie with this on my back.",

        -- Wigfrid
        BATTLESONG_DURABILITY = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_HEALTHGAIN = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_SANITYGAIN = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_SANITYAURA = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_FIRERESISTANCE = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_INSTANT_TAUNT = "Ah, a bit of impromptu battle-tainment? Count me in.",
        BATTLESONG_INSTANT_PANIC = "Ah, a bit of impromptu battle-tainment? Count me in.",

        -- Webber
        MUTATOR_WARRIOR = "Almost makes me glad I can't eat food.",
        MUTATOR_DROPPER = "Sorry mate. That looks awful.",
        MUTATOR_HIDER = "Almost makes me glad I can't eat food.",
        MUTATOR_SPITTER = "Sorry mate. That looks awful.",
        MUTATOR_MOON = "Almost makes me glad I can't eat food.",
        MUTATOR_HEALER = "Sorry mate. That looks awful.",
        SPIDER_WHISTLE = "I don't wanna get swarmed, so I don't think I'll use it.",
        SPIDERDEN_BEDAZZLER = "Heh, that's kinda cute.",
        SPIDER_HEALER = "Gahh! Looks like a shoddy candy corn, that does.",
        SPIDER_REPELLENT = "The spiders don't seem to listen to me.",
        SPIDER_HEALER_ITEM = "Spiders are better off without this, I reckon.",

		-- Wendy
		GHOSTLYELIXIR_SLOWREGEN = "'Taking a swig would be the easy way out of here.'",
		GHOSTLYELIXIR_FASTREGEN = "'Taking a swig would be the easy way out of here.'",
		GHOSTLYELIXIR_SHIELD = "'Taking a swig would be the easy way out of here.'",
		GHOSTLYELIXIR_ATTACK = "'Taking a swig would be the easy way out of here.'",
		GHOSTLYELIXIR_SPEED = "'Taking a swig would be the easy way out of here.'",
		GHOSTLYELIXIR_RETALIATION = "'Taking a swig would be the easy way out of here.'",
        GHOSTLYELIXIR_REVIVE = "'Taking a swig would be the easy way out of here.'",
		SISTURN =
		{
			GENERIC = "Looks a bit empty and sad.",
			SOME_FLOWERS = "Looks kinda nice with those flowers. Needs more, I bet.",
			LOTS_OF_FLOWERS = "Guess that's a memorial something-or-other.",
            LOTS_OF_FLOWERS_EVIL = "Creepy, but about what I expected from her.", --[[TODO]]
            LOTS_OF_FLOWERS_BLOSSOM = "Well, that's nice.", --[[TODO]]
		},

        --Wortox
        WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls
        --WORTOX_DECOY is not needed because it uses the default WORTOX inspection.
        WORTOX_NABBAG = "Reckon I could borrow that? I've got a lot to carry.",
        WORTOX_REVIVER = "Never hurts to have a safety net.",
        WORTOX_SOULJAR = "Jeez. Wouldn't wanna get stuffed in there.",

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "All yours, mate. Not like I'm planning on using it.",
            DONE = "That meal's not mine. All yours.",

			COOKING_LONG = "Looks like his meal's gonna take some time.",
			COOKING_SHORT = "I reckon it's almost done.",
			EMPTY = "All yours, mate. Not like I'm planning on using it.",
        },

        PORTABLEBLENDER_ITEM = "Dunno why he can't just crush them up by hand.",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "Seems a bit like an overengineered solution.",
            DONE = "Seems like a lot of effort to make food hurt more.",
        },
        SPICEPACK = "A bag full of nasties.",
        SPICE_GARLIC = "Seems like it'll make the food taste worse.",
        SPICE_SUGAR = "Seems like it'll make the food taste worse.",
        SPICE_CHILI = "Seems like it'll make the food taste worse.",
        SPICE_SALT = "Seems like it'll make the food taste worse.",
        MONSTERTARTARE = "Well, isn't that just rancid.",
        FRESHFRUITCREPES = "It'd be almost nice if it wasn't so sticky.",
        FROGFISHBOWL = "Mushing two foods together doesn't make it 'gourmet,' if you ask me.",
        POTATOTORNADO = "Heh. At least this one looks kinda funny.",
        DRAGONCHILISALAD = "Seems like a pretty elaborate mess.",
        GLOWBERRYMOUSSE = "I hear this one is supposed to be 'functional.'",
        VOLTGOATJELLY = "Maybe I could use it as a lubricant.",
        NIGHTMAREPIE = "Regular pies are awful enough. Jeez.",
        BONESOUP = "Sure, but where did those bones come from?",
        MASHEDPOTATOES = "Pulverised potatoes. Not my favourite thing.",
        POTATOSOUFFLE = "S'just mashed potatoes with a different name.",
        MOQUECA = "Smells fishy. Too fishy for me.",
        GAZPACHO = "Cold soup. Weird.",
        ASPARAGUSSOUP = "If I ate that, I'd smell awful for days.",
        VEGSTINGER = "Don't feel like getting 'stung' by that one.",
        BANANAPOP = "Just focus on the positives...",
        CEVICHE = "At least it's not the other type of lime.",
        SALSA = "I can feel a system overheat just waiting for me.",
        PEPPERPOPPER = "They'll go pop inside me, and then it'll all be over.",

        TURNIP = "Not gonna turnip to this one's funeral.",
        TURNIP_COOKED = "It looks almost edible. Just kidding.",
        TURNIP_SEEDS = "Living potential... the potential to waste my time!",

        GARLIC = "Makes me smell something awful.",
        GARLIC_COOKED = "It smells somewhat better. I guess.",
        GARLIC_SEEDS = "Living potential... the potential to waste my time!",

        ONION = "This veggie makes my eyes water. More than most of them do.",
        ONION_COOKED = "No more emotional outbursts.",
        ONION_SEEDS = "Living potential... the potential to waste my time!",

        POTATO = "I kinda like this one. At least it's 'efficient.'",
        POTATO_COOKED = "Cooked to peak efficiency.",
        POTATO_SEEDS = "Living potential... the potential to waste my time!",

        TOMATO = "Red usually means 'I'm poisonous.' So I think I'm good.",
        TOMATO_COOKED = "Cooked, but still red. Red means dead.",
        TOMATO_SEEDS = "Living potential... the potential to waste my time!",

        ASPARAGUS = "'Healthy?' Yeah, right. I just reckon it stinks.",
        ASPARAGUS_COOKED = "Grilled, but still smelly.",
        ASPARAGUS_SEEDS = "Living potential... the potential to waste my time!",

        PEPPER = "The correct term is 'I'm not touching that with a ten-foot pole!'",
        PEPPER_COOKED = "I really don't think this is necessary.",
        PEPPER_SEEDS = "Living potential... the potential to waste my time!",

        WEREITEM_BEAVER = "Someone's watched too many horror movies.",
        WEREITEM_GOOSE = "'Transformations' only exist in fiction. Is what I'd like to believe.",
        WEREITEM_MOOSE = "I'd bet my left hand that it's cursed.",

        MERMHAT = "Great. I was sick of getting assailed by those fishy losers.",
        MERMTHRONE =
        {
            GENERIC = "Weird place to put a carpet. Isn't it gonna get soaked?",
            BURNT = "Well. There goes that.",
        },
        MOSQUITOMUSK = "That'll reduce the risk of poke-holes.",
        MOSQUITOBOMB = "Biological warfare? That fishy little...",
        MOSQUITOFERTILIZER = "Doesn't smell great, but it's for the plants, not me.",
        MOSQUITOMERMSALVE = "I don't think I'm the target audience for this.",

        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "Can't say I fully trust that fishy little twerp.",
            BURNT = "Burnt to pieces. Maybe for the best.",
        },
        MERMHOUSE_CRAFTED =
        {
            GENERIC = "That's definitely your average Queenslander. Heh.", --the house, not the person
            BURNT = "Got sent back to the stone age.",
        },

        MERMWATCHTOWER_REGULAR = "Royal servants. Not really my cuppa tea.",
        MERMWATCHTOWER_NOKING = "Ha. They've got no one to die for, now.",
        MERMKING = "Jeez. What a great, ugly, brute.",
        MERMGUARD = "Looks like we have a temporary alliance.",
        MERM_PRINCE = "Looks like it's about to lay an egg.",

        SQUID = "It's camoflauge won't work on me. I see the world in black and white.", --mmmmm 1943

		GHOSTFLOWER = "Spooky.",
        SMALLGHOST = "'S best not to think about the source of all these tapes.",

        CRABKING =
        {
            GENERIC = "Gahh!! Wasn't expecting that rock to come alive!",
            INERT = "Seen loads and loads of rocks. What's one more?",
        },
		CRABKING_CLAW = "Seems more intent on wrecking my boat than me.",

		MESSAGEBOTTLE = "Someone's sending out an S.O.S to the world.", --epic reference
		MESSAGEBOTTLEEMPTY = "Hundred billion bottles, washed up on the shore.",

        MEATRACK_HERMIT =
        {
            DONE = "This seems like one of the less awful things to eat out here.",
            DRYING = "It's all strung out with nowhere to go.",
            DRYINGINRAIN = "I'm no foodie, but that seems counter-intuitive.",
            GENERIC = "Drying meat might make it more bearable.",
            BURNT = "Hardly a shock. It was just some shells and string.",
            DONE_NOTMEAT = "It might be alright. Might.",
            DRYING_NOTMEAT = "It's all strung out with nowhere to go.",
            DRYINGINRAIN_NOTMEAT = "I'm no foodie, but that seems counter-intuitive.",
        },
        BEEBOX_HERMIT =
        {
			READY = "A potent box of sweet, gooey, sap. I should start running now.",
			FULLHONEY = "A potent box of sweet, gooey, sap. I should start running now.",
			GENERIC = "She has enslaved the drones.",
			NOHONEY = "If it was me in their position, I'd have gotten a 'motivating' electric shock.",
			SOMEHONEY = "Patience is a virtue. One that I don't have.",
			BURNT = "I've got mixed feelings about that.",
        },

        HERMITCRAB = "She seems too preoccupied to help with my search.",

        HERMIT_PEARL = "This? I'm not really a jewellery guy.",
        HERMIT_CRACKED_PEARL = "S'a pretty backhanded way of saying 'no.'",

        -- DSEAS
        WATERPLANT = "I'll leave your nasty barnacles alone, don't worry.",
        WATERPLANT_BOMB = "I should throw it right back at em.",
        WATERPLANT_BABY = "Just a little sprout.",
        WATERPLANT_PLANTER = "Not sure why I'd want to farm these nasty things.",

        SHARK = "I've just had an idea. Let's start paddling in the other direction.",

        MASTUPGRADE_LAMP_ITEM = "Keeps my hands free, I guess.",
        MASTUPGRADE_LIGHTNINGROD_ITEM = "Prevents the sky from completing a circuit using my boat.",

        WATERPUMP = "Dunno what's wrong with just using a bucket.",

        BARNACLE = "A nasty-sounding name for a nasty-tasting food.",
        BARNACLE_COOKED = "Somehow looks even worse than before.",

        BARNACLEPITA = "Benefit of this is that you can't see them.",
        BARNACLESUSHI = "Salty, seaweed-y, and horrible.",
        BARNACLINGUINE = "I'd rather eat a plate of magnetic tape spaghetti.",
        BARNACLESTUFFEDFISHHEAD = "Fish stuffed with fish. Must I torment myself?",

        LEAFLOAF = "I'm not keen on solving this mystery meat.",
        LEAFYMEATBURGER = "Vegetarian food is still food. Nope.",
        LEAFYMEATSOUFFLE = "No clue what this thing is. I don't plan on finding out.",
        MEATYSALAD = "What do I look like? Some sorta rabbit?",

        -- GROTTO 

		MOLEBAT = "So many creatures out here have such huge noses. I wonder why.",
        MOLEBATHILL = "Yep, definitely keeping away from that.",

        BATNOSE = "I tore its nose from its face.",
        BATNOSE_COOKED = "All the snot has melted out, at least.",
        BATNOSEHAT = "Fantastic. Just in case I wanted to waterboard myself.",

        MUSHGNOME = "Ahh, look at that guy. Just minding his own business.",

        SPORE_MOON = "Looks nastier and explode-ier than normal spores.",

        MOON_CAP = "Full of fumes that'll mess with my receptors.",
        MOON_CAP_COOKED = "I'm not really going to eat this, am I??",

        MUSHTREE_MOON = "Covered in icky things I'd rather not touch.",

        LIGHTFLIER = "It'd be pretty annoying if it wasn't useful.",

        GROTTO_POOL_BIG = "Hm? ... what's that? ... You want me to jump in?",
        GROTTO_POOL_SMALL = "I'm almost tempted to take a dip.",

        DUSTMOTH = "Does a much better job of cleaning than I do, hur hur hur.",

        DUSTMOTHDEN = "A little hovel for cleaners.",

        ARCHIVE_LOCKBOX = "Keeping knowledge from me? S'pretty rude.",
        ARCHIVE_CENTIPEDE = "Gahh! I'd better keep my wits about me.",
        ARCHIVE_CENTIPEDE_HUSK = "Some weird old junk. Not even the right type.",

        ARCHIVE_COOKPOT =
        {
			COOKING_LONG = "I'm not the most patient drone.",
			COOKING_SHORT = "Come on, come on, come on...",
			DONE = "Food from a weird old underground pot. How bad could it be?",
			EMPTY = "I can cake myself up with old dust, too.",
			BURNT = "If I wasn't preoccupied, I'd see this as a lesson in irony.",
        },

        ARCHIVE_MOON_STATUE = "Looks like quite the workout, hur hur hur.",
        ARCHIVE_RUNE_STATUE =
        {
            LINE_1 = "How relevant could all these old words even be?",
            LINE_2 = "I don't think it's about tapes, so I should move on.",
            LINE_3 = "How relevant could all these old words even be?",
            LINE_4 = "I don't think it's about tapes, so I should move on.",
            LINE_5 = "How relevant could all these old words even be?",
        },

        ARCHIVE_RESONATOR = {
            GENERIC = "No need for good design when you have the power of magic floaty-bits.",
            IDLE = "It almost seems bored. Weird old thing.",
        },

        ARCHIVE_RESONATOR_ITEM = "It definitely won't help me dig up tapes. Something else though, maybe...",

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "Strange spinny dunny. It's turned off, though.",
          GENERIC =  "Hang on. I think things are supposed to come out of it, instead of the opposite.",
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "Someone needs to flick the switch for it to do anything.",
            GENERIC = "Gahh!! I've been found out!",
        },

        ARCHIVE_SECURITY_PULSE = "It isn't seeking me out, is it?",

        ARCHIVE_SWITCH = {
            VALID = "That gem is definitely shaped right for the funny claw-thing.",
            GEMS = "Something's missing.",
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "Guess it needs a boot-up.",
            GENERIC = "It isn't turned on. Maybe s'unplugged?",
        },

        WALL_STONE_2 = "A wall. Guess some things never change.",
        WALL_RUINS_2 = "Looking right fancy, there.",

        REFINED_DUST = "Gahh! It's in all my nooks and crannies!",
        DUSTMERINGUE = "Some sorta weird dust pavlova.",

        SHROOMCAKE = "Not a very good first impression for 'cake.'",
        SHROOMBAIT = "A nightmare for the senses.",

        NIGHTMAREGROWTH = "Gahh! I can feel it looking at me!",

        TURFCRAFTINGSTATION = "I'm here to dig up the ground, not make more of it!",

        MOON_ALTAR_LINK = "Never could trust bright glowy lights.",

        -- FARMING --WAYPOINT 3/11/22
        COMPOSTINGBIN =
        {
            GENERIC = "Gahh, isn't that just rancid!",
            WET = "Looks a bit too wet, I think.",
            DRY = "All dried out.",
            BALANCED = "Seems alright to me. Still stinks.",
            BURNT = "Maybe I'm glad it's over.",
        },
        COMPOST = "It's for plants. The sooner I can get rid of it, the better.",
        SOIL_AMENDER =
		{
			GENERIC = "Patience was never really my thing.",
			STALE = "Normally I hate waiting, but maybe I don't wanna see this when it's done.",
			SPOILED = "Still not done. Maybe it's for the best.",
		},

		SOIL_AMENDER_FERMENTED = "Tempted to rip out my olfactory sensors after that.",

        WATERINGCAN =
        {
            GENERIC = "What do I look like, some sorta landscaping drone?",
            EMPTY = "Needs a top up.",
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "We improved it by giving it a beak. That's dumb.",
            EMPTY = "Needs to be filled.",
        },

		FARM_PLOW = "Look at it go. If only it was doing something useful, hur hur.",
		FARM_PLOW_ITEM = "Might save me some effort, I reckon.",
		FARM_HOE = "Better'n using my hands, I guess.",
		GOLDEN_FARM_HOE = "I'm sure I coulda found a better use for that gold.",
		NUTRIENTSGOGGLESHAT = "Why's gardening gotta be this expensive?",
		PLANTREGISTRYHAT = "Makes me look like a right pothead. Hur hur hur.",

        FARM_SOIL_DEBRIS = "If only I could grow more of this, instead of plants.",

		FIRENETTLES = "Gahh! They're the other kind of 'hot.'",
		FORGETMELOTS = "No more forgettable than any other plant.",
		SWEETTEA = "Y'know what, this seems kinda bearable.",
		TILLWEED = "Hmm. Maybe those tough leaves could be used for something.",
		TILLWEEDSALVE = "Guess not all plants are useless.",
        WEED_IVY = "Gahh, not my plants!",
        IVY_SNARE = "Good-for-nothing plant...",

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "Let's see who weighs up.",
			HAS_ITEM = "Weight: {weight}\nHarvested on day: {day}\nBit of a waste of time, but sure.",
			HAS_ITEM_HEAVY = "Weight: {weight}\nHarvested on day: {day}\nJeez! That's a big one.",
            HAS_ITEM_LIGHT = "'Oversized?' Yeah, right.",
			BURNING = "I'd rather this burn than anything else.",
			BURNT = "Well, that's just how it is sometimes.",
        },

        CARROT_OVERSIZED = "An oversized waste of space.",
        CORN_OVERSIZED = "Being big and multicoloured doesn't make it less deadly.",
        PUMPKIN_OVERSIZED = "Wide load over here.",
        EGGPLANT_OVERSIZED = "There's a joke to be made here, but I think I'll leave it.",
        DURIAN_OVERSIZED = "That's an overgrown stinkbomb, waiting to happen.",
        POMEGRANATE_OVERSIZED = "Pomme crazy, but I think I'm gonna leave it alone.",
        DRAGONFRUIT_OVERSIZED = "Might be big and fancy, but you're still a fruit.",
        WATERMELON_OVERSIZED = "I'm hoping it doesn't go splat.",
        TOMATO_OVERSIZED = "Too much tomato.",
        POTATO_OVERSIZED = "That'll feed ya whole family! And your pet dog.", --AND THE COUSINS, TOO
        ASPARAGUS_OVERSIZED = "Makes everything taste like starch. I'll be right.",
        ONION_OVERSIZED = "Wonder if you can count how old it is by how many layers it has.",
        GARLIC_OVERSIZED = "We should make smelly vegetables illicit around here.",
        PEPPER_OVERSIZED = "A great, big, waste of space.",

        VEGGIE_OVERSIZED_ROTTEN = "Maybe it's for the best.",

		FARM_PLANT =
		{
			GENERIC = "A plant. Not my favourite thing.",
			SEED = "Don't think I need to sit here watching it.",
			GROWING = "Watching makes it grow slower. So I should leave.",
			FULL = "Was that really worth all the effort?",
			ROTTEN = "How terrible.",
			FULL_OVERSIZED = "Jeez! Would almost be useful if I wanted to eat it.",
			ROTTEN_OVERSIZED = "Maybe it's for the best.",
			FULL_WEED = "Weeds are even less useful than normal plants.",

			BURNING = "Well, that's just life, isn't it?",
		},

        FRUITFLY = "Honestly? They're all yours, mate.",
        LORDFRUITFLY = "Just go for it. I'm not planning on using 'em.",
        FRIENDLYFRUITFLY = "Seems a bit less pest-y than the others.",
        FRUITFLYFRUIT = "I'm the lord of thieves!",

        SEEDPOUCH = "Specifically designed to reject anything useful.",

		-- Crow Carnival
		CARNIVAL_HOST = "Yup. Definitely has camera eyes.",
		CARNIVAL_CROWKID = "They've sent a whole armarda of spies to watch me.",
		CARNIVAL_GAMETOKEN = "Worth one pound in birdseed.",
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "What happened to tryna survive?",
			GENERIC_SMALLSTACK = "I reckon that's enough.",
			GENERIC_LARGESTACK = "I should really get back to digging.",
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "Some little door for things to go in.",
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "Even farming'd be a better use of time than this.",
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_FEEDCHICKS_FOOD = "Gahh, guess I'd better give it to 'em.",

		CARNIVALGAME_MEMORY_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "I suck at remembering pointless things.",
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "Some little card.",
			PLAYING = "Better be this one, or I'm gonna flip.",
		},

		CARNIVALGAME_HERDING_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "At least these eggs aren't fulla nasty goop.",
		},
		CARNIVALGAME_HERDING_CHICK = "Get over here, you little thing.",

		CARNIVALGAME_SHOOTING_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "My eyesight isn't cracked up for this.",
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "Some little door.",
			PLAYING = "My eyesight isn't cracked up for this.",
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "Shooting was never my strong suit.",
		},

		CARNIVALGAME_WHEELSPIN_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "At least this one doesn't involve any effort.",
		},

		CARNIVALGAME_PUCKDROP_KIT = "Why do I have to do all the work??",
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "Looks like I needta pay up.",
			PLAYING = "Looks rigged, I bet.",
		},

		CARNIVAL_PRIZEBOOTH_KIT = "Why do I have to do all the work??",
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "Guess I'd better use those tickets for something.",
		},

		CARNIVALCANNON_KIT = "Why do I have to do all the work??",
		CARNIVALCANNON =
		{
			GENERIC = "Wants my bird tokens.",
			COOLDOWN = "All this wasted material.",
		},

		CARNIVAL_PLAZA_KIT = "Couldn't set it up yourself, could ya?",
		CARNIVAL_PLAZA =
		{
			GENERIC = "Just some funny lookin' tree infested with birds.",
			LEVEL_2 = "Those creepy crowkids keep telling me to build more stuff.",
			LEVEL_3 = "I've succumbed to their desires.",
		},

		CARNIVALDECOR_EGGRIDE_KIT = "Couldn't set it up yourself, could ya?",
		CARNIVALDECOR_EGGRIDE = "Transfixing.",

		CARNIVALDECOR_LAMP_KIT = "If it'll reduce eye strain I'm all for it.",
		CARNIVALDECOR_LAMP = "Good to get some extra lights around the place.",
		CARNIVALDECOR_PLANT_KIT = "Some flimsy little bush.",
		CARNIVALDECOR_PLANT = "I hope it doesn't attract a flock of tiny birds.",
		CARNIVALDECOR_BANNER_KIT = "Not only are the crows spying on me, they're also lazy.",
		CARNIVALDECOR_BANNER = "Bit too fancy for my tastes.",

		CARNIVALDECOR_FIGURE =
		{
			RARE = "Some shiny figurine. Hooray for me.",
			UNCOMMON = "Guess the crow guy is waiting for a whale.",
			GENERIC = "That bird is practically running a casino.",
		},
		CARNIVALDECOR_FIGURE_KIT = "Don't think gambling is illegal out here.",
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "Don't think gambling is illegal out here.",

        CARNIVAL_BALL = "Pretty round and smooth.", --unimplemented
		CARNIVAL_SEEDPACKET = "Those tickets woulda been better used as tinder.",
		CARNIVALFOOD_CORNTEA = "Looks like the crows are tryna poison me. I knew it...",

        CARNIVAL_VEST_A = "Makes me wanna start a dungeoneering adventure.",
        CARNIVAL_VEST_B = "If you can't beat 'em...",
        CARNIVAL_VEST_C = "I've infiltrated their ranks.",

        -- YOTB
        YOTB_SEWINGMACHINE = "That looks like finger pricks just waiting to happen.",
        YOTB_SEWINGMACHINE_ITEM = "It says 'assembly required.' Good for me.",
        YOTB_STAGE = "Funny lookin' guy. Wonder where he came from?",
        YOTB_POST =  "I'm post-caring about all this.",
        YOTB_STAGE_ITEM = "Isn't this meant to be a holiday? Feel like I've been working nonstop.",
        YOTB_POST_ITEM =  "Needs knocking up.",


        YOTB_PATTERN_FRAGMENT_1 = "Bits of haberdashery stuff.",
        YOTB_PATTERN_FRAGMENT_2 = "Bits of haberdashery stuff.",
        YOTB_PATTERN_FRAGMENT_3 = "Bits of haberdashery stuff.",

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "Some fuzzy little thing. Too sweet for me.",
            YOTB = "That weirdo hiding behind the curtain might liketa see it.",
        },

        WAR_BLUEPRINT = "All I need is a red horse.",
        DOLL_BLUEPRINT = "Well, isn't that horrific.",
        FESTIVE_BLUEPRINT = "Too many bright colours, if you ask me.",
        ROBOT_BLUEPRINT = "Hur hur. That one'll look funny.",
        NATURE_BLUEPRINT = "One with nature, or something like that.",
        FORMAL_BLUEPRINT = "Looks a bit tight round the waist.",
        VICTORIAN_BLUEPRINT = "Hur, hur. It even has a funny hat!",
        ICE_BLUEPRINT = "Guess we're gonna put this one in the meat freezer.",
        BEAST_BLUEPRINT = "We can turn a beefalo into an entertainer.",

        BEEF_BELL = "Guess it could be useful for taming those things.",

		-- YOT Catcoon
		KITCOONDEN =
		{
			GENERIC = "Least they won't climb on my head anymore.",
            BURNT = "Don't feel great about that one.",
			PLAYING_HIDEANDSEEK = "Cheeky little buggers...",
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "Quick, I gotta find em!",
		},

		KITCOONDEN_KIT = "No more homeless critters.",

		TICOON =
		{
			GENERIC = "Old fat cat seems to know his way around the place.",
			ABANDONED = "See ya round, I guess.",
			SUCCESS = "He actually did his job.",
			LOST_TRACK = "I was a bit too slow there, I reckon.",
			NEARBY = "We're making some progress, finally.",
			TRACKING = "Guess I oughta follow it.",
			TRACKING_NOT_MINE = "Someone else got to him first.",
			NOTHING_TO_TRACK = "Looks like I'm done and dusted.",
			TARGET_TOO_FAR_AWAY = "Ol' Sniffington here can't smell anything nearby.",
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "Gotta get crafty.",
            EMPTY = "Wants a feather. Always glad to get rid of em.",
            BURNT = "Stuff happens, y'know?",
        },

		KITCOON_FOREST = "Funny little fuzzball, aren'tcha?",
		KITCOON_SAVANNA = "Funny little fuzzball, aren'tcha?",
		KITCOON_MARSH = "Just don't get hair everywhere, okay?",
		KITCOON_DECIDUOUS = "Funny little fuzzball, aren'tcha?",
		KITCOON_GRASS = "Funny little fuzzball, aren'tcha?",
		KITCOON_ROCKY = "Just don't get hair everywhere, okay?",
		KITCOON_DESERT = "Just don't get hair everywhere, okay?",
		KITCOON_MOON = "Just don't get hair everywhere, okay?",
		KITCOON_YOT = "Just don't get hair everywhere, okay?",

        -- Moon Storm
        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "I think I'm getting sidetracked. Big rocky balls aren't on my to-do list...",
            DEAD = "Okay, now I can get back to it...",
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "There's more??? Gah!!",
            DEAD = "That's gotta be everything, right? Right??",
        },
        ALTERGUARDIAN_PHASE2SPIKE = "Wouldn't wanna get shanked.",
        ALTERGUARDIAN_PHASE3 = "This is getting ridiculous, I reckon.",
        ALTERGUARDIAN_PHASE3TRAP = "That would mess me up real good.",
        ALTERGUARDIAN_PHASE3DEADORB = "I don't trust this thing when it's 'dead.'",
        ALTERGUARDIAN_PHASE3DEAD = "I can finally, finally, get back to it. I hope.",

        ALTERGUARDIANHAT = "This makes me feel pretty powerful. I kinda like it...",
        ALTERGUARDIANHATSHARD = "I ripped that tiara to pieces.",

        MOONSTORM_GLASS = {
            GENERIC = "Wouldn't wanna cut myself with that.",
            INFUSED = "Hope it doesn't explode and fill me with tiny bits."
        },

        MOONSTORM_STATIC = "Wacky magic junk. It's making my antennas feel funny.",
        MOONSTORM_STATIC_ITEM = "There's a lotta interference coming from that thing.",
        MOONSTORM_SPARK = "Strange. I'm getting plenty a weird images from this.",

        BIRD_MUTANT = "Gahh! What a horrid-looking watcher.",
        BIRD_MUTANT_SPITTER = "They're not even trying anymore. That's obviously a spy!",

        WAGSTAFF_NPC = "What? Who is that?",

        WAGSTAFF_NPC_MUTATIONS = "Hm. This guy again.",
        WAGSTAFF_NPC_WAGPUNK = "Bye, I suppose.",

        ALTERGUARDIAN_CONTAINED = "That shifty old guy. Course he was up to something.",

        WAGSTAFF_TOOL_1 = "Looks like a stethoscope for robots.",
        WAGSTAFF_TOOL_2 = "Records something-or-others on the whatever spectrum.",
        WAGSTAFF_TOOL_3 = "I don't have time for reading some old guy's diary.",
        WAGSTAFF_TOOL_4 = "A swiss army knife for nerds.",
        WAGSTAFF_TOOL_5 = "Looks like a key for a wild-looking lock.",

        MOONSTORM_GOGGLESHAT = "Keeps my visor free from moon dust.",

        MOON_DEVICE = {
            GENERIC = "Note to self: never trust old people in lab coats.",
            CONSTRUCTION1 = "Looks like things are just starting up.",
            CONSTRUCTION2 = "We're getting somewhere, alright.",
        },

		-- Wanda
        POCKETWATCH_HEAL = {
			GENERIC = "Full of turning gears and grinding cogs. Bit like my tapes, really.",
			RECHARGING = "Bit like me after a lot of entertaining.",
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "Full of turning gears and grinding cogs. Bit like my tapes, really.",
			RECHARGING = "Bit like me after a lot of entertaining.",
		},

        POCKETWATCH_WARP = {
			GENERIC = "Full of turning gears and grinding cogs. Bit like my tapes, really.",
			RECHARGING = "Needs a bit of time to re-jig.",
		},

        POCKETWATCH_RECALL = {
			GENERIC = "Full of turning gears and grinding cogs. Bit like my tapes, really.",
			RECHARGING = "Needs a bit of time to re-jig.",
			UNMARKED = "only_used_by_wanda",
			MARKED_SAMESHARD = "only_used_by_wanda",
			MARKED_DIFFERENTSHARD = "only_used_by_wanda",
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "Full of turning gears and grinding cogs. Bit like my tapes, really.",
			RECHARGING = "Needs a bit of time to re-jig.",
			UNMARKED = "only_used_by_wanda unmarked",
			MARKED_SAMESHARD = "only_used_by_wanda same shard",
			MARKED_DIFFERENTSHARD = "only_used_by_wanda other shard",
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "She's the most violent... old... lady I've ever met.",
			DEPLETED = "only_used_by_wanda",
		},

        POCKETWATCH_PARTS = "Can't lie, I've definitely got a thing for old tech.",
        POCKETWATCH_DISMANTLER = "I'm staying far, far away from those.",

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "Guess we're doing this all again, huh?",
			DIFFERENTSHARD = "Guess we're doing this all again, huh?",
		},
        POCKETWATCH_PORTAL_EXIT = "Land with your knees, not your back.",

        -- Waterlog
        WATERTREE_PILLAR = "Nature is good at reclaiming. And getting big.",
        OCEANTREE = "That tree needs ta be put back in it's place.",
        OCEANTREENUT = "I could grow my own tropical getaway.",
        WATERTREE_ROOT = "That'd make a right big gash in my boat.",

        OCEANTREE_PILLAR = "Cheap copies are never as good as the first one.",

        OCEANVINE = "Don't think I have the upper core strength to swing on it.",
        FIG = "Almost gives me the urge to do a little rag.",
        FIG_COOKED = "Lots of tiny, yucky seeds in that.",

        SPIDER_WATER = "Thought I was safe from them out here. Guess not.",
        MUTATOR_WATER = "Almost makes me glad I can't eat food.",
        OCEANVINE_COCOON = "If it burst, we'd be having a spider shower.",
        OCEANVINE_COCOON_BURNT = "Can't say I'm not glad, to be honest.",

        GRASSGATOR = "If I had hair it'd probably look like that, hur hur.",

        TREEGROWTHSOLUTION = "Food for trees, not for me.",

        FIGATONI = "Pastry, full of fruit, full of seeds.",
        FIGKABAB = "The sticks look like the best part, I reckon.",
        KOALEFIG_TRUNK = "I don't think the chef scraped all the mucus out.",
        FROGNEWTON = "More sandwiches with legs. Fannnntastic.",

        -- The Terrorarium
        TERRARIUM = {
            GENERIC = "This thing runs at a very low resolution.", --tvquote
            CRIMSON = "It's got a funny red filter over it.",
            ENABLED = "I think it has the wrong aspect ratio.",
			WAITING_FOR_DARK = "Needs to wait for the luma to be low.",
			COOLDOWN = "Needs to be rewound, if you ask me.",
			SPAWN_DISABLED = "No more unwanted staring contests.",
        },

        -- Wolfgang --WAYPOINT 5/11/22
        MIGHTY_GYM =
        {
            GENERIC = "Dunno if working out will make any difference to me.",
            BURNT = "Someone really had a hot streak going. Hur hur.",
        },

        DUMBBELL = "Wouldn't wanna break any precious body parts.",
        DUMBBELL_GOLDEN = "Gold's pretty precious. Wouldn't wanna dent it.",
		DUMBBELL_MARBLE = "Well, isn't that Grecian. The emperors would be proud.",
        DUMBBELL_GEM = "Seems like a bit of a waste. It's just a lifting weight.",
        POTATOSACK = "Big sack of junk. Not very sophisticated.",

        DUMBBELL_HEAT = "Hybrid technology, or just a couple of rocks?",
        DUMBBELL_REDGEM = "Ahh... Wouldn't want to put too much strain on myself.",
        DUMBBELL_BLUEGEM = "I'd definitely seize up if I tried using that.",

        TERRARIUMCHEST =
		{
			GENERIC = "Reckon it might be fulla precious things to nab...",
			BURNT = "Hopefully all the loot didn't get singed.",
			SHIMMER = "Hmm. Something's funny bout that chest.",
		},

		EYEMASKHAT = "'S a bit fleshy, but if it'll keep me safe I can't complain.",

        EYEOFTERROR = "Ahhh, crud it. What made me summon this thing?!",
        EYEOFTERROR_MINI = "I'm never safe from the watchers' gaze!!",
        EYEOFTERROR_MINI_GROUNDED = "Keeps spewin' out baby watchers.",

        FROZENBANANADAIQUIRI = "Made with eyeball goop. Don't think I'll be ingesting it.",
        BUNNYSTEW = "The bunny got stewed. Hur, hur.",
        MILKYWHITES = "Gahh, it's sticking to my hands!",

        CRITTER_EYEOFTERROR = "Now the watchers'll think I'm allied to them. Right??",

        SHIELDOFTERROR ="Feels nice having a big mouth to protect me.",
        TWINOFTERROR1 = "I'm such a threat, they've sent an even tougher watcher to find me!!",
        TWINOFTERROR2 = "I'm such a threat, they've sent an even tougher watcher to find me!!",

        -- Cult of the Lamb
		COTL_TRINKET = "Crowns aren't really designed for TVs.",
		TURF_COTL_GOLD = "Excess. How humanistic.",
		TURF_COTL_BRICK = "Easier underfoot than most things.",
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "Well, that's nice.",
			GENERIC = "S' out cold.",
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "Fills my heart with an odd sort of warmth.",
			GENERIC = "S' out cold.",
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "Maybe I could take the time to sit...",
			GENERIC = "S' out cold.",
		},

        -- Year of the Catcoon
        CATTOY_MOUSE = "Simple games keep simple minds entertained.",
        KITCOON_NAMETAG = "... Oh, s'not for me to wear?", --catboy freddo reference (real)

		KITCOONDECOR1 =
        {
            GENERIC = "Hur hur hur. Looks like a bowling pin.",
            BURNT = "I thought bowling pins were fireproof.",
        },
		KITCOONDECOR2 =
        {
            GENERIC = "S'a funny little thing.",
            BURNT = "Burnt to a crisp.",
        },

		KITCOONDECOR1_KIT = "Guhh... too much effort for me.",
		KITCOONDECOR2_KIT = "Looks simple to make, but I dunno if I can be bothered.",

        -- WX78
        WX78MODULE_MAXHEALTH = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MAXSANITY1 = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MAXSANITY = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MOVESPEED = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MOVESPEED2 = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_HEAT = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_NIGHTVISION = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_COLD = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_TASER = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_LIGHT = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MAXHUNGER1 = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MAXHUNGER = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MUSIC = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_BEE = "Pretty cool tech. Too bad it's way too advanced for me.",
        WX78MODULE_MAXHEALTH2 = "Pretty cool tech. Too bad it's way too advanced for me.",

        WX78_SCANNER =
        {
            GENERIC ="I'm pretty sure it's not spying on me...",
            HUNTING = "A busy drone, just like me. We're practically best friends.",
            SCANNING = "Go, best mate, go!",
        },

        WX78_SCANNER_ITEM = "It's in shutdown mode. Wish I could join it right now.",
        WX78_SCANNER_SUCCEEDED = "Looks like someone's been busy.",

        WX78_MODULEREMOVER = "Jeez. Keep that thing away from me, please and thanks.",

        SCANDATA = "Yuck. It's kinda squishy.",

        -- QOL 2022
		JUSTEGGS = "'S not an improvement at all.",
		VEGGIEOMLET = "'Healthy.' Guhh.",
		TALLEGGS = "Looks fancy, but I'm still not going to eat it.",
		BEEFALOFEED = "At least someone'll enjoy this food.",
		BEEFALOTREAT = "Couldn't be that much worse than normal food.",

        -- Pirates
        BOAT_ROTATOR = "I can turn my boat around. Whoop-dee doo.",
        BOAT_ROTATOR_KIT = "Looks like too much work to set up for what it's worth.",
        BOAT_BUMPER_KELP = "Makes me feel a bit safer. Emphasis on 'a bit.'",
        BOAT_BUMPER_KELP_KIT = "Should definitely knock this beauty up.",
        BOAT_BUMPER_SHELL = "Makes the ocean feel a little less terrible.",
        BOAT_BUMPER_SHELL_KIT = "Should definitely knock this beauty up.",
        BOAT_BUMPER_CRABKING = "I'm the king of the seas with these.",
        BOAT_BUMPER_CRABKING_KIT = "Just as long as we don't sink after putting them on.",

        BOAT_CANNON = {
            GENERIC = "Needs to be loaded up.",
            AMMOLOADED = "Spudgun ready to fire!",
            NOAMMO = "Ahhh... guhh, I'm out.",
        },
        BOAT_CANNON_KIT = "Cannon needs construction.",
        CANNONBALL_ROCK_ITEM = "It's pretty much just a rock with gunpowder in it.",

        OCEAN_TRAWLER = {
            GENERIC = "Means I don't have to waste my time, I guess.",
            LOWERED = "Never was good at that whole 'patience' thing.",
            CAUGHT = "Fulla fish. I'm sure someone else could make use of them.",
            ESCAPED = "The catch got away. Doesn't really bother me.",
            FIXED = "Fixed up and ready for some serious catching.",
        },
        OCEAN_TRAWLER_KIT = "It'll save time fishing. Not that I was planning on it.",

        BOAT_MAGNET =
        {
            GENERIC = "Can use this to couple up some of my death rafts.",
            ACTIVATED = "Shouldn't stand so close to it...",
        },
        BOAT_MAGNET_KIT = "As long as it doesn't erase my memory...",

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "The negative terminals are all on this one.",
            ACTIVATED = "I reckon I'd better keep my distance.",
        },
        DOCK_KIT = "Dock's a whole lot better than just more water.",
        DOCK_WOODPOSTS_ITEM = "Seems important.",

        MONKEYHUT =
        {
            GENERIC = "Wonder if they've got TV. And telephone. Or even fax.", --myhome@monkey.com.au
            BURNT = "One less home for the poop throwers.",
        },
        POWDER_MONKEY = "I'm fine with thieves, s'long as they don't take what's mine.",
        PRIME_MATE = "Thisun looks like the big boss.",
		LIGHTCRAB = "We both hide away in our respective shells.",
        CUTLESS = "Hur hur. What a dumb weapon.",
        CURSED_MONKEY_TOKEN = "Reckon it might look alright on me.",
        OAR_MONKEY = "For banana-induced paddle frenzies.",
        BANANABUSH = "Bananas are even mushier than berries.",
        DUG_BANANABUSH = "Reckon someone else'd get more use out of it.",
        PALMCONETREE = "The perfect backdrop for a tropical slasher film.",
        PALMCONE_SEED = "Can grow my very own slasher set.",
        PALMCONE_SAPLING = "A living backdrop in the works.",
        PALMCONE_SCALE = "That romantic tropical style never goes out of fashion.",
        MONKEYTAIL = "Looks tropical. And like useful material.",
        DUG_MONKEYTAIL = "Looks tropical. And like useful material.",

        MONKEY_MEDIUMHAT = "Looks alright. Not that I'm a fashionista.",
        MONKEY_SMALLHAT = "This is just some rag that smells like bananas.",
        POLLY_ROGERSHAT = "I'm always happy to, ehm, source some labour.",
        POLLY_ROGERS = "My little helper has arrived.",

        MONKEYISLAND_PORTAL = "I've learned not to trust swirly portals around here...",
        MONKEYISLAND_PORTAL_DEBRIS = "'F you ask me, someone's been tinkering with this stuff.",
        MONKEYQUEEN = "Maybe once I'm done with my 'work' out here, I could aspire to be like that.",
        MONKEYPILLAR = "Strong enough to support two tons of monkey.",
        PIRATE_FLAG_POLE = "S'definitely not a good sign.",

        BLACKFLAG = "Feels like it's tempting me to go do something mischevious.",
        PIRATE_STASH = "Aha! More buried goodies for me!",
        STASH_MAP = "It's been so long, I've almost forgotten how to use paper maps.",

        BANANAJUICE = "A slurry of sticky mush. Let's not do anything rash.",

        FENCE_ROTATOR = "For all my re-posting needs. Which is to say, nothing.",

        CHARLIE_STAGE_POST = "Looks like a decent spot to show everyone what a good entertainment drone I am.",
        CHARLIE_LECTURN = "Stageplays are a bit before my time. Still, could be fun.",

        CHARLIE_HECKLER = "The watchers are wearing masks. Pff, you think that'll fool me?",

        PLAYBILL_THE_DOLL = "Alright, I'd better rehearse my lines before we start.",
        PLAYBILL_THE_VEIL = "Alright, I'd better rehearse my lines before we start.",
        STATUEHARP_HEDGESPAWNER = "Still headless. I'm safe for now.",
        HEDGEHOUND = "Gahh! I shouldn'ta hedged my bets!",
        HEDGEHOUND_BUSH = "Just some more plant life. Nothing to pay attention to.",

        MASK_DOLLHAT = "A mask for some creepy doll. I don't like it.",
        MASK_DOLLBROKENHAT = "A mask for some creepy cracked doll. I don't like it.",
        MASK_DOLLREPAIREDHAT = "A mask for some creepy smashed doll. I don't like it.",
        MASK_BLACKSMITHHAT = "A blacksmith mask. I don't like it.",
        MASK_MIRRORHAT = "Masks like that bring back some awful memories.",
        MASK_QUEENHAT = "A mask for some queen. I don't like it.",
        MASK_KINGHAT = "He definitely thought of himself as a 'king,' heh.",
        MASK_TREEHAT = "A tree-looking mask. I don't like it.",
        MASK_FOOLHAT = "For a second I thought that was... no.", --MASK_FOOLHAT = "S' a mask for some idiot.",

        COSTUME_DOLL_BODY = "It's some garb for a doll.",
        COSTUME_QUEEN_BODY = "It's some garb for a queen.",
        COSTUME_KING_BODY = "It's some garb for a king.",
        COSTUME_BLACKSMITH_BODY = "It's some garb for a smith.",
        COSTUME_MIRROR_BODY = "It's some garb for a... something.",
        COSTUME_TREE_BODY = "It's some garb for a tree.",
        COSTUME_FOOL_BODY = "Goes with an eerie mask.",

        STAGEUSHER =
        {
            STANDING = "Gah! Gave me a fright, that did.",
            SITTING = "Someone's been flexing their Greco-Roman muscle out in the wilderness.",
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "I've got a bit more function than that drone.",
            BURNT = "It doesn't have any function left.",
        },

        -- Waxwell
		MAGICIAN_CHEST = "I wasn't sure if me getting dizzy was possible. Now I know.",
		TOPHAT_MAGICIAN = "S' a pretty unusual hat, if you ask me.",

                -- Year of the Rabbit
        YOTR_FIGHTRING_KIT = "Why've I gotta do everything round here?",
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "Looks like the time for battle is over.",
            PLAYING = "Come get some, you big loaves!",
        },

        YOTR_DECOR_1 = {
            GENERAL = "A rock hard happy face, cast in stone.",
            OUT = "All snuffed out.",
        },
        YOTR_DECOR_2 = {
            GENERAL = "A rock hard happy face, cast in stone.",
            OUT = "All snuffed out.",
        },

        HAREBALL = "Nope. No thanks. Nah.",
        YOTR_DECOR_1_ITEM = "Guess I'm slowly becoming some sorta statue collector.",
        YOTR_DECOR_2_ITEM = "Guess I'm slowly becoming some sorta statue collector.",

        --
		DREADSTONE = "Dunno if a geology degree would really help me here.",
		HORRORFUEL = "What a stench. Sealing wax and putty.",
		DAYWALKER =
		{
			GENERIC = "Wh- hang on! I was tryna help you, you knobhead!",
			IMPRISONED = "Ahh. Poor mate, those chains don't look comfy.",
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "Something tells me this a bit different from all that other marble.",
			EXPOSED = "Gahh, it's making my head hurt.",
		},
        DAYWALKER2 =
		{
			GENERIC = "Guh. This knob again.",
			BURIED = "Looks like he's stuck. Maybe that's for the best.",
			HOSTILE = "What did I do to you?? Pillock.",
		},
		ARMORDREADSTONE = "Uncomfortable, but protective. Sacrifices must be made.",
		DREADSTONEHAT = "Whoever made this's never heard of 'ergonomics.'",

        -- Rifts 1
        LUNARRIFT_PORTAL = "Jeeez. Well, isn't that a mind-bending thing.",
        LUNARRIFT_CRYSTAL = "The hoarder in me is screaming to get mining.",

        LUNARTHRALL_PLANT = "Prickly business, this is.",
        LUNARTHRALL_PLANT_VINE_END = "Gahh!! Get off me, you ratbag!",

		LUNAR_GRAZER = "Goes splat like a rotten egg.",

        PUREBRILLIANCE = "I'm not very well versed in space rocks.",
        LUNARPLANT_HUSK = "Didn't think plants were meant to be this tough.",

		LUNAR_FORGE = "I feel like this is detracting from my objective a little bit...",
		LUNAR_FORGE_KIT = "More busywork. My favourite.",

		LUNARPLANT_KIT = "Does this count as haberdashery or smithing?",
        ARMOR_LUNARPLANT = "Not as heavy as you'd think. I like it.",
		LUNARPLANTHAT = "If I ever get stuck in a well, I've got a way out now.", --I appear to be in a bit of a pickle
		BOMB_LUNARPLANT = "After I throw it, I'll be sure to look away fast.",
		STAFF_LUNARPLANT = "An optical stick for blasting things away.",
		SWORD_LUNARPLANT = "Retina-singeing sharpness.",
		PICKAXE_LUNARPLANT = "Got quite a bit of heft to it.", --like my co-
		SHOVEL_LUNARPLANT = "It's better than unempowered grunt-work. Marginally.",

        BROKEN_FORGEDITEM = "It'd mean extra work, but... I could fix that up.",

        PUNCHINGBAG = "Finally, someone to act as the resident punching bag. Besides me.",

        -- Rifts 2
        SHADOWRIFT_PORTAL = "I'll try to keep my step.",

		SHADOW_FORGE = "It's got a lot more hands than the average workstation.",
		SHADOW_FORGE_KIT = "Everything comes in a 'kit' nowadays.",

        FUSED_SHADELING = "Gahh!! Well, now I know who'll be plagueing my nightmares.",
        FUSED_SHADELING_BOMB = "I'd best not get hit by that.",

		VOIDCLOTH = "Just some rags. What's the big deal?",
        VOIDCLOTH_KIT = "Don't know how easy sewing up holes in darkness will be.",
		VOIDCLOTHHAT = "Won't protect me from all the judgemental stares.",
		ARMOR_VOIDCLOTH = "... I'm definitely not a haberdashery drone.",

        VOIDCLOTH_UMBRELLA = "Great. Now my carapace won't melt right off me.",
        VOIDCLOTH_SCYTHE = "May the saints look away.",

		SHADOWTHRALL_HANDS = "Don't leave me hanging.",
		SHADOWTHRALL_HORNS = "Gah! What sewer did you crawl out of?",
		SHADOWTHRALL_WINGS = "Projectile vomiting's a little bit rude.",
        SHADOWTHRALL_MOUTH = "Someone needs a breath mint.",

        CHARLIE_NPC = "So many new people. Sorry, I got no time for formalities.",
        CHARLIE_HAND = "Suspicious.",

        NITRE_FORMATION = "Yup. S'definitely a rock.",
        DREADSTONE_STACK = "My unexpected lessons in geology continue...",

        SCRAPBOOK_PAGE = "Cutting and pasting was always a little too tactile for me.",

        LEIF_IDOL = "...It isn't watching me, is it??",
        WOODCARVEDHAT = "War, in a land of immortality.", --im in my birthday suit!
        WALKING_STICK = "Ah. That takes some of the strain off my back.",

        IPECACSYRUP = "I wouldn't feed this to my worst enemy.",
        BOMB_LUNARPLANT_WORMWOOD = "Plant themed explosives. What a concept.", -- Unused
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "That carrat got diced up.",
        	GENERIC = "I'd feel bad about eating this thing no matter what.",
        	HELD = "Yep. That's definitely a carrot-rat.",
        	SLEEPING = "If I was that chef guy, I'd take this opportunity to throw you into a stew.",
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "It'd be pretty annoying if it wasn't useful.",
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "Natural life can be so aggressive. Why don'tcha just chill out?",
			RIPE = "That thing's red angry hot.",
			SLEEPING = "Some peace and quiet at last.",
		},

        SUPPORT_PILLAR_SCAFFOLD = "Construction. My favourite.",
        SUPPORT_PILLAR = "Progress is progress, I guess.",
        SUPPORT_PILLAR_COMPLETE = "My skull is safe from flying rocks. For now.",
        SUPPORT_PILLAR_BROKEN = "It's ruined and decrepit.",

        SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "Construction. My favourite.",
		SUPPORT_PILLAR_DREADSTONE = "Progress is progress, I guess.",
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "Not a bad use for those strange rocks.",
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "It's drained and destroyed.",

        WOLFGANG_WHISTLE = "I'm in a world full of horrors, and I'm still not free from exercise.",

        -- Rifts 3

        MUTATEDDEERCLOPS = "And I thought *my* big, glassy eye was scary...",
        MUTATEDWARG = "Well, isn't this just awful.",
        MUTATEDBEARGER = "Probably not worth bothering, I don't think.",

        LUNARFROG = "Two eyes are enough, I'll be honest.",

        DEERCLOPSCORPSE =
        {
            GENERIC  = "Whew. And that's that.",
            BURNING  = "Yeah. This is probably for the best.",
            REVIVING = "No- This is too dangerous for me!",
        },

        WARGCORPSE =
        {
            GENERIC  = "I hate this. I really, really, hate this.",
            BURNING  = "Can never be too careful.",
            REVIVING = "Gahh!! That's the final straw!",
        },

        BEARGERCORPSE =
        {
            GENERIC  = "This is horrible. Totally horrible.",
            BURNING  = "I think Willow might be onto something, heh.",
            REVIVING = "Wait- I thought we were done!",
        },

        BEARGERFUR_SACK = "Portable food storage. I'll stick with my tapes, thanks.",
        HOUNDSTOOTH_BLOWPIPE = "Fighting at range?... Now this I like.",
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "Brrrrr... That's quite breezy.",    -- Enabled.
            NOEYEBALL = "Needs re-jigging.",  -- Disabled.
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "Needs assembling.",

        SECURITY_PULSE_CAGE = "An empty cage? This's my reward for all that fighting?",
        SECURITY_PULSE_CAGE_FULL = "I don't really see what I'm meant to do with this.",

		CARPENTRY_STATION =
        {
            GENERIC = "A chance to flex my inner craftsman. (I don't have an inner craftsman.)",
            BURNT = "Burnt and smoldering remains.",
        },

        WOOD_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "Ah. Somewhere to rest my elbows.",
            HAS_ITEM = "Ah. Somewhere to rest my elbows.",
            BURNT = "Not very good for resting now.",
        },

        WOOD_CHAIR =
        {
            GENERIC = "Some relief for my poor back.",
            OCCUPIED = "Not exactly ergonomic, is it?",
            BURNT = "Might as well sit on the floor.",
        },

        DECOR_CENTERPIECE = "Rocks. Brilliant.",
        DECOR_LAMP = "Homely.",
        DECOR_FLOWERVASE =
        {
            GENERIC = "I think I need a break from all this foliage, honestly.",
            EMPTY = "Quaint little thing.",
            WILTED = "Parched. Might need refreshing.",
            FRESHLIGHT = "Well, isn't that nice.",
            OLDLIGHT = "How many drones does it take to replace a lightbulb?",
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "Someone's vision made reality.",
            UNDRAWN = "A blank canvas, ready to be shaped to my vision.",
        },
        DECOR_PORTRAITFRAME = "Interesting.",

        PHONOGRAPH = "Glad I don't have to do *all* the entertaining around here.",
        RECORD = "I could tap my foot to this.", --ragtime?
        RECORD_CREEPYFOREST = "Well, it's a bit archaic. But I like it.",
        RECORD_DANGER = "Makes me feel a bit on edge.",
        RECORD_DAWN = "Old things like this have so much charm.",
        RECORD_DRSTYLE = "Well, it's a bit archaic. But I like it.",
        RECORD_DUSK = "Old things like this have so much charm.",
        RECORD_EFS = "Hm. Nice composition.",
        RECORD_END = "Well, it's a bit archaic. But I like it.",
        RECORD_MAIN = "Old things like this have so much charm.",
        RECORD_WORKTOBEDONE = "Hm. Nice composition.",
        RECORD_HALLOWEDNIGHTS = "Ooky, and oh so spooky.",

        ARCHIVE_ORCHESTRINA_MAIN = "Well, that definitely gets the gears in my head going.",

        WAGPUNKHAT = "Another carapace to take the brunt force.",
        ARMORWAGPUNK = "A better, harder, stronger, outer shell.",
        WAGSTAFF_MACHINERY = "Lots of old abandoned stuff out here.",
        WAGPUNK_BITS = "Ooh, more strange old things. They're mine now.",
        WAGPUNKBITS_KIT = "In case of emergencies.",

        WAGSTAFF_MUTATIONS_NOTE = "Blah, blah, blah. I hate reading.",

        -- Meta 3

        BATTLESONG_INSTANT_REVIVE = "Makes my heart skip a beat. Or several.",

        WATHGRITHR_IMPROVEDHAT = "Looks protective, if a bit tough on the neck.",
        SPEAR_WATHGRITHR_LIGHTNING = "That's a short circuit waiting to happen.",

        BATTLESONG_CONTAINER = "Storage. Maybe I could take a leaf from her book.",

        SADDLE_WATHGRITHR = "I'm far too bony for this riding nonsense.",

        WATHGRITHR_SHIELD = "Doubt I'm strong enough to wield that.",

        BATTLESONG_SHADOWALIGNED = "Offensive entertainment? Sounds good to me.",
        BATTLESONG_LUNARALIGNED = "Offensive entertainment? Sounds good to me.",

		SHARKBOI = "Gahh! It's just a fishing hole, mate!",
        BOOTLEG = "Hmm. Maybe it's some kinda cursed token?",
        OCEANWHIRLPORTAL = "This ocean's truly an awful place.",

        EMBERLIGHT = "Convenient - I don't have to do my back in hauling wood!",
        WILLOW_EMBER = "only_used_by_willow",

        -- Year of the Dragon
        YOTD_DRAGONSHRINE =
        {
            GENERIC = "Offerings... When's someone going to give *me* an offering?",
            EMPTY = "Needs charcoal, if you ask me.",
            BURNT = "Carbonic.",
        },

        DRAGONBOAT_KIT = "Guhhh. Manual labour...",
        DRAGONBOAT_PACK = "My hands'll be all calloused given enough of this.",

        BOATRACE_CHECKPOINT = "Checkpoint's in sight.",
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "Just another meaningless task.",
        BOATRACE_START = "This must be where we launch off.",
        BOATRACE_START_THROWABLE_DEPLOYKIT = "Gotta rack my brains for where to put this.",

        BOATRACE_PRIMEMATE = "Gah! Get away from me and my tapes!",
        BOATRACE_SPECTATOR_DRAGONLING = "Thanks for the moral support, mate.",

        YOTD_STEERINGWHEEL = "Maybe I should learn to swim.",
        YOTD_STEERINGWHEEL_ITEM = "Needs knocking up.",
        YOTD_OAR = "If anyone threatens me, I'll whack them with it.",
        YOTD_ANCHOR = "That's just gonna add more weight to the boat.",
        YOTD_ANCHOR_ITEM = "Time for a bit of construction.",
        MAST_YOTD = "That'll catch the wind right, I reckon.",
        MAST_YOTD_ITEM = "I'll be a master at building after this.",
        BOAT_BUMPER_YOTD = "Good for skewerin'.",
        BOAT_BUMPER_YOTD_KIT = "I should try not to skewer myself.",
        BOATRACE_SEASTACK = "I guess all the 'guirls' are at the bottom of the ocean.",
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "I guess all the 'guirls' are at the bottom of the ocean.",
        BOATRACE_SEASTACK_MONKEY = "I guess all the 'guirls' are at the bottom of the ocean.",
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "I guess all the 'guirls' are at the bottom of the ocean.",
        MASTUPGRADE_LAMP_YOTD = "Gives a cozy feel.",
        MASTUPGRADE_LAMP_ITEM_YOTD = "That'll be nice when it's set up.",
        WALKINGPLANK_YOTD = "A fancy way to... execute people. Lovely.",
        CHESSPIECE_YOTD = "In a game of chess, the boat swims outside the chessboard and penetrates enemy lines.",

        -- Rifts / Meta QoL

        HEALINGSALVE_ACID = "This'll keep me safe and sealed.",

        BEESWAX_SPRAY = "Best be careful not to spray myself.",
        WAXED_PLANT = "Frozen. I almost feel bad for it.", -- Used for all waxed plants, from farm plants to trees.

        STORAGE_ROBOT = {
            GENERIC = "Someone to sort out my mountains of rubbish. I'll cheers to that.",
            BROKEN = "Gah. Poor mate is busted up.",
        },

        SCRAP_MONOCLEHAT = "Wearing that's a mind-bending experience.",
        SCRAPHAT = "Seems like a hefty load to bear.",

        FENCE_JUNK = "More rubbish to surround myself with.",
        JUNK_PILE = "Looks like a goldmine in there! Better get rummaging.",
        JUNK_PILE_BIG = "I think I've hit the jackpot!",

        ARMOR_LUNARPLANT_HUSK = "Didn't know vines were 'in.'",

        -- Meta 4 / Ocean QoL

        OTTER = "I wonder if otters accept bribes?",
        OTTERDEN = {
            GENERIC = "Empty. I'll come back later.",
            HAS_LOOT = "My thief instincs are tingling.",
        },
        OTTERDEN_DEAD = "I should ditch this.",

        BOAT_ANCIENT_ITEM = "Woahh. This must be a relic or something.",
        BOAT_ANCIENT_CONTAINER = "Stowage for all my stuff. That'll save my back.",
        WALKINGPLANK_ANCIENT = "Hope I never have to use that.",

        ANCIENTTREE_SEED = "Hm. I got the feeling this tree might grow something useful.",

        ANCIENTTREE_GEM = {
            GENERIC = "This is itching to have a documentary made about.",
            STUMP = "Can't document it anymore.",
        },

        ANCIENTTREE_SAPLING_ITEM = "Wonder where I oughta plant this.",

        ANCIENTTREE_SAPLING = {
            GENERIC = "Well, hey. There's some progress.",
            WRONG_TILE = "Nah. Something seems off, environment-wise.",
            WRONG_SEASON = "Something's off. Must be a seasonal thing.",
        },

        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "Jeez. That's a sinister looking tree.",
            STUMP = "Such is life.",
        },

        ANCIENTFRUIT_GEM = "Yowzers. It's hot.",
        ANCIENTFRUIT_NIGHTVISION = "Fruit isn't s'posed to wriggle!",
        ANCIENTFRUIT_NIGHTVISION_COOKED = "Do I really have to eat this?",

        BOATPATCH_KELP = "Is this really what I'm trusting with my life?",

        CRABKING_MOB = "What a little ankle-nipper!",
        CRABKING_MOB_KNIGHT = "It's upgraded from nipping ankles to elbows!",
        CRABKING_CANNONTOWER = "Cowardly tactics. Maybe I should take note.",
        CRABKING_ICEWALL = "Just another barrier in my way.",

        SALTLICK_IMPROVED = "Now that's GOT to be bad for electronics.",

        OFFERING_POT =
        {
            GENERIC = "A communal breakfast bowl. Gross.",
            SOME_KELP = "It's running out. Not that it's my business.",
            LOTS_OF_KELP = "Sharing food is so disgusting.",
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "A communal breakfast bowl. Gross.",
            SOME_KELP = "It's running out. Not that it's my business.",
            LOTS_OF_KELP = "Sharing food is so disgusting.",
        },

        MERM_ARMORY = "Those sticks and rocks will sure be breaking someone's bones.",
        MERM_ARMORY_UPGRADED = "Those sticks and rocks will sure be breaking someone's bones.",
        MERM_TOOLSHED = "I'll stick to my tools that actually, yknow. Work.",
        MERM_TOOLSHED_UPGRADED = "I'll stick to my tools that actually, yknow. Work.",
        MERMARMORHAT = "It's barely holding together.",
        MERMARMORUPGRADEDHAT = "It's barely holding together.",
        MERM_TOOL = "I guess the quality of the tool doesn't matter, with primal rage in the picture.",
        MERM_TOOL_UPGRADED = "I guess the quality of the tool doesn't matter, with primal rage in the picture.",

        WURT_SWAMPITEM_SHADOW = "I sure hope she doesn't weigh the same as a duck.",
        WURT_SWAMPITEM_LUNAR = "I sure hope she doesn't weigh the same as a duck.",

        MERM_SHADOW = "Aren't you a bit young to be practising witchcraft?",
        MERMGUARD_SHADOW = "Aren't you a bit young to be practising witchcraft?",

        MERM_LUNAR = "I thought magic was only for the oldies around here. Hur hur hur.",
        MERMGUARD_LUNAR = "I thought magic was only for the oldies around here. Hur hur hur.",

        -- Rifts 4

        SHADOW_BEEF_BELL = "It rings with an otherworldly sound.",
        SADDLE_SHADOW = "Doesn't look like a very comfortable ride.",
        SHADOW_BATTLEAXE = "I'm not built for combat... but I might not need to be anymore.",
        VOIDCLOTH_BOOMERANG = "It zips straight back into my hand after I throw it... weird.",
		ROPE_BRIDGE_KIT = "I do not trust this.",
		GELBLOB =
		{
			GENERIC = "That thing'd better not be corrosive.",
			HAS_ITEM = "Gah, hey! That's mine!",
			HAS_CHARACTER = "Uh oh. Should prolly get em out.",
		},
        RABBITKING_AGGRESSIVE = "Get away, you rabid ankle-biter!",
        RABBITKING_PASSIVE = "I bow to no-one... but I'd be happy to trade.",
        RABBITKING_LUCKY = "I'd better catch it. Quick!",
        RABBITKINGMINION_BUNNYMAN = "Time to wipe that awful smirk off your face.",
        ARMOR_CARROTLURE = "'S is definitely a... practical way to use veggies.",
        RABBITKINGHORN = "Toot toot.",
        RABBITKINGHORN_CHEST = "No plastic junk in there that I haven't already found.",
        RABBITKINGSPEAR = "I can smack the ne'er-do-wells with this. Heh.",
        RABBITHAT = "I feel at one with nature. Or rabbits.",
        WORM_BOSS = "What, two jaws aren't enough??!",

        STONE_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "Ah. Somewhere to rest my elbows.",
            HAS_ITEM = "Ah. Somewhere to rest my elbows.",
        },

        STONE_CHAIR =
        {
            GENERIC = "I bet standing'd be more comfy.",
            OCCUPIED = "Isn't very ergonomic, is it?",
        },

        CARPENTRY_BLADE_MOONGLASS = "That could cut through anything.",

        CHEST_MIMIC_REVEALED = "Gah! Quit looking at me like that!",

        GELBLOB_STORAGE = {
            GENERIC  = "Icky, sticky.",
            FULL = "Glad I don't need to store anything in there.",
        },
        GELBLOB_STORAGE_KIT = "I should build it, before I get covered in muck.",
        GELBLOB_BOTTLE = "It can't get on my stuff this way.",

        PLAYER_HOSTED = --funi mask thing
        {
            GENERIC = "Hello?? Feeling alright?",
            ME = "There's plenty more where I came from.",
        },

        MASK_SAGEHAT = "Emotionless, and utterly horrifying.",
        MASK_HALFWITHAT = "No more masks. Please.",
        MASK_TOADYHAT = "I've seen enough white masks for a lifetime.",

        SHADOWTHRALL_PARASITE = "My hard drive contents are mine, and mine alone!",

        PUMPKINCARVER = "I should carve something funny.",
        SNOWMAN =
		{
			GENERIC = "Funny guy.",
			SNOWBALL = "Would make for a soft, and wet, landing.",
		},
        SNOWBALL_ITEM = "Nope, no rocks inside it.",

        -- Year of the Snake
        YOTS_SNAKESHRINE =
        {
            GENERIC = "A place to grab some festive stuff.",
            EMPTY = "At least someone's hungry for that weird purple stuff.",
            BURNT = "So much for the festivities.",
        },
        YOTS_WORM = "A lucky find... or maybe not so lucky.",
        YOTS_LANTERN_POST = 
        {
            GENERIC = "Brings a warm ambiance to the table.",
            BURNT = "It brought a particularly warm ambiance while it was on fire.",
        },
        YOTS_LANTERN_POST_ITEM = "Construction, schmonstruction.",
        CHESSPIECE_DEPTHWORM  = "There are worms in chess?",

        -- Meta 5
        GHOSTLYELIXIR_LUNAR = "'Taking a swig would be the easy way out of here.'",
        GHOSTLYELIXIR_SHADOW = "'Taking a swig would be the easy way out of here.'",

		SLINGSHOTMODKIT = "Looks like he's getting into tinkering.",
		SLINGSHOT_BAND_PIGSKIN = "Looks like he's getting into tinkering.",
		SLINGSHOT_BAND_TENTACLE = "Looks like he's getting into tinkering.",
		SLINGSHOT_BAND_MIMIC = "Looks like he's getting into tinkering.",
		SLINGSHOT_FRAME_BONE = "Looks like he's getting into tinkering.",
		SLINGSHOT_FRAME_GEMS = "Looks like he's getting into tinkering.",
		SLINGSHOT_FRAME_WAGPUNK_0 = "Looks like he's getting into tinkering.",
		SLINGSHOT_FRAME_WAGPUNK = "Looks like he's getting into tinkering.",
		SLINGSHOT_HANDLE_STICKY = "Looks like he's getting into tinkering.",
		SLINGSHOT_HANDLE_JELLY = "Looks like he's getting into tinkering.",
		SLINGSHOT_HANDLE_SILK = "Looks like he's getting into tinkering.",
		SLINGSHOT_HANDLE_VOIDCLOTH = "Looks like he's getting into tinkering.",

        WOBY_TREAT = "I'm certainly not gonna eat it.",
		BANDAGE_BUTTERFLYWINGS = "Might hold together a wound, might not.",
		PORTABLEFIREPIT_ITEM = "Great for those who don't wanna settle down.",
        SLINGSHOTAMMO_CONTAINER = "A mischief maker's box.",

        ELIXIR_CONTAINER = "Everyone's gotta have a place for their stuff.",
        GHOSTFLOWERHAT = "No idea what this is.",
        WENDY_RESURRECTIONGRAVE = "It's a grave matter.",
        GRAVEURN =
        {
            GENERIC = "Is it some sort of vase?",
            HAS_SPIRIT = "Let me know if you see any tapes lying around, yeah?",
        },

        SHALLOW_GRAVE = "What, a skeleton is too ghoulish? Too spooky?",
        THULECITEBUGNET = "Should be a bit more durable.",

        -- Deck of Cards
        DECK_OF_CARDS = "I'm not dealing, don't look at me.",
        PLAYING_CARD = "Keeps the mind busy.",
        BALATRO_MACHINE = "This thing thinks it's the 'creme de la creme' of entertainment.\nWe'll see about that.",

		-- Rifts 5
		GESTALT_CAGE =
		{
			GENERIC = "Empty.",
			FILLED = "Full of life.",
		},
		WAGBOSS_ROBOT = "What have I gotten myself tangled up in...",
        WAGBOSS_ROBOT_POSSESSED = "Whatever this is, it's no business of mine.",
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "I thought we were finished with this?",
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "Uh oh. I don't like the look of that.",
		WAGDRONE_ROLLING =
        {
            GENERIC = "That makes me feel old.",
            FRIENDLY = "Maybe I'll ask that old guy for a roll-mode upgrade later.",
        },
		WAGDRONE_FLYING = "It's... beautiful.",

        WAGPUNK_WORKSTATION = "Hopefully my skills in tinkering with tapes will translate to this.",
        WAGPUNK_LEVER = "Always fun to give a lever a good pull.",
        WAGPUNK_FLOOR_KIT = "Good for standing on.",
        WAGPUNK_CAGEWALL = "That'll keep something out.",

        WANDERINGTRADER = "Ah, another wanderer. 'Cept I don't think we're after the same stuff.",

        GESTALT_GUARD_EVOLVED = "I can see visions of where I came from... and I don't like it.", -- TODO
        FLOTATIONCUSHION = "Not comfy, but it beats drowning.",
        LUNAR_SEED = "The old guy's latest MacGuffin obsession.",
    },

    DESCRIBE_GENERIC = "Yup. S'definitely a thing.",
    DESCRIBE_TOODARK = "Gahh, I can't see!",
    DESCRIBE_SMOLDERING = "Should probably get to that before I have a bushfire on my hands.",

    DESCRIBE_PLANTHAPPY = "Plant's chipper as can be. Wish I could say the same.",
    DESCRIBE_PLANTVERYSTRESSED = "This plant is on the brink, if you ask me.",
    DESCRIBE_PLANTSTRESSED = "It's stressed. Just like me when I have to farm.",
    DESCRIBE_PLANTSTRESSORKILLJOYS = "This plot's overrun with impostor plants.",
    DESCRIBE_PLANTSTRESSORFAMILY = "It wants a buddy. Didn't know plants grew better in pairs.",
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "There's too much going on in this little spot.",
    DESCRIBE_PLANTSTRESSORSEASON = "It's out of season.",
    DESCRIBE_PLANTSTRESSORMOISTURE = "Needs a right watering.",
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "It's missing out on all the good stuff. Nutrients-wise.",
    DESCRIBE_PLANTSTRESSORHAPPINESS = "Needs socialising. Can't relate.",

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = ".. that was exactly the kinda thing the survival guys on tape would do.",
		WINTERSFEASTFUEL = "Now I feel all merry and bright.",
    },
    
    WENDY_SKILLTREE_EASTEREGG = "only_used_by_wendy",


}
--eof!!!!!!! :shocked: :shocked: :sunglasses: :fire: :fire: