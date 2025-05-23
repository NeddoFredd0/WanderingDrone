--local Inv = require "widgets/inventorybar"

PrefabFiles = {
	"tvheadguy",
	"tvheadguy_skins",
	--"fxcooltvhead",
	"fx_tapebreak",
	"fx_tapefind",
	"fx_sysrestoregear",
	"fx_slowmostatus",
	"fx_freetapeuse",
	"fx_clonedroneexplode",
	"tape_lunar_fx",
	"tapeexplode_fx",
	"tape1",
	"tape2",
	"tape3",
	"tape4",
	"tapebits_1",
	"tapebits_2",
	"tapebits_3",
	"tapebits_busted",
	"tapecache",
	"tapestorage",
	"remoteportal",
	"tapebuffs",
	"tape_invis",
	"tape_portal",
	"tape_broadcast",
	"tape_scanner",
	"tape_slowmo",
	"tape_nightvis",
	"tape_sysrestore",
	"tape_hypercast",
	"tape_electric",
	"tape_pig",
	"tape_lightning",
	"tape_pig_pigelitefighter",
	"clonedrone",
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

	Asset( "IMAGE", "images/colour_cubes/tape_vision_cc.tex" ),

	Asset("ANIM", "anim/itchmeter.zip"),

	Asset( "IMAGE", "images/skilltree/tvheadguy_skilltree.tex" ),
    Asset( "ATLAS", "images/skilltree/tvheadguy_skilltree.xml" ),

	Asset("ATLAS", "images/skilltree/tvheadguy_biggermeter_1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_biggermeter_1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_biggermeter_2.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_biggermeter_2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_biggermeter_3.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_biggermeter_3.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_efficientcombat_1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_efficientcombat_1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_efficientcombat_2.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_efficientcombat_2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_efficientcombat_3.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_efficientcombat_3.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_materials1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_materials1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_materials2.xml"), --materials2 is actually tapeupgrade
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_materials2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_materials1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_materials1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_materials2.xml"), --materials2 is actually tapeupgrade
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_materials2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_find1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_find1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_find2.xml"), --find2 is actually tapeexplode
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_find2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_find1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_find1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_find2.xml"), --find2 is actually tapeexplode 
    Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_find2.tex"),

	--Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_tapeexplode.xml"),
    --Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_tapeexplode.tex"),
	--Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_tapeexplode.xml"),
    --Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_tapeexplode.tex"),
	--Asset("ATLAS", "images/skilltree/tvheadguy_affinity_lunar_tapeupgrade.xml"),
    --Asset("IMAGE", "images/skilltree/tvheadguy_affinity_lunar_tapeupgrade.tex"),
	--Asset("ATLAS", "images/skilltree/tvheadguy_affinity_shadow_tapeupgrade.xml"),
    --Asset("IMAGE", "images/skilltree/tvheadguy_affinity_shadow_tapeupgrade.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_research.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_research.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_invis.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_invis.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_scanner.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_scanner.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_electric.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_electric.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_sysrestore.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_sysrestore.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_lightning.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_lightning.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_nightvis.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_nightvis.tex"),
	Asset("ATLAS", "images/skilltree/tvheadguy_entertainment_pig.xml"),
	Asset("IMAGE", "images/skilltree/tvheadguy_entertainment_pig.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_storage_1.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_storage_1.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_storage_2.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_storage_2.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_storage_3.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_storage_3.tex"),

	Asset("ATLAS", "images/skilltree/tvheadguy_storage_4.xml"),
    Asset("IMAGE", "images/skilltree/tvheadguy_storage_4.tex"),

	Asset("ANIM", "anim/smashtapebits_1.zip"),
	Asset("ANIM", "anim/smashtapebits_2.zip"),
	Asset("ANIM", "anim/smashtapebits_3.zip"),

	--Asset( "IMAGE", "images/names_wanderingdrone.tex" ),
    --Asset( "ATLAS", "images/names_wanderingdrone.xml" ),
	--
	--Asset( "IMAGE", "images/names_wanderingdrone_gold.tex" ),
    --Asset( "ATLAS", "images/names_wanderingdrone_gold.xml" ),

	--Asset( "IMAGE", "images/jacketslot.tex" ),
    --Asset( "ATLAS", "images/jacketslot.xml" ),
	
	Asset( "SOUNDPACKAGE", "sound/tvheadguy.fev"),
	Asset( "SOUND", "sound/tvheadguy.fsb"),

	Asset( "SCRIPT", "scripts/components/itchmeter_replica.lua"),
    Asset( "SCRIPT", "scripts/components/itchmeter.lua"),

	Asset( "SCRIPT", "scripts/tvheadguy_commands.lua"),

	Asset( "SCRIPT", "scripts/play_generalscripts.lua")
}

require("tvheadguy_tuning")
require("tvheadguy_strings")

modimport('scripts/stategraphs/tvheadguy_states.lua')

RemapSoundEvent("dontstarve/characters/tvheadguy", "tvheadguy/tvheadguy")
RemapSoundEvent("dontstarve/characters/tvheadguy/talk_LP", "tvheadguy/tvheadguy/talk_LP")
RemapSoundEvent("dontstarve/characters/tvheadguy/ghost_LP", "tvheadguy/tvheadguy/ghost_LP")
RemapSoundEvent("dontstarve/characters/tvheadguy/hurt", "tvheadguy/tvheadguy/hurt")
RemapSoundEvent("dontstarve/characters/tvheadguy/death_voice", "tvheadguy/tvheadguy/death_voice")
RemapSoundEvent("dontstarve/characters/tvheadguy/emote", "tvheadguy/tvheadguy/emote")
RemapSoundEvent("dontstarve/characters/tvheadguy/pose", "tvheadguy/tvheadguy/pose")
RemapSoundEvent("dontstarve/characters/tvheadguy/yawn", "tvheadguy/tvheadguy/yawn")
RemapSoundEvent("dontstarve/characters/tvheadguy/eye_rub_vo", "tvheadguy/tvheadguy/eye_rub_vo")
RemapSoundEvent("dontstarve/characters/tvheadguy/sinking", "tvheadguy/tvheadguy/sinking")
RemapSoundEvent("dontstarve/characters/tvheadguy/carol", "tvheadguy/tvheadguy/carol")

--CODE
---------------------------------------------------------------------------------------------
--POSTINITS
---------------------------------------------------------------------------------------------

--post class constructs
--AddClassPostConstruct("components/container_proxy", function(self)
	--function self:TV_GetOpeners() --TV_ prefix to avoid future conflicts
	--	local openers = {}
    --	for opener in pairs(self.openlist) do
    --	    table.insert(openers, opener)
    --	end
    --	return openers
	--end
--
	--function self:TV_NumItems()
	--	local num = 0
	--	for k,v in pairs(self.slots) do --self.slots doesn't exist for container_proxy
	--		num = num + 1
	--	end
--
	--	return num
	--end
--
	--function self:TV_GetNumSlots()
	--	return self.numslots
	--end
--end)

AddComponentPostInit("playercontroller", function(self)
	self.OnRemoteEject = function(self, action)
		if self.ismastersim and self:IsEnabled() then --and self.handler == nil then
			--print("DEBUG: playercontroller FN Reached!!!!!")
			--print(action)
			--GLOBAL.dumptable(action)
			self.inst.components.combat:SetTarget(nil)
			self:ClearControlMods()

			GLOBAL.SetClientRequestedAction(action) --this needs actioncode (a number)
			--local act = nil --redefine the action here
			local act = GLOBAL.BufferedAction(self.inst, self.inst, GLOBAL.ACTIONS.TVEJECT)
			GLOBAL.ClearClientRequestedAction()

			if act == nil then
				return
			end

			self:DoAction(act)
		end
	end
end)

--RPCS

local function EjectRPCFn(player, action)
	if not GLOBAL.checknumber(action) then
		print("ERROR: Eject assertion failed")
		return
	end

	local playercontroller = player.components.playercontroller
	if playercontroller ~= nil then
		playercontroller:OnRemoteEject(action)
	end
end

AddModRPCHandler("WanderingDrone", "RPCEjectToServer", EjectRPCFn)

