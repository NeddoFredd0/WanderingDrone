local assets=
{
    Asset("ANIM", "anim/tapebits_2.zip"),

    Asset("ATLAS", "images/inventoryimages/tapebits_2.xml"),
    Asset("IMAGE", "images/inventoryimages/tapebits_2.tex"),
}

local prefabs =
{
}

SetSharedLootTable('tapebits_2loot',
{
	{"tapebits_busted", 0.5},
	{"tapebits_busted", 0.25},
	{"tapebits_busted", 0.15},
})

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tapebits_2")
    inst.AnimState:SetBuild("tapebits_2")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	inst:AddTag("jacketpocketfit")
	inst:AddTag("bait")
	inst:AddTag("molebait")

	inst.entity:SetPristine()

	 if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tapebits_2"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tapebits_2.xml"

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

	--inst.components.inventoryitem.onputininventoryfn = function(inst, player)
	--	local owner = inst.components.inventoryitem:GetGrandOwner()
	--	if owner.components.inventory and owner.prefab ~= "tvheadguy" then
	--		inst:DoTaskInTime(0, function()
	--		owner.components.inventory:DropItem(inst)
	--		owner.components.talker:Say(STRINGS.CHARACTER_TAPETHIEVERY)
	--		end)
	--	end
	--end

--STRINGS.NAMES.TAPEBITS_2 = "Pristine Casette Shell"

	inst:AddComponent("inspectable")

	inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tapebits_2loot')

	inst:AddComponent("tapebits_smash")

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/tapebits_2", fn, assets, prefabs)