--local assets =
--{
--	Asset( "ANIM", "anim/tvheadguy.zip" ),
--	Asset( "ANIM", "anim/ghost_tvheadguy_build.zip" ),
--}
--
--local skins =
--{
--	normal_skin = "tvheadguy",
--	ghost_skin = "ghost_tvheadguy_build",
--}
--
--local base_prefab = "tvheadguy"
--
--local tags = {"TVHEADGUY", "CHARACTER"}
--
--return CreatePrefabSkin("tvheadguy_none",
--{
--	base_prefab = base_prefab,
--	type = "base",
--	skins = skins, 
--	assets = assets,
--	--tags = tags,
--	skin_tags = {"TVHEADGUY", "CHARACTER", "BASE"},
--	build_name_override = "tvheadguy",
--	rarity = "Character",
--
--	skip_item_gen = true,
--	skip_giftable_gen = true,
--})

--UNLOCK STRINGS-------------------------

--TODO: find out a way to display current achievement progress...
if TheNet:GetServerGameMode() ~= "" then
	if STRINGS.MODSKINUNLOCK_REQUIREMENT ~= nil then --Again making sure the API is actually enabled
		local amt = TUNING.TVACHIEVEMENTS.ABILITIESUSED
		tostring(amt)
		--local prog = ThePlayer.achievement_abilitiescount
		--STRINGS.MODSKINUNLOCK_REQUIREMENT["ms_tvheadguy_rose"] = "Unlocked by using all of Wandering Drone's abilities ("..amt.." total) at least once.\nSo far, you've played "..prog.."/"..amt.." tapes."
		STRINGS.MODSKINUNLOCK_REQUIREMENT["ms_tvheadguy_rose"] = "Unlocked by using all of Wandering Drone's abilities ("..amt.." total) at least once, in the same world.\n(Tapes unlocked from the skilltree don't count towards this unlock.)"
	end

	if STRINGS.MODSKINUNLOCK_REQUIREMENT ~= nil then
		local amt = TUNING.TVACHIEVEMENTS.TAPESFOUND
		tostring(amt)
		--local prog = ThePlayer.achievement_tapesfound
		--STRINGS.MODSKINUNLOCK_REQUIREMENT["ms_tvheadguy_triumphant"] = "Unlocked by uncovering "..amt.." buried memories in your world.\nSo far, you've uncovered "..prog.."/"..amt.."."
		STRINGS.MODSKINUNLOCK_REQUIREMENT["ms_tvheadguy_triumphant"] = "Unlocked by uncovering "..amt.." buried memories in your world."
	end

	if STRINGS.MODSKINUNLOCK_REQUIREMENT ~= nil then
		STRINGS.MODSKINUNLOCK_REQUIREMENT["ms_tvheadguy_pirate"] = "Unlocked by plundering a sunken chest from the ocean depths."
	end
end

--SKIN PREFABS--------------------------

local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("tvheadguy_none", {--The ID of your skin, e.g. “whimsy_none”, “ms_whimsy_victorian”
	assets = { --All the assets correlated to your skin
		Asset("ANIM", "anim/tvheadguy.zip"),
		--Asset("ANIM", "anim/ghost_tvheadguy_build.zip"),
	},
	skins = { --The skin modes, generally there are usually two modes your character is in. Either the normal mode or ghost form(And most character skins don’t have unique ghost sprites!) However if you’re developing a character similar to Woodie or Wanda with different forms you can create skins for those custom forms! I may expand this tutorial to include how to do that.
		normal_skin = "tvheadguy",
		ghost_skin = "ghost_tvheadguy_build",
	},

	base_prefab = "tvheadguy", --The prefab you are going to skin
	build_name_override = "tvheadguy", --The build name we’re using to skin

	type = "base", --The type of skin this is, for characters only “base” really matters, but there are of course other types of skins such as item/structure skins that we will cover later in this tutorial.
	rarity = "Character", --The rarity of your skin. For the ‘_none’ skins it is the ‘Character’ rarity. Actual skins however will have you use either the ‘ModMade’ or ‘ModLocked’ rarities.

	--Misc parameters, these are not at all necessary 
	--torso_untuck_builds = { "esctemplate", }, --All builds in this table will have their ‘torso’ symbols ‘tucked’ into their skirt!

	skin_tags = { "BASE", "TVHEADGUY"},
}))

table.insert(prefabs, CreatePrefabSkin("ms_tvheadguy_pirate", {
	assets = {
		Asset("ANIM", "anim/ms_tvheadguy_pirate.zip"),
		Asset("ANIM", "anim/ghost_tvheadguy_build.zip"),
	},
	skins = {
		normal_skin = "ms_tvheadguy_pirate",
		ghost_skin = "ghost_tvheadguy_build",
	},

	base_prefab = "tvheadguy",
	build_name_override = "ms_tvheadguy_pirate",

	type = "base",
	rarity = "ModLocked",
	condition = {}, --no_gift = true 

	--torso_untuck_builds = { "esctemplate", },

	skin_tags = { "PIRATE", "BASE", "TVHEADGUY"},
}))

table.insert(prefabs, CreatePrefabSkin("ms_tvheadguy_triumphant", {
	assets = {
		Asset("ANIM", "anim/ms_tvheadguy_triumphant.zip"),
		Asset("ANIM", "anim/ghost_tvheadguy_build.zip"),
	},
	skins = {
		normal_skin = "ms_tvheadguy_triumphant",
		ghost_skin = "ghost_tvheadguy_build",
	},

	base_prefab = "tvheadguy",
	build_name_override = "ms_tvheadguy_triumphant",

	type = "base",
	rarity = "ModLocked",
	condition = {}, --no_gift = true 

	--torso_untuck_builds = { "esctemplate", },

	skin_tags = { "SHADOW", "BASE", "TVHEADGUY"},
}))

table.insert(prefabs, CreatePrefabSkin("ms_tvheadguy_rose", {
	assets = {
		Asset("ANIM", "anim/ms_tvheadguy_rose.zip"),
		Asset("ANIM", "anim/ghost_tvheadguy_build.zip"),
	},
	skins = {
		normal_skin = "ms_tvheadguy_rose",
		ghost_skin = "ghost_tvheadguy_build",
	},

	base_prefab = "tvheadguy",
	build_name_override = "ms_tvheadguy_rose",

	type = "base",
	rarity = "ModLocked",
	condition = {}, --no_gift = true 

	--torso_untuck_builds = { "esctemplate", }, 

	skin_tags = { "ROSE", "BASE", "TVHEADGUY",},
}))

return unpack(prefabs)