--POSTINITS, CONT
--player postinits
local function PlayerPushWorkables(inst, data)
	GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = data.target})
end

AddPlayerPostInit(function(inst)
	if inst.prefab ~= "tvheadguy" then
    	if inst._onentityfinishedworkprefabfn == nil then
    	    inst._onentityfinishedworkprefabfn = function(src, data) PlayerPushWorkables(inst, data) end
    	    inst:ListenForEvent("finishedwork", inst._onentityfinishedworkprefabfn, inst)
    	end
    	if inst._onentitypicksomethingfn == nil then
    	    inst._onentitypicksomethingfn = function(src, data) PlayerPushWorkables(inst, data) end
    	    inst:ListenForEvent("picksomething", inst._onentitypicksomethingfn, inst)
    	end
	end
end)

--special loot drops
AddPrefabPostInit("klaus_sack", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    if inst.components.klaussacklock then
        local _onusekeyfn = inst.components.klaussacklock.onusekeyfn
        inst.components.klaussacklock.onusekeyfn = function(inst, key, doer)
			_onusekeyfn(inst, key, doer) --save and perform normal klaus key functions so theyre not overriden
			if key.components.klaussackkey.truekey then
				if inst.components.entitytracker:GetEntity("klaus") ~= nil then
					--klaus is already spawned
					--announce danger?
					return false, "KLAUS", false
				end
            	GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
			else
				return false, "WRONGKEY", true
			end
			if key.components.stackable ~= nil then
				key.components.stackable:Get():Remove()
			else
				key:Remove()
			end
        end
    end
end)

AddPrefabPostInit("tumbleweed", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    if inst.components.pickable then
        local _onpickedfn = inst.components.pickable.onpickedfn
        inst.components.pickable.onpickedfn = function(inst, picker)
			_onpickedfn(inst, picker) --save and perform normal tumblweed fns so theyre not overriden
            GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
        end
    end
end)

AddPrefabPostInit("junk_pile", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    if inst.components.pickable then
        local _onpickedfn = inst.components.pickable.onpickedfn
        inst.components.pickable.onpickedfn = function(inst, picker)
			_onpickedfn(inst, picker) --save and perform normal pickable fns so theyre not overriden
            GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
        end
    end
end)

--AddPrefabPostInit("otterden", function(inst)
--    if not GLOBAL.TheWorld.ismastersim then return end
--    if inst.components.searchable then
--        local _onsearchfn = inst.components.searchable.onsearchfn
--        inst.components.searchable.onsearchfn = function(inst, searcher)
--			_onsearchfn(inst, searcher) --save and perform normal searchable fns so theyre not overriden
--            GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
--        end
--    end
--end)

local unwrappables = {"hermit_bundle", "hermit_bundle_shells", "wetpouch", } --not going to include event pouches, cause they keep adding new ones (plus it's probably OP) --hermit_bundle_shells is also banned cause it's abuseable --reverted, they fixed it
for i, v in ipairs(unwrappables) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		if inst.components.unwrappable then
			local _onunwrappedfn = inst.components.unwrappable.onunwrappedfn
			inst.components.unwrappable.onunwrappedfn = function(inst, pos, wrapper)
				_onunwrappedfn(inst, pos, wrapper) --save and perform normal wrapping fns so theyre not overriden
				GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
			end
		end
	end)
end

local activatables = {"catcoonden",} --keeping table in case there are more activatables in the future
for i, v in ipairs(activatables) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		if inst.components.activatable then
			local _onactivatedfn = inst.components.activatable.OnActivate
			inst.components.activatable.onunwrappedfn = function(inst, pos, activator)
				_onactivatedfn(inst, pos, activator) --save and perform normal activation fns so theyre not overriden
				GLOBAL.TheWorld:PushEvent("postinittapedrop", {inst = inst})
			end
		end
	end)
end

--unified lootdropper tags
AddPrefabPostInit("grave", function(inst)
	if not GLOBAL.TheWorld.ismastersim then return end
	inst:AddTag("tapegravelootdropper")
	if inst:GetStatus("DUG") then
		--print("grave is dug")
		--inst:PushEvent("tapegravelootdrop")
	end
end)

local jackpots = {"sunkenchest", "klaus_sack"}
for i, v in ipairs(jackpots) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("taperarelootdropper")
	end)
end

for i, v in ipairs(unwrappables) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tapeunwrappablelootdropper")
	end)
end

for i, v in ipairs(activatables) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tapeactivateablelootdropper")
	end)
end

local houses = {"pighouse", "pigtorch", "catcoonden", "mermhouse", "rabbithouse", "monkeybarrel", "monkeyhut"}
for i, v in ipairs(houses) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tapehouselootdropper")
	end)
end

local holes = {"rabbithole", "molehill"}
for i, v in ipairs(holes) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		--if inst.components.lootdropper == nil then
		--	inst:AddComponent("lootdropper")
		--end
		inst:AddTag("tapeholelootdropper")
	end)
end

AddPrefabPostInit("tumbleweed", function(inst)
	if not GLOBAL.TheWorld.ismastersim then return end
	inst:AddTag("tapetumbleweedlootdropper")
end)

local rummageables = {"junk_pile",} --"junk_pile_big"
for i, v in ipairs(rummageables) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tapeactivateablelootdropper") --reuse activateable event and chance
	end)
end

--local searchables = {"otterden",}
--for i, v in ipairs(searchables) do
--	AddPrefabPostInit(v, function(inst)
--		if not GLOBAL.TheWorld.ismastersim then return end
--		inst:AddTag("tapesearchablelootdropper") --reuse activateable event and chance
--	end)
--end

local misc_raredrop = {"wagstaff_machinery",}
for i, v in ipairs(misc_raredrop) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tapemiscrarelootdropper")
	end)
end

--unified blacklist tags
local sap = {"pinecone_sapling", "lumpy_sapling", "acorn_sapling", "twiggy_nut_sapling", "marblebean_sapling", "moonbutterfly_sapling",
"palmcone_sapling", "ancienttree_sapling", "ancienttree_gem_sapling", "ancienttree_nightvision_sapling"}
for i, v in ipairs(sap) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tvblacklistsapling")
	end)
end

local misc = {"atrium_gate", "sculptingtable", "sharkboi_icespike", "sharkboi_ice_hazard", "crabking_icewall"}
for i, v in ipairs(misc) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tvblacklistmisc")
	end)
end

--unified scanner tags
local scansurface = {"pigking", "crabking", "monkeyqueen", "moonglass_rock", "watertree_pillar", "moonstormmarker_big", "moonstormmarker",
"hermithouse", "hermithouse_construction1", "hermithouse_construction2", "hermithouse_construction3"}
for i, v in ipairs(scansurface) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tvPOIsurface")
	end)
end

local scancaves = {"atrium_gate", "ancient_altar", "archive_orchestrina_base", "daywalker", "pandoraschest"}
for i, v in ipairs(scancaves) do
	AddPrefabPostInit(v, function(inst)
		if not GLOBAL.TheWorld.ismastersim then return end
		inst:AddTag("tvPOIcaves")
	end)
end

--AddComponentPostInit("instrument", function(self)
--	local musician = self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner
--	--print("musican: "..musician)
--	self.Play = function(_musician)
--		if musician.components.itchmeter ~= nil then
--			if self.inst.prefab == "panflute" then
--				musician.components.itchmeter:DoDelta(TUNING.ITCHSTRUMENT.PANFLUTE)
--				if musician.components.itchmeter ~= nil then
--					musician:AddTag("itch_heal")
--					musician:DoTaskInTime(0.1, function(eater) eater:RemoveTag("itch_heal") end)
--				end
--			elseif self.inst.prefab == "horn" then
--				musician.components.itchmeter:DoDelta(TUNING.ITCHSTRUMENT.BEEFALOHORN)
--				if musician.components.itchmeter ~= nil then
--					musician:AddTag("itch_heal")
--					musician:DoTaskInTime(0.1, function(eater) eater:RemoveTag("itch_heal") end)
--				end
--			elseif self.inst.prefab == "houndwhistle" then
--				musician.components.itchmeter:DoDelta(TUNING.ITCHSTRUMENT.HOUNDWHISTLE)
--				if musician.components.itchmeter ~= nil then
--					musician:AddTag("itch_heal")
--					musician:DoTaskInTime(0.1, function(eater) eater:RemoveTag("itch_heal") end)
--				end
--			end
--		end
--	end
--end)
--
--AddPrefabPostInit("onemanband", function(inst)
--	local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
--	if owner.components.inventory.activeitem == "onemanband" then
--		owner.components.itchmeter:DoDelta(1)
--	end
--end)

