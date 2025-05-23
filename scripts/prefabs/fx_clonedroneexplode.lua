local assets =
{
    Asset("ANIM", "anim/explode.zip")
}

local function PlayExplodeAnim(proxy)
    local inst = CreateEntity()

    inst:AddTag("FX")
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    inst.Transform:SetFromProxy(proxy.GUID)

    inst.AnimState:SetBank("explode")
    inst.AnimState:SetBuild("explode")

    inst.AnimState:PlayAnimation("small")

    --inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    --inst.AnimState:SetLightOverride(1)

    inst.AnimState:SetMultColour(0, 0, 0, 0.5)
    inst.Transform:SetScale(1.2, 1.2, 1.2)

    --inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") --do I want to play both?
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/clonedroneshatter")

    inst:ListenForEvent("animover", inst.Remove)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    --Dedicated server does not need to spawn the local fx
    if not TheNet:IsDedicated() then
        --Delay one frame so that we are positioned properly before starting the effect
        --or in case we are about to be removed
        inst:DoTaskInTime(0, PlayExplodeAnim)
    end

    inst.Transform:SetFourFaced()

    inst:AddTag("FX")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    inst:DoTaskInTime(1, inst.Remove)

    return inst
end

return Prefab("fx_clonedroneexplode", fn, assets)

