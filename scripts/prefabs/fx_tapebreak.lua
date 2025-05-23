local assets=
{ 
    Asset("ANIM", "anim/fx_tapebreak.zip"),

    --Asset("ATLAS", "images/inventoryimages/tape1.xml"),
    --Asset("IMAGE", "images/inventoryimages/tape1.tex"),
}

local prefabs = 
{
}

local function fn()
	local inst = CreateEntity()
	
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    inst.entity:AddTag("FX")
	
    --MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("fx_tapebreak") --yoinky sploinky'd the brokentool animations because spriter SUCKS
    inst.AnimState:SetBuild("fx_tapebreak")
    inst.AnimState:PlayAnimation("used_90s")
	
	inst.entity:SetPristine()
	
	 if not TheWorld.ismastersim then
        return inst
    end

	--inst.AnimState:SetScale(1.5, 1.5)

    --inst.SoundEmitter:PlaySound("WX_rework/module/remove")
    inst.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapedisassemble")

	inst.persists = false
	inst:DoTaskInTime(0.6, inst.Remove)
	--inst:ListenForEvent("animover", inst.Remove)

    --inst:AddComponent("inventoryitem")
    --inst.components.inventoryitem.imagename = "tape1"
    --inst.components.inventoryitem.atlasname = "images/inventoryimages/tape1.xml"


    return inst
end

return  Prefab("common/inventory/fx_tapebreak", fn, assets, prefabs)