--local tapepickupsound = {["tv_tape"] = "tvheadguy/tv_tape/tapepickup"}
--
--table.insert(PICKUPSOUNDS, tapepickupsound)

--SKILLTREE STUFF
---------------------------------------------------------------------------------------------
local SkillTreeDefs = require("prefabs/skilltree_defs")
local BuildSkillsData = require("prefabs/skilltree_tvheadguy")

local function CreateSkillTree()
    if BuildSkillsData then
        local data = BuildSkillsData(SkillTreeDefs.FN)

        if data then
            SkillTreeDefs.CreateSkillTreeFor("tvheadguy", data.SKILLS)
            SkillTreeDefs.SKILLTREE_ORDERS["tvheadguy"] = data.ORDERS
            --print("created skilltree")
        end
    end
end

if BuildSkillsData then
	RegisterSkilltreeBGForCharacter(GLOBAL.resolvefilepath("images/skilltree/tvheadguy_skilltree.xml"), "tvheadguy")

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_biggermeter_1.xml", "tvheadguy_biggermeter_1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_biggermeter_2.xml", "tvheadguy_biggermeter_2.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_biggermeter_3.xml", "tvheadguy_biggermeter_3.tex")

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_efficientcombat_1.xml", "tvheadguy_efficientcombat_1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_efficientcombat_2.xml", "tvheadguy_efficientcombat_2.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_efficientcombat_3.xml", "tvheadguy_efficientcombat_3.tex")

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_shadow_materials1.xml", "tvheadguy_affinity_shadow_materials1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_shadow_materials2.xml", "tvheadguy_affinity_shadow_materials2.tex") --materials2 is tapeupgrade
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_lunar_materials1.xml", "tvheadguy_affinity_lunar_materials1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_lunar_materials2.xml", "tvheadguy_affinity_lunar_materials2.tex") --materials2 is tapeupgrade

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_shadow_find1.xml", "tvheadguy_affinity_shadow_find1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_shadow_find2.xml", "tvheadguy_affinity_shadow_find2.tex") --find2 is tapeexplode
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_lunar_find1.xml", "tvheadguy_affinity_lunar_find1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_affinity_lunar_find2.xml", "tvheadguy_affinity_lunar_find2.tex") --find2 is tapeexplode

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_research.xml", "tvheadguy_entertainment_research.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_invis.xml", "tvheadguy_entertainment_invis.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_scanner.xml", "tvheadguy_entertainment_scanner.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_electric.xml", "tvheadguy_entertainment_electric.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_sysrestore.xml", "tvheadguy_entertainment_sysrestore.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_lightning.xml", "tvheadguy_entertainment_lightning.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_nightvis.xml", "tvheadguy_entertainment_nightvis.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_entertainment_pig.xml", "tvheadguy_entertainment_pig.tex")

	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_storage_1.xml", "tvheadguy_storage_1.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_storage_2.xml", "tvheadguy_storage_2.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_storage_3.xml", "tvheadguy_storage_3.tex")
	RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_storage_4.xml", "tvheadguy_storage_4.tex")

	--local data = BuildSkillsData(SkillTreeDefs.FN)
	--for k, v in pairs(data.SKILLS) do
	--	if v.icon then
	--		RegisterSkilltreeIconsAtlas("images/skilltree/tvheadguy_skilltree_icons.xml", v.icon..".tex")
	--	end
	--end
end

--ACTIONS
---------------------------------------------------------------------------------------------

local function func(act)
	if act.doer:HasTag("tapemaker") then
		--act.doer.SoundEmitter:PlaySound("WX_rework/module/remove") --cleaner to play sound in fx_tapebreak prefab
		act.invobject.components.tapejunk_disassemble:Disassemble(act.invobject, act.doer)
		return true
	else
		act.doer.components.talker:Say("Ach, I cannae do tha!")
	end
end
TAPEJUNK_DISASSEMBLE = AddAction("TAPEJUNK_DISASSEMBLE", "Take Apart", func) --'Take Apart' for consistency with wanda action


TAPEJUNK_DISASSEMBLE.priority = 1
TAPEJUNK_DISASSEMBLE.rmb = true
--TAPEJUNK_DISASSEMBLE.distance = 10
TAPEJUNK_DISASSEMBLE.mount_valid = true

local function fnc(inst, doer, actions) --right
    if doer:HasTag("tapemaker") then --note: 'right' paramater is no longer needed for inventory actions
        table.insert(actions, GLOBAL.ACTIONS.TAPEJUNK_DISASSEMBLE)
	end
end
AddComponentAction("INVENTORY", "tapejunk_disassemble", fnc) --actiontype, component, function, modname

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPEJUNK_DISASSEMBLE, "dolongaction")) --sg, actionhandler(action, animation) --"pocketwatch_atk"
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPEJUNK_DISASSEMBLE, "dolongaction"))

---------------------------------------------------------------------------------------------

local function tapeeatfunc(act)
	if act.doer:HasTag("tapemaker") then
		act.invobject.components.tapeconsume:Consume(act.invobject, act.doer)
		return true
	else
		act.doer.components.talker:Say("Ach, I cannae do tha!")
	end
end
TAPECONSUME = AddAction("TAPECONSUME", "Play Tape", tapeeatfunc)

TAPECONSUME.priority = 1
TAPECONSUME.rmb = true
TAPECONSUME.mount_valid = true

local function tapecafn(inst, doer, actions) --right
    if doer:HasTag("tapemaker") then --note: 'right' paramater is no longer needed for inventory actions
        table.insert(actions, GLOBAL.ACTIONS.TAPECONSUME)
	end
end
AddComponentAction("INVENTORY", "tapeconsume", tapecafn) --actiontype, component, function, modname

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPECONSUME, "quickeat")) --sg, actionhandler(action, animation)
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPECONSUME, "quickeat"))

---------------------------------------------------------------------------------------------

local function smashfunc(act)
	if act.doer:HasTag("tapemaker") then
		--act.doer.SoundEmitter:PlaySound("WX_rework/module/remove")
		act.invobject.components.tapebits_smash:Smash(act.invobject, act.doer)
		return true
	else
		act.doer.components.talker:Say("Ach, I cannae do tha!")
	end
end
TAPEBITS_SMASH = AddAction("TAPEBITS_SMASH", "Break Down", smashfunc)


TAPEBITS_SMASH.priority = 1
TAPEBITS_SMASH.rmb = true
--TAPEBITS_SMASH.distance = 10
TAPEBITS_SMASH.mount_valid = true

local function smashfnc(inst, doer, actions) --right
    if doer:HasTag("tvheadguy_storage_4") then
        table.insert(actions, GLOBAL.ACTIONS.TAPEBITS_SMASH)
	end
end
AddComponentAction("INVENTORY", "tapebits_smash", smashfnc) --actiontype, component, function, modname

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPEBITS_SMASH, "tapebits_smash")) ---"tapebits_smash"
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAPEBITS_SMASH, "tapebits_smash"))

---------------------------------------------------------------------------------------------

local function ejectfunc(act)
	if act.doer:HasTag("tapemaker") then
		act.doer.components.tveject:Eject(nil, act.doer)
		return true
	else
		act.doer.components.talker:Say("Ach, I cannae do tha!")
	end
end
TVEJECT = AddAction("TVEJECT", "Eject", ejectfunc)


TVEJECT.priority = 1
TVEJECT.rmb = true
--TVEJECT.distance = 10
TVEJECT.mount_valid = true

local function ejectcomponent(inst, doer, actions) --right
    if doer:HasTag("tvheadguy_storage_1") then
		if doer:HasTag("tapefinder_tapeinserted") then
			table.insert(actions, GLOBAL.ACTIONS.TVEJECT)
		end
	end
