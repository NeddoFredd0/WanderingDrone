local assets=
{
    Asset("ANIM", "anim/fx_slowmostatus.zip"),

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

    inst.AnimState:SetBank("fx_slowmostatus")
    inst.AnimState:SetBuild("fx_slowmostatus")
    inst.AnimState:PlayAnimation("spawn") --anim:PlayAnimation("idle_90s")
    inst.AnimState:PushAnimation("idle", true)

	inst.entity:SetPristine()

    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    inst.AnimState:SetMultColour(1, 1, 1, 0.5)

	if not TheWorld.ismastersim then
        return inst
    end

	inst.AnimState:SetScale(2, 2)

    inst.persists = false
	--inst:DoTaskInTime(0.6, inst.Remove)
    inst:DoTaskInTime(TUNING.TAPE_SLOWMO.EFFECTDURATION, function() ErodeAway(inst, 0.6) end)

    return inst
end

return Prefab("common/inventory/fx_slowmostatus", fn, assets)

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