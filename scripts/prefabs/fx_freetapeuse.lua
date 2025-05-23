local assets=
{
    Asset("ANIM", "anim/fx_freetapeuse.zip"),

    --Asset("ATLAS", "images/inventoryimages/tape1.xml"),
    --Asset("IMAGE", "images/inventoryimages/tape1.tex"),
}

local prefabs =
{
}

local BLOOM = 0.25

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    --inst.entity:AddLight()
    inst.entity:AddTag("FX")

    --bloom has weird results with ErodeAway
    --inst.AnimState:SetSymbolBloom("star")
    --inst.AnimState:SetSymbolLightOverride("star", BLOOM)
--
    --inst.AnimState:SetSymbolBloom("tape")
    --inst.AnimState:SetSymbolLightOverride("tape", BLOOM)
--
    --inst.AnimState:SetSymbolBloom("themask")
    --inst.AnimState:SetSymbolLightOverride("themask", BLOOM)

    --MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("fx_freetapeuse")
    inst.AnimState:SetBuild("fx_freetapeuse")
    inst.AnimState:PlayAnimation("idle")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

	inst.AnimState:SetScale(0.8, 0.8)

	inst.persists = false
	--inst:DoTaskInTime(0.6, inst.Remove)
    inst:DoTaskInTime(1.8, ErodeAway)
	--inst:ListenForEvent("animover", inst.Remove)

    --inst:AddComponent("inventoryitem")
    --inst.components.inventoryitem.imagename = "tape1"
    --inst.components.inventoryitem.atlasname = "images/inventoryimages/tape1.xml"


    return inst
end

return Prefab("common/inventory/fx_freetapeuse", fn, assets)

--local function MakeTvHeadGuyFx(name)
--
--    local function makefxsimple(custom_init)
--        local inst = CreateEntity()
--
--        inst.entity:AddTransform()
--        inst.entity:AddAnimState()
--        inst.entity:AddNetwork()
--        inst.entity:AddSoundEmitter()
--        inst.entity:AddTag("FX")
--
--        inst.AnimState:SetBank("fx_" .. name)
--        inst.AnimState:SetBuild("fx_" .. name)
--
--        if custom_init ~= nil then
--            custom_init(inst)
--        end
--
--        inst.entity:SetPristine()
--    end
--
--    local function default()
--        return makefxsimple()
--    end
--
--    local function tapefind_custom_init(inst)
--        inst.AnimState:PlayAnimation("idle")
--    end
--
--    local function tapefind()
--        local inst = makefxsimple(tapefind_custom_init)
--
--        if inst ~= nil then
--
--            if not TheWorld.ismastersim then
--                return inst
--            end
--
--            inst.AnimState:SetScale(1.5, 1.5)
--
--            inst.SoundEmitter:PlaySound("sound/dontstarve_shipwreckedSFX/DSS_loot_reveal") --soundemitter works on fx spawn, the issue is the shipwrecked sound itself
--            --ShakeAllCameras(CAMERASHAKE.FULL, .25, .03, .25, inst, 6)
--
--            inst.persists = false
--            inst:DoTaskInTime(0.6, inst.Remove)
--
--        end
--
--        return inst
--    end
--
--    local function sysrestoregear_custom_init(inst)
--        inst.AnimState:PlayAnimation("idle")
--    end
--
--    local function sysrestoregear()
--        local inst = makefxsimple(sysrestoregear_custom_init)
--
--        if inst ~= nil then
--
--            if not TheWorld.ismastersim then
--                return inst
--            end
--
--            inst.AnimState:SetScale(1.5, 1.5)
--
--            inst.SoundEmitter:PlaySound("WX_rework/module/remove") --todo: make custom sound for the sysrestore tape
--
--            inst.persists = false
--            inst:DoTaskInTime(0.6, inst.Remove)
--
--        end
--
--        return inst
--    end
--
--    local function tapebreak_custom_init(inst)
--        inst.AnimState:PlayAnimation("used_90s")
--    end
--
--    local function tapebreak()
--        local inst = makefxsimple(tapebreak_custom_init)
--
--        if inst ~= nil then
--
--            if not TheWorld.ismastersim then
--                return inst
--            end
--
--            inst.SoundEmitter:PlaySound("WX_rework/module/remove")
--            inst.persists = false
--            inst:DoTaskInTime(0.6, inst.Remove)
--
--        end
--
--        return inst
--    end
--
--    --...
--
--    local fn = nil
--    local assets = { Asset("ANIM", "anim/fx_" .. name .. ".zip") }
--    --local prefabs = nil
--
--    if name == "tapefind" then
--        fn = tapefind
--    elseif name == "tapebreak" then
--        fn = tapebreak
--    elseif name == "sysrestoregear" then
--        fn = sysrestoregear
--    end
--    --elseif name == "example" then
--    --  fn = example
--    --  declare prefabs
--    --end
--
--    return Prefab("common/inventory/fx_" .. name, fn or default, assets)
--end
--
--return MakeTvHeadGuyFx("tapefind"),
--    MakeTvHeadGuyFx("tapebreak"),
--    MakeTvHeadGuyFx("sysrestoregear")
--