end
AddComponentAction("SCENE", "tveject", ejectcomponent) --actiontype, component, function, modname

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TVEJECT, "give")) --sg, actionhandler(action, animation) --"pocketwatch_atk"
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TVEJECT, "give"))

---------------------------------------------------------------------------------------------

local function FakeEjectAction(doer)
	if doer:HasTag("tvheadguy_storage_1") then
		if doer:HasTag("tapefinder_tapeinserted") then
			--so basically this code is ALL being run on the client only, we need to get the action on the server too
			local act = GLOBAL.BufferedAction(doer, doer, GLOBAL.ACTIONS.TVEJECT)
			if not GLOBAL.TheWorld.ismastersim then
				SendModRPCToServer(GetModRPC("WanderingDrone", "RPCEjectToServer"), act.action.code) --todo: figure out how to pass table data through an RPC
			end
			--if not GLOBAL.TheWorld.ismastersim then
			--	GLOBAL.SendRPCToServer(GLOBAL.RPC.ControllerActionButton, act.action.code, doer)
			--end
			doer.components.playercontroller:DoAction(act)
		else
			doer.components.talker:Say(GLOBAL.STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_EJECTEMPTY)
		end
	end
end

--KEYBINDINGS SETUP
---------------------------------------------------------------------------------------------

--Credit Maxwell Keybinds
local function IsDefaultScreen()
	return GLOBAL.ThePlayer and GLOBAL.ThePlayer ~= nil
		and GLOBAL.ThePlayer.components.playercontroller:IsEnabled()
		and GLOBAL.TheFrontEnd:GetActiveScreen().name == "HUD"
		and not GLOBAL.ThePlayer.HUD:IsChatInputScreenOpen()
		and not GLOBAL.ThePlayer.HUD:IsConsoleScreenOpen()
		and not GLOBAL.ThePlayer.HUD:IsCraftingOpen()
		and not GLOBAL.ThePlayer.HUD.writeablescreen
end

--Credit Gesture Wheel
EJECTKEY = GetModConfigData("EJECTKEY") or "R"
if type(EJECTKEY) == "string" then
	EJECTKEY = EJECTKEY:lower():byte()
end

EJECTCONTROL = GetModConfigData("EJECTCONTROL") or 2
--_EJECTCONTROL = "\238\128\141"

local righttrigger = GLOBAL.CONTROL_OPEN_INVENTORY
local lefttrigger = GLOBAL.CONTROL_OPEN_CRAFTING
local leftbumper = GLOBAL.CONTROL_ROTATE_LEFT
local rightbumper = GLOBAL.CONTROL_ROTATE_RIGHT
local leftstickpress = GLOBAL.CONTROL_MENU_MISC_3
local rightstickpress = GLOBAL.CONTROL_MENU_MISC_4
local leftdpad = GLOBAL.CONTROL_FOCUS_LEFT

local function GetEjectControl()
	if EJECTCONTROL == 2 then --Left and Right Bumpers
		--_EJECTCONTROL = "\238\128\135 and \238\128\138"
		return leftbumper
	elseif EJECTCONTROL == 3 then --Left and Right Stick Press
		--_EJECTCONTROL = "\238\128\134 and \238\128\137"
		return leftstickpress
	elseif EJECTCONTROL == 2 then --Left D-Pad
		--_EJECTCONTROL = "\238\128\141"
		return leftdpad
	else
		return nil
	end
end

if GetEjectControl() ~= nil then --in case no controller bind is set
	GLOBAL.TheInput:AddControlHandler(GetEjectControl(), function()
		--if GLOBAL.TheInput:ControllerAttached() and GLOBAL.TheInput:IsControlPressed(leftdpad) then
		if IsDefaultScreen() and GLOBAL.ThePlayer:HasTag("tapemaker") then
			if EJECTCONTROL == 2 then --Left and Right Bumpers
				if GLOBAL.TheInput:IsControlPressed(rightbumper) then
					--print("DEBUG: Bumper input successful!")
					--GLOBAL.ThePlayer.components.talker:Say("Bumpers pressed!")
					FakeEjectAction(GLOBAL.ThePlayer)
				end
			elseif EJECTCONTROL == 3 then --Left and Right Stick Press
				if GLOBAL.TheInput:IsControlPressed(rightstickpress) then
					--print("DEBUG: Stick press input successful!")
					--GLOBAL.ThePlayer.components.talker:Say("Both Sticks Pressed!")
					FakeEjectAction(GLOBAL.ThePlayer)
				end
			else --Left D-Pad
				--print("DEBUG: Dpad input successful!")
				--GLOBAL.ThePlayer.components.talker:Say("D-Pad Left Pressed!")
				FakeEjectAction(GLOBAL.ThePlayer)
			end
		end
	end)
end


GLOBAL.TheInput:AddKeyDownHandler(EJECTKEY, function()
	--if GLOBAL.TheInput:ControllerAttached() and GLOBAL.TheInput:IsControlPressed(leftdpad) then
	if IsDefaultScreen() and GLOBAL.ThePlayer:HasTag("tapemaker") then
		--print("DEBUG: controller input successful!")
		--GLOBAL.ThePlayer.components.talker:Say("R key pressed!")
		FakeEjectAction(GLOBAL.ThePlayer)
	end
end)

--CONTAINER SETUP
---------------------------------------------------------------------------------------------

