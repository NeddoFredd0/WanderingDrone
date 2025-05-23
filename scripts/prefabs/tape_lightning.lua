--require("prefabs/tapebuffs")

local assets=
{
    Asset("ANIM", "anim/tape_lightning.zip"),

    Asset("ATLAS", "images/inventoryimages/tape_lightning.xml"),
    Asset("IMAGE", "images/inventoryimages/tape_lightning.tex"),
}

local assets2=
{
    Asset("ANIM", "anim/tape_invis_teehee.zip"), --AUTOCOMPILER IS FUCKING STUPID!

    Asset("ATLAS", "images/inventoryimages/tape_lightning_upgraded.xml"),
    Asset("IMAGE", "images/inventoryimages/tape_lightning_upgraded.tex"),
}

local prefabs =
{
}

local prefabs2 =
{
}

SetSharedLootTable('tapelightningloot',
{
	{"tapebits_busted", 0.50},
	{"tapebits_busted", 0.25},
	{"trinket_6", 0.10}, --frazzled wires
})

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tape_lightning")
    inst.AnimState:SetBuild("tape_lightning")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape_lightning"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape_lightning.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

--STRINGS.NAMES.tape_lightning = "Stormchasers: A Documentary"

    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapelightningloot')
	inst:AddComponent("inspectable")
	inst:AddComponent("tapeconsume")
    inst.components.tapeconsume.itchvalue = TUNING.TAPE_LIGHTNING.ITCHVALUE
    inst.components.tapeconsume.itchrestore = TUNING.TAPE_LIGHTNING.ITCHRESTORE
    inst.components.tapeconsume.tickrate = TUNING.TAPE_LIGHTNING.ITCHTICKRATE

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TAPE_LIGHTNING.USES)
    inst.components.finiteuses:SetUses(TUNING.TAPE_LIGHTNING.USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove) --inst.components.tapeconsume:TapeFinished(inst)

	MakeHauntableLaunch(inst)

    return inst
end

local function tape_spookyfx_onground(inst)
    inst.fx = SpawnPrefab("tape_lunar_fx")
    inst.fx.entity:SetParent(inst.entity)
end

local function fn2()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    --AUTOCOMPILER IS STUPID AND DUMB
    inst.AnimState:SetBank("tape_invis_teehee")
    inst.AnimState:SetBuild("tape_invis_teehee")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape_lightning_upgraded"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape_lightning_upgraded.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

--STRINGS.NAMES.tape_lightning = "Stormchasers: A Documentary"

    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapelightningloot')
	inst:AddComponent("inspectable")
	inst:AddComponent("tapeconsume")
    inst.components.tapeconsume.itchvalue = TUNING.TAPE_LIGHTNING_UPGRADED.ITCHVALUE
    inst.components.tapeconsume.itchrestore = TUNING.TAPE_LIGHTNING_UPGRADED.ITCHRESTORE
    inst.components.tapeconsume.tickrate = TUNING.TAPE_LIGHTNING_UPGRADED.ITCHTICKRATE

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TAPE_LIGHTNING_UPGRADED.USES)
    inst.components.finiteuses:SetUses(TUNING.TAPE_LIGHTNING_UPGRADED.USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove) --inst.components.tapeconsume:TapeFinished(inst)

    local owner = inst.components.inventoryitem.owner or nil
	if owner == nil and not inst:IsInLimbo() then
		inst:DoTaskInTime(0, function() tape_spookyfx_onground(inst) end)
	end

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/tape_lightning", fn, assets, prefabs),
    Prefab("common/inventory/tape_lightning_upgraded", fn2, assets2, prefabs2)