local assets=
{ 
    Asset("ANIM", "anim/tapecache.zip"),

    Asset("ATLAS", "images/inventoryimages/tapecache.xml"),
    Asset("IMAGE", "images/inventoryimages/tapecache.tex"),
}

local prefabs =
{
	"wetpouch_unwrap",
}
--6 loot pools is ideal for even tape (and therefore tape bit) distribution
--we don't want players gradually getting more of 1 type of bit over time

--default
SetSharedLootTable('tapecacheloot1',
{
	{"tape1", 0.5},
	{"tape2", 0.5},
	{"tape3", 0.75},
	{"tape4", 0.75},
	{"tapebits_busted", 0.5}
})
--chef
SetSharedLootTable('tapecacheloot2',
{
	{"tape1", 0.75},
	{"tape2", 0.75},
	{"tape3", 0.5},
	{"tape4", 0.5},
	{"cookingrecipecard", 0.5},
	{"cookingrecipecard", 0.5},
	{"potato", 0.75},
	{"seeds", 1},
	{"seeds", 0.75},
	{"seeds", 0.5}
})
--scribe
SetSharedLootTable('tapecacheloot3',
{
	{"tape1", 0.5},
	{"tape2", 0.75},
	{"tape3", 0.75},
	{"tape4", 0.5},
	{"tapebits_busted", 0.5},
	{"papyrus", 0.4},
	{"scrapbook_page", 0.5},
	{"scrapbook_page", 0.5},
	{"featherpencil", 0.25},
	{"chesspiece_anchor_sketch", 0.05},
	{"chesspiece_muse_sketch", 0.05},
	{"chesspiece_pawn_sketch", 0.05}
})
--fisher
SetSharedLootTable('tapecacheloot4',
{
	{"tape1", 0.75},
	{"tape2", 0.5},
	{"tape3", 0.5},
	{"tape4", 0.75},
	{"oceanfishinglure_hermit_drowsy_tacklesketch", 0.15},
	{"oceanfishinglure_hermit_heavy_tacklesketch", 0.15},
	{"oceanfishinglure_hermit_snow_tacklesketch", 0.15},
	{"oceanfishinglure_hermit_rain_tacklesketch", 0.15},
	{"twigs", 1},
	{"twigs", 1},
	{"twigs", 0.75},
	{"spoiled_fish", 0.5},
	{"spoiled_fish_small", 0.75},
	{"trinket_8", 0.05} --rubber bung
})
--broken
SetSharedLootTable('tapecacheloot5',
{
	{"tape1", 0.75},
	{"tape2", 0.5},
	{"tape3", 0.75},
	{"tape4", 0.5},
	{"tapebits_busted", 1},
	{"tapebits_busted", 0.75},
	{"tapebits_busted", 0.25},
	{"ash", 1},
	{"ash", 1},
	{"ash", 0.5}
})
--arby
SetSharedLootTable('tapecacheloot6',
{
	{"tape1", 0.5},
	{"tape2", 0.75},
	{"tape3", 0.5},
	{"tape4", 0.75},
	{"tapebits_busted", 0.5},
	{"butterflywings", 0.75},
	{"butterflywings", 0.5},
	{"halloweencandy_7", 1}, --Not Arby. R.B. Raisin Boy.
	{"halloweencandy_7", 0.5},
	{"feather_canary", 0.25}
})

local function OnUnwrapped(inst, pos, doer)
	--achievement stuff
	if doer.achievement_tapesfound then
        doer.achievement_tapesfound = doer.achievement_tapesfound + math.random(1, 4)

        if CLIENT_MOD_RPC["ModdedSkins"] and doer.achievement_tapesfound >= TUNING.TVACHIEVEMENTS.TAPESFOUND then
            SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), doer.userid, "ms_tvheadguy_triumphant")
        end
    end

	inst.components.lootdropper:DropLoot()
	local wrap = SpawnPrefab("wetpouch_unwrap").Transform:SetPosition(pos:Get())
	--wrap.AnimState:SetMultColour(.1, 1, .1, 1)
	if doer ~= nil and doer.SoundEmitter ~= nil then
		doer.SoundEmitter:PlaySound("dontstarve/common/together/packaged")
	end
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
	
    inst.entity:AddTransform()
	inst.entity:AddMiniMapEntity()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst:AddTag("unwrappable")
	
    MakeInventoryPhysics(inst)
    
	inst.MiniMapEntity:SetIcon("messagebottletreasure_marker.png")
	inst.MiniMapEntity:SetPriority(6)

    inst.AnimState:SetBank("tapecache")
    inst.AnimState:SetBuild("tapecache")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")
	
	inst.entity:SetPristine()
	
	 if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tapecache"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tapecache.xml"
	inst.components.inventoryitem:SetSinks(true)

	inst:AddComponent("treasuremarked")

	if inst.components.lootdropper == nil then
		inst:AddComponent("lootdropper")
		local rand = math.random(6)
		inst.components.lootdropper:SetChanceLootTable('tapecacheloot'..rand)
	end

	inst:AddComponent("unwrappable")
    --inst.components.unwrappable:SetOnWrappedFn(OnWrapped)
    inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)

--STRINGS.NAMES.tapecache = "Tape Cache"

	inst:AddComponent("inspectable")

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/tapecache", fn, assets, prefabs)