--I've decided to scrap the container for now, I just couldn't get it working (I also decided that it wasn't 100% necessary for the character)
--Leaving the code here in case I ever change my mind

local Vector3 = GLOBAL.Vector3
local containers = GLOBAL.require "containers"
local params = containers.params

local containers_widgetsetup_base = containers.widgetsetup

function containers.widgetsetup(container, prefab, data)
	local t = params[prefab or container.inst.prefab]
	if t ~= nil then
		for k, v in pairs(t) do
			container[k] = v
		end
		container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
	else
		containers_widgetsetup_base(container, prefab, data)
	end
end

params.tapestorage_container =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_tapestorage_4x5", --ui_bookstation_4x5
        animbuild = "ui_tapestorage_4x5",
        pos = Vector3(0, 280, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 0, 4 do
	table.insert(params.tapestorage_container.widget.slotpos, Vector3(-114      , (-77 * y) + 37 - (y * 2), 0))
	table.insert(params.tapestorage_container.widget.slotpos, Vector3(-114 + 75 , (-77 * y) + 37 - (y * 2), 0))
	table.insert(params.tapestorage_container.widget.slotpos, Vector3(-114 + 150, (-77 * y) + 37 - (y * 2), 0))
	table.insert(params.tapestorage_container.widget.slotpos, Vector3(-114 + 225, (-77 * y) + 37 - (y * 2), 0))
end

function params.tapestorage_container.itemtestfn(container, item, slot)
	return item:HasTag("jacketpocketfit")
end

local defstable = GLOBAL.require("prefabs/pocketdimensioncontainer_defs").POCKETDIMENSIONCONTAINER_DEFS --existing pocket dimension defs
local tape = {
	name = "tape",
	prefab = "tapestorage_container",
	ui = "anim/ui_bookstation_4x5.zip",
	widgetname = "tapestorage_container",
	--tags = { "spoiler" }, --tags to add to the container
}
table.insert(defstable, tape)

--print("DEBUG: dumping pocket dimension table...")
--dumptable(defstable)

--params.tvheadguy = {
--    widget =
--    {
--		slotpos =
--        {
--            --Vector3(0,   32 + 4,  0),
--        },
--        slotbg =
--        {},
--        animbank = "ui_chest_3x2",
--        animbuild = "ui_chest_3x2",
--        pos = Vector3(0, 7, 0),
--    },
--    usespecificslotsforitems = true,
--    type = "hand_inv",
--	excludefromcrafting = false,
--}
----TODO: figure out why it doesn't like jacketslot.tex
--local SLOT_BG = { image = "spore_slot.tex", atlas = "images/hud2.xml" } --{ image = "images/neck.tex", atlas = "images/neck.xml" }
--
--local JACKETSLOTS_SLOTSTART = -77
--local JACKETSLOTS_SLOTDIFF = 75
--
--for i = 0, 2 do
--	local sp = Vector3( JACKETSLOTS_SLOTSTART + (JACKETSLOTS_SLOTDIFF*i), -75 + 116, 0)
--	table.insert(params.tvheadguy.widget.slotpos, sp)
--	table.insert(params.tvheadguy.widget.slotbg, SLOT_BG)
--end
--
--function params.tvheadguy.itemtestfn(container, item, slot)
--    return item:HasTag("jacketpocketfit")
--end
--
for k, v in pairs(params) do
	containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, params.tapestorage_container.widget.slotpos ~= nil and #params.tapestorage_container.widget.slotpos or 0)
end

--METER SETUP
---------------------------------------------------------------------------------------------
local KnownModIndex = GLOBAL.KnownModIndex

local function GetModName(modname) -- modinfo's modname and internal modname is different.
    for _, knownmodname in ipairs(KnownModIndex:GetModsToLoad()) do
        if KnownModIndex:GetModInfo(knownmodname).name == modname  then
            return knownmodname
        end
    end
end

AddReplicableComponent("itchmeter")

--[[if GLOBAL.KnownModIndex:IsModEnabled("workshop-343753877") then
	AddClassPostConstruct("widgets/statusdisplays", function(self)
		if self.owner and self.owner:HasTag("tapemaker") then
			if self.itchmeter then
				self._custombadge = self.itchmeter
			end
		end
	end)


	local PlayerHud = require("screens/playerhud")
	local PlayerHud_SetMainCharacter = PlayerHud.SetMainCharacter
	function PlayerHud:SetMainCharacter(maincharacter, ...)
		PlayerHud_SetMainCharacter(self, maincharacter, ...)
		self.inst:DoTaskInTime(0, function()
			if self._StatusAnnouncer then
				self._StatusAnnouncer:RegisterStat(
					GLOBAL.STRINGS.NAMES.ITCHMETER,
					HUD.controls.status._custombadge, -- you could also give it your_custom_badge
					CONTROL_ROTATE_LEFT, -- Left Bumper; keep this as-is
					{     .10,    .40,   .70,    .90      }, -- you can also set custom thresholds
					{"EMPTY", "LOW", "MID", "HIGH", "FULL"}, -- or custom category names, just match them with your strings table
					function(ThePlayer)
						return	ThePlayer.components.itchmeter:GetCurrent(), --todo: ensure that 'ThePlayer' is actually the player here
								ThePlayer.components.itchmeter:GetMax()
					end,
					nil -- you can give this a function if your character has multiple modes with different strings, see Woodie and StatusAnnouncer:RegisterCommonStats
				)
			end
		end)
	end
end ]]

AddClassPostConstruct("widgets/statusdisplays", function(self)
	if self.owner:HasTag("tapemaker") then
		local itchmeter = require "widgets/itchbadge"
		self.tvitch = self:AddChild(itchmeter(self.owner))
		self.tvitch:SetPosition(-40, 20, 0) --original: -120, 20, 0

		if GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686") then --combined status
			self.tvitch:SetPosition(-62, 35, 0) --original: -130, 35, 0
		end
	--Status Announcements
		if GLOBAL.KnownModIndex:IsModEnabled("workshop-343753877") then
			if self.owner.components.itchmeter then
				self._custombadge = self.owner.components.itchmeter
			end
		end

		local function OnSetPlayerMode(self)
			if self.onitchmeterdelta == nil then
				self.onitchmeterdelta = function(owner, data) self:ItchmeterDelta(data) end
				self.inst:ListenForEvent("itchmeterdelta", self.onitchmeterdelta, self.owner)

				if self.owner.replica.itchmeter then
					self:ItchmeterDelta({newpercent = self.owner.replica.itchmeter:GetPercent(),
						max = self.owner.replica.itchmeter:GetMax(),
						currentitchmeter = self.owner.replica.itchmeter:GetCurrent(),
						maxitchmeter = self.owner.replica.itchmeter:GetMax()})
				end
			end
		end

		local function OnSetGhostMode(self)
			if self.onitchmeterdelta ~= nil then
				self.inst:RemoveEventCallback("itchmeterdelta", self.onitchmeterdelta, self.owner)
				self.onitchmeterdelta = nil
			end
		end

		self._SetGhostMode = self.SetGhostMode
		function self:SetGhostMode(ghostmode)
			self._SetGhostMode(self, ghostmode)
			if ghostmode then
				self.tvitch:Hide()
				OnSetGhostMode(self)
			else
				self.tvitch:Show()
				OnSetPlayerMode(self)
			end
		end
		function self:ItchmeterDelta(data)
			self.inst:DoTaskInTime(1, function() self.tvitch:SetPercent(data.newpercent, data.max, data.currentitchmeter, data.maxitchmeter) end) --possible race condition when loading into caves --NOPE
		end
			OnSetPlayerMode(self)
	end

	return self
end)

local PlayerHud = require("screens/playerhud")
	local PlayerHud_SetMainCharacter = PlayerHud.SetMainCharacter
	function PlayerHud:SetMainCharacter(maincharacter, ...)
		PlayerHud_SetMainCharacter(self, maincharacter, ...)
		self.inst:DoTaskInTime(0, function()
			if self._StatusAnnouncer then
				self._StatusAnnouncer:RegisterStat(
					GLOBAL.STRINGS.NAMES.ITCHMETER,
					self.owner.components.itchmeter, -- you could also give it your_custom_badge
					CONTROL_ROTATE_LEFT, -- Left Bumper; keep this as-is
					{     .10,    .40,   .70,    .90      }, -- you can also set custom thresholds
					{"EMPTY", "LOW", "MID", "HIGH", "FULL"}, -- or custom category names, just match them with your strings table
					function(ThePlayer)
						return	ThePlayer.player_classified.itchmeter:GetCurrent(), --confirmed correct
								ThePlayer.player_classified.itchmeter:GetMax()
					end,
					nil -- you can give this a function if your character has multiple modes with different strings, see Woodie and StatusAnnouncer:RegisterCommonStats
				)
			end
		end)
	end

--INVIS SETUP
---------------------------------------------------------------------------------------------

--Invisibility code borrowed from Gollum mod
--serverside stuff
if GLOBAL.TheNet and GLOBAL.TheNet:GetIsServer() then

	local comp_combat = GLOBAL.require "components/combat"
	local old_SuggestTarget = comp_combat.SuggestTarget
	function comp_combat:SuggestTarget(target,...)
		if not(target and target.tapeinvisible and not self.inst:HasTag("player")) then
			return old_SuggestTarget(self,target,...)
		end
	end
	
	local old_SetTarget = comp_combat.SetTarget
	function comp_combat:SetTarget(target,...)
		if not(target and target.tapeinvisible and not self.inst:HasTag("player")) then
			return old_SetTarget(self,target,...)
		end
	end
end

local comb_rep = GLOBAL.require "components/combat_replica"
local old_IsAlly = comb_rep.IsAlly
function comb_rep:IsAlly(guy,...)
	if guy.tapeinvisible then
		return true
	end
	return old_IsAlly(self,guy,...)
end

--clientside anims
local function UpdateAnim(inst,once)
	local data = inst.m_compatibility
	if data then
		if data.task then
			data.task:Cancel()
		end
		if data.time_create then
			if data.time_create + 15 > GLOBAL.GetTime() then
				once = false
			else
				data.time_create = nil
			end
		end
		data.task_cnt = once and 15 or 0
		data.task = inst:DoPeriodicTask(0.2+math.random()*0.05,function(inst)
			--print("UpdateAnim: "..tostring(data.task_cnt))
			local f = data.test
			--transp
			if inst.AnimState then
				local t = 1
				for k,m in pairs(data.transp) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					local m_val = type(m[ofs])=="function" and m[ofs](inst) or m[ofs]
					if m_val < t then
						t = m_val --minimum
					end
				end
				inst.AnimState:SetMultColour(t,t,t,t)
			end
			--icon
			if inst.MiniMapEntity then
				local show_icon = true
				for k,m in pairs(data.invisicon) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					if not m[ofs] then
						show_icon = false
						break
					end
				end
				inst.MiniMapEntity:SetEnabled(show_icon)
			end
			--shadow
			if inst.DynamicShadow then
				local show_shadow = true
				for k,m in pairs(data.shadow) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					if not m[ofs] then
						show_shadow = false
						break
					end
				end
				inst.DynamicShadow:Enable(show_shadow)
			end
			--indicator
			local show_indicator = true
			for k,m in pairs(data.indicator) do
				local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
					+(f[k][3](inst) and 0 or 3) --is it hidden at all?
				if not m[ofs] then
					show_indicator = false
					break
				end
			end
			if show_indicator then
				inst:RemoveTag("noplayerindicator")
			else
				inst:AddTag("noplayerindicator")
			end
			--time out
			data.task_cnt = data.task_cnt + 1
			if data.task_cnt > 15 then
				data.task:Cancel()
				data.task = nil
			end
		end,0.05)
	end
end

local function on_tapeinvisible(inst)
	inst.tapeinvisible = inst.net_tapeinvisible:value()
	inst.m_compatibility.UpdateAnim(inst)
end

local function test_owner(inst)
	return (inst == GLOBAL.ThePlayer)
end

local function test_ally(inst)
	return GLOBAL.ThePlayer and inst.m_friends and inst.m_friends[GLOBAL.ThePlayer.userid]
	--return false
end

local function test_hidden(inst)
	return inst.tapeinvisible
end

local function MakeTapeInvisible(inst)
	if not inst.m_compatibility then
		inst.m_compatibility =
		{
			transp = {}, --mods
			test = {}, --criteria functions
			invisicon = {},
			shadow = {},
			indicator = {},
			UpdateAnim = UpdateAnim,
			time_create = GLOBAL.GetTime(),
			--current = {},
		}
	end
	local data = inst.m_compatibility
	data.test.tvheadguy = { test_owner, test_ally, test_hidden } --only 2 functions, because neutral is default result
	data.transp.tvheadguy = {0.3,0,0,1,1,1} --hidden owner/ally/neutral + unhidden owner/ally/neutral
	data.invisicon.tvheadguy = {true,true,false,true,true,true} --false is better
	data.shadow.tvheadguy = {false,false,false,true,true,true} --false is better
	data.indicator.tvheadguy = {true,true,false,true,true,true} --false is better
	--Network part
	inst.tapeinvisible = false
	inst.net_tapeinvisible = GLOBAL.net_bool(inst.GUID,"tapeinvisible","event_tapeinvisible")
	if not GLOBAL.TheWorld.ismastersim then
		inst:ListenForEvent("event_tapeinvisible", on_tapeinvisible)
		return
	end
end

AddPlayerPostInit(MakeTapeInvisible)

--RECIPES
---------------------------------------------------------------------------------------------
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
RegisterInventoryItemAtlas("images/inventoryimages/tape_portal.xml", "tape_portal.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tapestorage.xml", "tapestorage.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_invis_upgraded.xml", "tape_invis_upgraded.tex")
RegisterInventoryItemAtlas("images/inventoryimages/tape_lightning_upgraded.xml", "tape_lightning_upgraded.tex")

require("recipe")
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS

Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH

--local suchandsuch = name, ingredients, tab, level, placer, min_spacing, nounlock, numtogive, builder_tag, atlas, image, testfn
--local tapebitsrecipe1 = AddRecipe("tapebits_1", {Ingredient("tapebits_busted", 3), Ingredient("cutgrass", 2)}, RECIPETABS.REFINE, TECH.NONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tapebits_1.xml")
--local tapebitsrecipe2 = AddRecipe("tapebits_2", {Ingredient("tapebits_busted", 3), Ingredient("twigs", 2)}, RECIPETABS.REFINE, TECH.NONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tapebits_2.xml")
--local tapebitsrecipe3 = AddRecipe("tapebits_3", {Ingredient("tapebits_busted", 3), Ingredient("flint", 1)}, RECIPETABS.REFINE, TECH.NONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tapebits_3.xml")
--local tapebroadcastrecipe = AddRecipe("tape_broadcast", {Ingredient("tapebits_1", 1), Ingredient("tapebits_2", 1), Ingredient("flint", 3)}, RECIPETABS.SCIENCE, TECH.NONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_broadcast.xml")
--local tapescannerrecipe = AddRecipe("tape_scanner", {Ingredient("tapebits_1", 2), Ingredient("tapebits_2", 1), Ingredient("tapebits_3", 1), Ingredient("compass", 1)}, RECIPETABS.SCIENCE, TECH.SCIENCE_ONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_scanner.xml")
--local tapesysrestorerrecipe = AddRecipe("tape_sysrestore", {Ingredient("tapebits_1", 1), Ingredient("tapebits_2", 1), Ingredient("tapebits_3", 1), Ingredient("papyrus", 3)}, RECIPETABS.SCIENCE, TECH.SCIENCE_ONE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_sysrestore.xml")
--local tapenightvisrecipe = AddRecipe("tape_nightvis", {Ingredient("tapebits_1", 1), Ingredient("tapebits_2", 2), Ingredient("tapebits_3", 1), Ingredient("lightbulb", 4)}, RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_nightvis.xml")
--local tapeslowmorecipe = AddRecipe("tape_slowmo", {Ingredient("tapebits_1", 1), Ingredient("tapebits_2", 1), Ingredient("tapebits_3", 2), Ingredient("bluegem", 1)}, RECIPETABS.MAGIC, TECH.MAGIC_TWO, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_slowmo.xml")
--local tapeinvisrecipe = AddRecipe("tape_invis", {Ingredient("tapebits_1", 2), Ingredient("tapebits_2", 1), Ingredient("tapebits_3", 1), Ingredient("ash", 3)}, RECIPETABS.MAGIC, TECH.MAGIC_THREE, nil, nil, nil, nil, "tapemaker", "images/inventoryimages/tape_invis.xml") --MAGIC_TWO is prestihatitator

local tapebitsrecipe1 = AddCharacterRecipe("tapebits_1",
	{
		GLOBAL.Ingredient("tapebits_busted", 2), GLOBAL.Ingredient("cutgrass", 2)
	},
	GLOBAL.TECH.NONE,
	{
		product = "tapebits_1",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapebitsrecipe2 = AddCharacterRecipe("tapebits_2",
	{
		GLOBAL.Ingredient("tapebits_busted", 2), GLOBAL.Ingredient("twigs", 2)
	},
	GLOBAL.TECH.NONE,
	{
		product = "tapebits_2",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapebitsrecipe3 = AddCharacterRecipe("tapebits_3",
	{
		GLOBAL.Ingredient("tapebits_busted", 2), GLOBAL.Ingredient("twigs", 1), GLOBAL.Ingredient("cutgrass", 1) --GLOBAL.Ingredient("flint", 1)
	},
	GLOBAL.TECH.NONE,
	{
		product = "tapebits_3",
		builder_tag = "tapemaker",
		--numtogive = 2,
	},
	{
	}
)
local tapestoragerecipe = AddCharacterRecipe("tapestorage",
	{
		GLOBAL.Ingredient("livinglog", 2), GLOBAL.Ingredient("tapebits_2", 5), GLOBAL.Ingredient("tapebits_3", 3) --"boards", 4
	},
	GLOBAL.TECH.NONE,
	{
		product = "tapestorage",
		builder_skill = "tvheadguy_storage_2",
		placer= "tapestorage_placer",
		min_spacing = 1.5,
	},
	{
	}
)
local tapeportalrecipe = AddCharacterRecipe("tape_portal",
	{
		GLOBAL.Ingredient("tapebits_1", 1), GLOBAL.Ingredient("tapebits_2", 1), GLOBAL.Ingredient("tapebits_3", 1), GLOBAL.Ingredient("feather_crow", 1) --"feather_robin_winter"
	},
	GLOBAL.TECH.NONE,
	{
		product = "tape_portal",
		builder_skill = "tvheadguy_storage_3",
	},
	{
	}
)
local tapebroadcastrecipe = AddCharacterRecipe("tape_broadcast",
	{
		GLOBAL.Ingredient("tapebits_1", 1), GLOBAL.Ingredient("tapebits_2", 1), GLOBAL.Ingredient("flint", 2)
	},
	GLOBAL.TECH.NONE,
	{
		product = "tape_broadcast",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapehypercastrecipe = AddCharacterRecipe("tape_hypercast",
	{
		GLOBAL.Ingredient("tapebits_1", 1), GLOBAL.Ingredient("tapebits_2", 1), GLOBAL.Ingredient("tapebits_3", 2), GLOBAL.Ingredient("goldnugget", 3)
	},
	GLOBAL.TECH.SCIENCE_ONE,
	{
		product = "tape_hypercast",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapescannerrecipe = AddCharacterRecipe("tape_scanner",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 1), GLOBAL.Ingredient("tapebits_3", 1), GLOBAL.Ingredient("compass", 1)
	},
	GLOBAL.TECH.SCIENCE_ONE,
	{
		product = "tape_scanner",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapesysrestorerrecipe = AddCharacterRecipe("tape_sysrestore",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 2), GLOBAL.Ingredient("tapebits_3", 2), GLOBAL.Ingredient("papyrus", 2)
	},
	GLOBAL.TECH.SCIENCE_ONE,
	{
		product = "tape_sysrestore",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapenightvisrecipe = AddCharacterRecipe("tape_nightvis",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 3), GLOBAL.Ingredient("tapebits_3", 2), GLOBAL.Ingredient("fireflies", 1)
	},
	GLOBAL.TECH.SCIENCE_TWO,
	{
		product = "tape_nightvis",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapepigrecipe = AddCharacterRecipe("tape_pig",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 2), GLOBAL.Ingredient("tapebits_3", 3), GLOBAL.Ingredient("onemanband", 1)
	},
	GLOBAL.TECH.MAGIC_TWO, --presti
	{
		product = "tape_pig",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapeelectricrecipe = AddCharacterRecipe("tape_electric",
	{
		GLOBAL.Ingredient("tapebits_1", 3), GLOBAL.Ingredient("tapebits_2", 2), GLOBAL.Ingredient("tapebits_3", 2), GLOBAL.Ingredient("transistor", 1)
	},
	GLOBAL.TECH.SCIENCE_TWO,
	{
		product = "tape_electric",
		builder_tag = "tapemaker",
	},
	{
	}
)
--local tapeslowmorecipe = AddCharacterRecipe("tape_slowmo", --i dont wanna play with you anymore
--	{
--		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 1), GLOBAL.Ingredient("tapebits_3", 1), GLOBAL.Ingredient("bluegem", 1)
--	},
--	GLOBAL.TECH.MAGIC_TWO, --presti
--	{
--		product = "tape_slowmo",
--		builder_tag = "tapemaker",
--	},
--	{
--	}
--)
local tapelightningrecipe = AddCharacterRecipe("tape_lightning",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 3), GLOBAL.Ingredient("tapebits_3", 2), GLOBAL.Ingredient("moonglass", 2)
	},
	GLOBAL.TECH.MAGIC_THREE, --WAS CELESTIAL_ONE, too many weird behaviours in ui --moon altar or moonrockseed
	{
		product = "tape_lightning",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapeinvisrecipe = AddCharacterRecipe("tape_invis",
	{
		GLOBAL.Ingredient("tapebits_1", 2), GLOBAL.Ingredient("tapebits_2", 2), GLOBAL.Ingredient("tapebits_3", 3), GLOBAL.Ingredient("ash", 3)
	},
	GLOBAL.TECH.MAGIC_THREE, --manip
	{
		product = "tape_invis",
		builder_tag = "tapemaker",
	},
	{
	}
)
local tapeinvisupgradedrecipe = AddCharacterRecipe("tape_invis_upgraded",
	{
		GLOBAL.Ingredient("tape_invis", 1), GLOBAL.Ingredient("tapebits_busted", 6), GLOBAL.Ingredient("dreadstone", 2), GLOBAL.Ingredient("horrorfuel", 2),
	},
	GLOBAL.TECH.NONE,
	{
		product = "tape_invis_upgraded",
		builder_skill = "tvheadguy_affinity_shadow_tapeupgrade",
	},
	{
	}
)
local tapelightningupgradedrecipe = AddCharacterRecipe("tape_lightning_upgraded",
	{
		GLOBAL.Ingredient("tape_lightning", 1), GLOBAL.Ingredient("tapebits_busted", 6), GLOBAL.Ingredient("purebrilliance", 2), GLOBAL.Ingredient("lunarplant_husk", 2),
	},
	GLOBAL.TECH.NONE,
	{
		product = "tape_lightning_upgraded",
		builder_skill = "tvheadguy_affinity_lunar_tapeupgrade",
	},
	{
	}
)

--custom order setup
local newrecipes = {
{"tapebits_1", {GLOBAL.CRAFTING_FILTERS.REFINE}, 5},
{"tapebits_2", {GLOBAL.CRAFTING_FILTERS.REFINE}, 6},
{"tapebits_3", {GLOBAL.CRAFTING_FILTERS.REFINE}, 7},
{"tape_portal", {GLOBAL.CRAFTING_FILTERS.CONTAINERS}, 13},
{"tapestorage", {GLOBAL.CRAFTING_FILTERS.CONTAINERS}, 13},
{"tape_broadcast", {GLOBAL.CRAFTING_FILTERS.PROTOTYPERS}, 2},
{"tape_hypercast", {GLOBAL.CRAFTING_FILTERS.PROTOTYPERS}, 4},
{"tape_scanner", {GLOBAL.CRAFTING_FILTERS.TOOLS}, 20},
{"tape_sysrestore", {GLOBAL.CRAFTING_FILTERS.RESTORATION}, 1},
{"tape_nightvis", {GLOBAL.CRAFTING_FILTERS.LIGHT}, 9},
{"tape_pig", {GLOBAL.CRAFTING_FILTERS.GARDENING, GLOBAL.CRAFTING_FILTERS.MAGIC}, 13},
{"tape_electric", {GLOBAL.CRAFTING_FILTERS.WEAPONS}, 11},
--{"tape_slowmo", {GLOBAL.CRAFTING_FILTERS.WEAPONS, GLOBAL.CRAFTING_FILTERS.MAGIC}, 11},
{"tape_invis", {GLOBAL.CRAFTING_FILTERS.WEAPONS, GLOBAL.CRAFTING_FILTERS.MAGIC}, 12},
{"tape_invis_upgraded", {GLOBAL.CRAFTING_FILTERS.WEAPONS, GLOBAL.CRAFTING_FILTERS.MAGIC}, 13},
{"tape_lightning", {GLOBAL.CRAFTING_FILTERS.WEAPONS, GLOBAL.CRAFTING_FILTERS.MAGIC,}, 14},
{"tape_lightning_upgraded", {GLOBAL.CRAFTING_FILTERS.WEAPONS, GLOBAL.CRAFTING_FILTERS.MAGIC,}, 15}, --GLOBAL.CRAFTING_FILTERS.CRAFTING_STATION},
}

--credit to audacious grass#4699 for this function :)
function AddRecipeToFilterAtFront(recipe_name, filters_names, pos)
   -- local filter = GLOBAL.CRAFTING_FILTERS[filter_name]
	for k, filter in pairs(filters_names) do
    	if filters_names ~= nil then --and filters_names[filter].default_sort_values[recipe_name] == nil then
    	    -- Push all items foward and insert recipe at front
    	    table.insert(filter.recipes, pos, recipe_name)
    	    -- Regenerate default_sort_values
    	    filter.default_sort_values = table.invert(filter.recipes)
    	end
	end
end

for k, recipe in pairs(newrecipes) do
	AddRecipeToFilterAtFront(recipe[1], recipe[2], recipe[3]) --name, filter, position
end


--CHARACTER STRINGS
---------------------------------------------------------------------------------------------

--GENERIC STRINGS
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local fn = require("play_commonfn")
local fns = require("play_commonfn")
local push_acting = require("play_commonfn")
local general_scripts = require("play_generalscripts")

--require("tvheadguy_strings")

GLOBAL.PREFAB_SKINS["tvheadguy"] = {"tvheadguy_none", "ms_tvheadguy_pirate", "ms_tvheadguy_triumphant", "ms_tvheadguy_rose",}

--CUSTOM STAGEPLAY
STRINGS.STAGEACTOR.TVHEADGUY1 =
{
    "How was I s'posed to know?",
    "When bad things happen, you've just gotta go",
    "Fight or flight, as they say",
    "Maybe I'll be back another day.",
	"For now I'm stuck in a rut",
	"Before out of here I can strut.",
}

--todo: figure out how to override face symbols as a line (will need full version of mod)
--local FACE_DATA = {act = "bow"}
--fns.showtvface = function(inst, line, cast)
--    if cast == nil then return end
--	for costume, data in pairs(cast) do
--		data.castmember:DoTaskInTime(0.1 + 0.4*math.random(), push_acting, FACE_DATA)
--	end
--end


general_scripts.TVHEADGUY1 = {
    cast = { "tvheadguy" },
    lines = {
		--{actionfn = fn.startitchregen,   duration = 0.1, },
		{roles = {"tvheadguy"},        duration = 2.5, line = STRINGS.STAGEACTOR.TVHEADGUY1[1]},
        {roles = {"tvheadguy"},        duration = 3.0, line = STRINGS.STAGEACTOR.TVHEADGUY1[2]},
		--{actionfn = fn.showtvface,   duration = 2.5, },
        {roles = {"tvheadguy"},        duration = 3.0, line = STRINGS.STAGEACTOR.TVHEADGUY1[3]},
        {roles = {"tvheadguy"},        duration = 3.0, line = STRINGS.STAGEACTOR.TVHEADGUY1[4]},
		--{actionfn = fn.showtvface,   duration = 2.5, },
        {roles = {"tvheadguy"},        duration = 3.0, line = STRINGS.STAGEACTOR.TVHEADGUY1[5]},
		{roles = {"tvheadguy"},        duration = 3.0, line = STRINGS.STAGEACTOR.TVHEADGUY1[6]},
		--{actionfn = fn.showtvface,   duration = 2.5, }, --reset face
		{actionfn = fn.actorsbow,   duration = 0.2, },
    },
}

--STATUS ANNOUNCEMENTS
if GLOBAL.KnownModIndex:IsModEnabled("workshop-343753877") then
	if not GLOBAL.STRINGS._STATUS_ANNOUNCEMENTS then GLOBAL.STRINGS._STATUS_ANNOUNCEMENTS = {} end
	GLOBAL.STRINGS._STATUS_ANNOUNCEMENTS.TVHEADGUY = {
		HUNGER = {
			FULL  = "That's funny. I don't even have a stomach!", 	-- >75%
			HIGH  = "That's funny. I don't even have a stomach!",			-- >55%
			MID   = "That's funny. I don't even have a stomach!", 	-- >35%
			LOW   = "That's funny. I don't even have a stomach!", 				-- >15%
			EMPTY = "That's funny. I don't even have a stomach!", 			-- <15%
		},
		SANITY = {
			FULL  = "Feeling great, and ready to start digging.", 			-- >75%
			HIGH  = "Hm. Nah, I'm good.", 				-- >55%
			MID   = "All's good up here! Mostly.", 				-- >35%
			LOW   = "Gahh. Having that horrible feeling something's watching me.", 			-- >15%
			EMPTY = "I- I'm okay. Right??", 	-- <15%
		},
		HEALTH = {
			FULL  = "My body's in tip top shape!", 	-- 100%
			HIGH  = "Just need a touch of maintenance, is all.", 	-- >75%
			MID   = "Now, where did I put my maintenance manual...", 			-- >50%
			LOW   = "Time for some system restoration, I reckon.", 	-- >25%
			EMPTY = "I've got things to do. Now isn't the time to become a scrap heap.", 	-- <25%
		},
		WETNESS = {
			FULL  = "Yeuch!! Get it off!!", 	-- >75%
			HIGH  = "Okay. It's okay! I'm sure there's a towel around here somewhere.",					-- >55%
			MID   = "I don't like this. I really hate this.", 				-- >35%
			LOW   = "I don't feel like testing if I'm waterproof or not.", 		-- >15%
			EMPTY = "S'just a bit of water. Right?", 				-- <15%
		},
		ITCHMETER = {
			FULL  = "Full up. My supervisors are satiated.", 	-- >90%
			HIGH  = "Feels pretty good to be doing my job.",					-- >73%
			MID   = "That prickling feeling is getting stronger.", 				-- >38%
			LOW   = "Can't forget my origins. Even out here.", 		-- >10%
			EMPTY = "I think it's about time I scratched this itch.", 				-- <10%
		},
	}
end

function tvheadguy_setup_custom_loading_tips() --apparently this has to be global, dont' kill me
	--local exampletipid = "TIP_CUSTOM_EXAMPLE" -- This tip ID must be unique.
	--local exampletipstring = "This is an example loading tip string! Press {attack} to attack!"
	--local controltipdata = { attack = GLOBAL.CONTROL_ATTACK } -- Refer to constants.lua for a list of control constants.

	-- Refer to strings.lua for possible loading tip string table categories. For tips with no control button inputs, controltipdata can be set to nil.
	--AddLoadingTip(STRINGS.UI.LOADING_SCREEN_OTHER_TIPS, exampletipid, exampletipstring, controltipdata)

	for _tipid, _tipstring in pairs(STRINGS.TVHEADGUY_LOADING_TIPS.SURVIVAL) do
		AddLoadingTip(STRINGS.UI.LOADING_SCREEN_SURVIVAL_TIPS, _tipid, _tipstring, nil)
	end

	for _tipid, _tipstring in pairs(STRINGS.TVHEADGUY_LOADING_TIPS.LORE) do
		AddLoadingTip(STRINGS.UI.LOADING_SCREEN_LORE_TIPS, _tipid, _tipstring, nil)
	end

	-- A higher weight means a greater chance for a tip category to be chosen.
	-- In this example, weights are set so that tips in the 'other' category are always shown.
	--local tipcategorystartweights =
	--{
	--	CONTROLS = 0,
	--	SURVIVAL = 0,
	--	LORE = 0,
	--	LOADING_SCREEN = 0,
	--	OTHER = 1,
	--}
	--SetLoadingTipCategoryWeights(GLOBAL.LOADING_SCREEN_TIP_CATEGORY_WEIGHTS_START, tipcategorystartweights)

	--local tipcategoryendweights =
	--{
	--	CONTROLS = 0,
	--	SURVIVAL = 0,
	--	LORE = 0,
	--	LOADING_SCREEN = 0,
	--	OTHER = 1,
	--}
	--SetLoadingTipCategoryWeights(GLOBAL.LOADING_SCREEN_TIP_CATEGORY_WEIGHTS_END, tipcategoryendweights)

	-- Loading tip icon
	--SetLoadingTipCategoryIcon("OTHER", "images/categoryicon.xml", "categoryicon.tex")

	GLOBAL.TheLoadingTips = require("loadingtipsdata")()

	-- Recalculate loading tip & category weights.
	local TheLoadingTips = GLOBAL.TheLoadingTips
	TheLoadingTips.loadingtipweights = TheLoadingTips:CalculateLoadingTipWeights()
    TheLoadingTips.categoryweights = TheLoadingTips:CalculateCategoryWeights()

	GLOBAL.TheLoadingTips:Load()
end

--TUNING
------------------------------------------------------------------------------
local TUNING = GLOBAL.TUNING

TUNING.TVFLICKERCONFIG = false
local tvflickerconfig = GetModConfigData("TVFLICKEREFFECTS_ON")
if tvflickerconfig == true then
	TUNING.TVFLICKERCONFIG = true
end

--EOF
------------------------------------------------------------------------------
GLOBAL.require("tvheadguy_commands")

tvheadguy_setup_custom_loading_tips()
CreateSkillTree()
AddMinimapAtlas("images/map_icons/tvheadguy.xml")
AddMinimapAtlas("images/map_icons/tapestorage.xml")
AddModCharacter("tvheadguy", "ROBOT")
return containers
--return general_scripts