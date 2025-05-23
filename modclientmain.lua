PrefabFiles = {
	--"tvheadguy",
	"tvheadguy_skins",
	"tape1",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/tvheadguy.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/tvheadguy.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/tvheadguy.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/tvheadguy.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/tvheadguy_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/tvheadguy_silho.xml" ),

    Asset( "IMAGE", "bigportraits/tvheadguy.tex" ),
    Asset( "ATLAS", "bigportraits/tvheadguy.xml" ),
	
	Asset( "IMAGE", "bigportraits/tvheadguy_none.tex" ),
    Asset( "ATLAS", "bigportraits/tvheadguy_none.xml" ),

	Asset( "IMAGE", "bigportraits/ms_tvheadguy_pirate.tex" ),
    Asset( "ATLAS", "bigportraits/ms_tvheadguy_pirate.xml" ),

	Asset( "IMAGE", "bigportraits/ms_tvheadguy_rose.tex" ),
    Asset( "ATLAS", "bigportraits/ms_tvheadguy_rose.xml" ),

	Asset( "IMAGE", "bigportraits/ms_tvheadguy_triumphant.tex" ),
    Asset( "ATLAS", "bigportraits/ms_tvheadguy_triumphant.xml" ),
	
	Asset( "IMAGE", "images/map_icons/tvheadguy.tex" ),
	Asset( "ATLAS", "images/map_icons/tvheadguy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_tvheadguy.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_tvheadguy.xml" ),
	
	--Asset( "IMAGE", "images/avatars/avatar_ghost_tvheadguy.tex" ), --todo: remember why this is commented out.
    --Asset( "ATLAS", "images/avatars/avatar_ghost_tvheadguy.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_tvheadguy.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_tvheadguy.xml" ),
	
	Asset( "IMAGE", "images/names_tvheadguy.tex" ),
    Asset( "ATLAS", "images/names_tvheadguy.xml" ),

	Asset( "IMAGE", "images/names_gold_tvheadguy.tex" ),
    Asset( "ATLAS", "images/names_gold_tvheadguy.xml" ),
}

GLOBAL.TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.TVHEADGUY = {"tape1"}

RegisterInventoryItemAtlas("images/inventoryimages/tape1.xml", "tape1.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tapebits_busted.xml", "tapebits_busted.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tapebits_1.xml", "tapebits_1.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tapebits_2.xml", "tapebits_2.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tapebits_3.xml", "tapebits_3.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_invis.xml", "tape_invis.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_broadcast.xml", "tape_broadcast.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_scanner.xml", "tape_scanner.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_nightvis.xml", "tape_nightvis.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_slowmo.xml", "tape_slowmo.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_electric.xml", "tape_electric.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_hypercast.xml", "tape_hypercast.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_sysrestore.xml", "tape_sysrestore.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_pig.xml", "tape_pig.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_lightning.xml", "tape_lightning.tex")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

STRINGS.CHARACTER_TITLES.tvheadguy = "The Apathetic"
STRINGS.CHARACTER_NAMES.tvheadguy = "Wandering Drone"
STRINGS.CHARACTER_DESCRIPTIONS.tvheadguy = "*Wimp\n*Plagued by a mysterious itch\n*Good at digging up people's secrets"
STRINGS.CHARACTER_QUOTES.tvheadguy = "\"Wish I could press 'rewind' on that...\""
STRINGS.CHARACTER_SURVIVABILITY.tvheadguy = "Grim"
STRINGS.CHARACTER_ABOUTME.tvheadguy = "An entertainment drone escaped from some far-off facility, the self-dubbed 'Wanderer' is largely a mystery, even to itself."
STRINGS.CHARACTER_BIOS.tvheadguy =
{
			{ title = "Buildday", desc = "Feb 16" },
			{ title = "Favorite Food", desc = "Soothing Tea" },
			{ title = "Deviant Drone", desc = "An entertainment drone escaped from some far-off facility, the self-dubbed 'Wanderer' is largely a mystery, even to itself." },
}

GLOBAL.PREFAB_SKINS["tvheadguy"] = {"tvheadguy_none",}-- "ms_tvheadguy_pirate", "ms_tvheadguy_triumphant", "ms_tvheadguy_rose",}

STRINGS.CHARACTERS.TVHEADGUY = require "speech_tvheadguy"
STRINGS.NAMES.TVHEADGUY = "Wandering Drone"

STRINGS.SKIN_NAMES.tvheadguy_none = "Wandering Drone"
STRINGS.SKIN_DESCRIPTIONS.tvheadguy_none = "The usual getup for a lowly tape thief. Has a custom screen for every ability!"
STRINGS.SKIN_QUOTES.tvheadguy_none = "\"Wish I could press 'rewind' on that...\""

STRINGS.SKIN_NAMES.ms_tvheadguy_pirate = "The Swashbuckler"
STRINGS.SKIN_DESCRIPTIONS.ms_tvheadguy_pirate = "You were never made for swimming. Or touching water at all, really."
STRINGS.SKIN_QUOTES.ms_tvheadguy_pirate = "\"Gahh! Gonna take forever to get all these sea creatures out...\""

STRINGS.SKIN_NAMES.ms_tvheadguy_triumphant = "The Triumphant"
STRINGS.SKIN_DESCRIPTIONS.ms_tvheadguy_triumphant = "The shadows are full of such strange broadcasts..."
STRINGS.SKIN_QUOTES.ms_tvheadguy_triumphant = "\"I'm the lord of shadows now! Not sure I'm ready for all that responsibility.\""

STRINGS.SKIN_NAMES.ms_tvheadguy_rose = "The Roseate"
STRINGS.SKIN_DESCRIPTIONS.ms_tvheadguy_rose = "Here's hoping those roses don't get in the way of things."
STRINGS.SKIN_QUOTES.ms_tvheadguy_rose = "\"I may look fancy, but I've still got stuff to do.\""

AddMinimapAtlas("images/map_icons/tvheadguy.xml")
AddModCharacter("tvheadguy", "ROBOT")