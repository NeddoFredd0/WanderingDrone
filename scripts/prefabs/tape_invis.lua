--require("prefabs/tapebuffs")

local assets=
{
    Asset("ANIM", "anim/tape_invis.zip"),

    Asset("ATLAS", "images/inventoryimages/tape_invis.xml"),
    Asset("IMAGE", "images/inventoryimages/tape_invis.tex"),
}

local assets2=
{
    Asset("ANIM", "anim/tape_invis_upgraded.zip"),

    Asset("ATLAS", "images/inventoryimages/tape_invis_upgraded.xml"),
    Asset("IMAGE", "images/inventoryimages/tape_invis_upgraded.tex"),
}

local prefabs =
{
}

local prefabs2 =
{
}

SetSharedLootTable('tapeinvisloot',
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

    inst.AnimState:SetBank("tape_invis")
    inst.AnimState:SetBuild("tape_invis")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape_invis"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape_invis.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

--STRINGS.NAMES.tape_invis = "Disappearing Act"

    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapeinvisloot')
	inst:AddComponent("inspectable")
	inst:AddComponent("tapeconsume")
    inst.components.tapeconsume.itchvalue = TUNING.TAPE_INVIS.ITCHVALUE
    inst.components.tapeconsume.itchrestore = TUNING.TAPE_INVIS.ITCHRESTORE
    inst.components.tapeconsume.tickrate = TUNING.TAPE_INVIS.ITCHTICKRATE

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TAPE_INVIS.USES)
    inst.components.finiteuses:SetUses(TUNING.TAPE_INVIS.USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove) --inst.components.tapeconsume:TapeFinished(inst)

	MakeHauntableLaunch(inst)

    return inst
end

local function tape_spookyfx_onground(inst)
    inst.fx = SpawnPrefab("tophat_shadow_fx")
    inst.fx.entity:SetParent(inst.entity)
end

local function fn2()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tape_invis_upgraded")
    inst.AnimState:SetBuild("tape_invis_upgraded")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape_invis_upgraded"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape_invis_upgraded.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

--STRINGS.NAMES.tape_invis = "Upgraded Disappearing Act"

    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapeinvisloot')
	inst:AddComponent("inspectable")
	inst:AddComponent("tapeconsume")
    inst.components.tapeconsume.itchvalue = TUNING.TAPE_INVIS_UPGRADED.ITCHVALUE
    inst.components.tapeconsume.itchrestore = TUNING.TAPE_INVIS_UPGRADED.ITCHRESTORE
    inst.components.tapeconsume.tickrate = TUNING.TAPE_INVIS_UPGRADED.ITCHTICKRATE

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TAPE_INVIS_UPGRADED.USES)
    inst.components.finiteuses:SetUses(TUNING.TAPE_INVIS_UPGRADED.USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove) --inst.components.tapeconsume:TapeFinished(inst)

    local owner = inst.components.inventoryitem.owner or nil
	if owner == nil and not inst:IsInLimbo() then
		inst:DoTaskInTime(0, function() tape_spookyfx_onground(inst) end)
	end

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/tape_invis", fn, assets, prefabs),
    Prefab("common/inventory/tape_invis_upgraded", fn2, assets2, prefabs2)