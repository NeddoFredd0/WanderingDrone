--require("prefabs/tapebuffs")

local assets=
{
    Asset("ANIM", "anim/tape_broadcast.zip"),

    Asset("ATLAS", "images/inventoryimages/tape_broadcast.xml"),
    Asset("IMAGE", "images/inventoryimages/tape_broadcast.tex"),
}

local prefabs =
{
}

SetSharedLootTable('tapebroadcastloot',
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

    inst.AnimState:SetBank("tape_broadcast")
    inst.AnimState:SetBuild("tape_broadcast")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape_broadcast"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape_broadcast.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

--STRINGS.NAMES.tape_broadcast = "Disappearing Act"

    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapebroadcastloot')
	inst:AddComponent("inspectable")
	inst:AddComponent("tapeconsume")
    inst.components.tapeconsume.itchvalue = TUNING.TAPE_BROADCAST.ITCHVALUE
    inst.components.tapeconsume.itchrestore = TUNING.TAPE_BROADCAST.ITCHRESTORE
    inst.components.tapeconsume.tickrate = TUNING.TAPE_BROADCAST.ITCHTICKRATE

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TAPE_BROADCAST.USES)
    inst.components.finiteuses:SetUses(TUNING.TAPE_BROADCAST.USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove) --inst.components.tapeconsume:TapeFinished(inst)

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/tape_broadcast", fn, assets, prefabs)