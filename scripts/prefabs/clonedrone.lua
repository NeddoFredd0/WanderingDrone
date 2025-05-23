local assets =
{
	Asset("ANIM", "anim/player_basic.zip"),
	Asset("ANIM", "anim/player_idles_shiver.zip"),
	Asset("ANIM", "anim/player_actions.zip"),
	Asset("ANIM", "anim/player_actions_axe.zip"),
	Asset("ANIM", "anim/player_actions_pickaxe.zip"),
	Asset("ANIM", "anim/player_actions_shovel.zip"),
	Asset("ANIM", "anim/player_actions_blowdart.zip"),
	Asset("ANIM", "anim/player_actions_eat.zip"),
	Asset("ANIM", "anim/player_actions_item.zip"),
	Asset("ANIM", "anim/player_actions_uniqueitem.zip"),
	Asset("ANIM", "anim/player_actions_bugnet.zip"),
	Asset("ANIM", "anim/player_actions_fishing.zip"),
	Asset("ANIM", "anim/player_actions_boomerang.zip"),
	Asset("ANIM", "anim/player_bush_hat.zip"),
	Asset("ANIM", "anim/player_attacks.zip"),
	Asset("ANIM", "anim/player_idles.zip"),
	Asset("ANIM", "anim/player_rebirth.zip"),
	Asset("ANIM", "anim/player_jump.zip"),
	Asset("ANIM", "anim/player_amulet_resurrect.zip"),
	Asset("ANIM", "anim/player_teleport.zip"),
	Asset("ANIM", "anim/wilson_fx.zip"),
	Asset("ANIM", "anim/player_one_man_band.zip"),
	Asset("ANIM", "anim/shadow_hands.zip"),

	Asset("SOUND", "sound/sfx.fsb"),
	Asset("SOUND", "sound/common.fsb"),

    Asset("ANIM", "anim/swap_nightmaresword.zip"),

    Asset("ANIM", "anim/tvheadguy.zip"),
    Asset("ANIM", "anim/ms_tvheadguy_pirate.zip" ),
    Asset("ANIM", "anim/ms_tvheadguy_rose.zip" ),
    Asset("ANIM", "anim/ms_tvheadguy_triumphant.zip" ),
}

local function OnAttacked(inst, data)
    local attacker = data.attacker
    inst.components.combat:SetTarget(attacker)
    --inst.components.combat:ShareTarget(attacker, 30, function(dude) return dude:HasTag("summonedbyplayer") end, 15)
end

local function OnKeepTarget(inst, target)
    return inst.components.combat:CanTarget(target)
end

local function Explode(inst)
    --todo: spawn fx and do damage aoe here
    local x, y, z = inst.Transform:GetWorldPosition()

    --local shadowshields = {"shadow_shield1", "shadow_shield2", "shadow_shield3"}

    SpawnPrefab("fx_clonedroneexplode").Transform:SetPosition(x, y, z)
    --local shield = SpawnPrefab(shadowshields[math.random(1, #shadowshields)])
    --shield.Transform:SetPosition(x, y, z)
    --if shield.AnimState ~= nil then
    --    shield.AnimState:SetScale(1.2, 1.2, 1.2)
    --end
    SpawnPrefab("shadow_glob_fx").Transform:SetPosition(x, y, z)

    local ents = TheSim:FindEntities(x, y, z, TUNING.CLONEDRONE.EXPLODE_RADIUS)
    for k, v in pairs(ents) do
        if v:IsValid()
        and v.components.combat ~= nil
        and not v:HasTag("player")
        and not v:HasTag("noauradamage") then
            v.components.combat:GetAttacked(inst, TUNING.CLONEDRONE.EXPLODE_DAMAGE, nil, nil, {planar = TUNING.CLONEDRONE.EXPLODE_PLANARDMG})
        end
    end
    inst:Remove()
end

local function OnDeath(inst)
    inst:ListenForEvent("animover", function() Explode(inst) end)
end

local function UpdateSkin(inst, data)
    if data ~= nil and data.skin ~= nil then
        if data.skin == "tvheadguy_none" then
            inst.AnimState:SetBuild("tvheadguy")
        else
            inst.AnimState:SetBuild(data.skin)
        end
    else
        inst.AnimState:SetBuild("tvheadguy")
    end
end

local function onbecomeclone(inst)
    inst:DoTaskInTime(0, function()
        local x, y, z = inst.Transform:GetWorldPosition()
        SpawnPrefab("shadow_puff_large_front").Transform:SetPosition(x, y, z)
        SpawnPrefab("shadow_puff_large_back").Transform:SetPosition(x, y, z)
    end)
    if inst.AnimState ~= nil then
        inst.AnimState:SetMultColour(0.33, 0.33, 0.33, 0.75)
    end
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddPhysics()
	inst.Transform:SetFourFaced(inst)

    --MakeCharacterPhysics(inst, 75, .5)
    MakeTinyGhostPhysics(inst, 1, .5) --doesn't collide with characters

	inst.AnimState:SetBank("wilson")
	inst.AnimState:SetBuild("tvheadguy")
	inst.AnimState:PlayAnimation("idle")

	inst.AnimState:OverrideSymbol("swap_object", "swap_nightmaresword", "swap_nightmaresword")
    inst.AnimState:Show("ARM_carry")
    inst.AnimState:Hide("ARM_normal")
    inst.AnimState:Show("HAIR")

	inst:AddTag("notraptrigger")
	inst:AddTag("scarytoprey")
    inst:AddTag("NOBLOCK")

    if not TheWorld.ismastersim then
      return inst
    end

    inst.entity:SetPristine()

	inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 4
    inst.components.locomotor.runspeed = 6

    MakeMediumFreezableCharacter(inst, "body") --"face"
	inst.components.freezable.wearofftime = 1.5

	inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.CLONEDRONE.MAXHEALTH)
	inst.components.health.canheal = false

    --inst:AddComponent("inspectable")
	inst:AddComponent("knownlocations")

    inst:AddComponent("follower")

	local brain = require "brains/clonedronebrain"
	inst:SetBrain(brain)

	inst:SetStateGraph("SGclonedrone")

    inst:AddComponent("combat")
	inst.components.combat.hiteffectsymbol = "body"
    inst.components.combat:SetDefaultDamage(TUNING.CLONEDRONE.DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.CLONEDRONE.ATKPERIOD)
    inst.components.combat:SetKeepTargetFunction(OnKeepTarget)
	--inst.components.combat:SetRetargetFunction(1, NormalRetarget)
	local old_CanTarget = inst.components.combat.CanTarget
	function inst.components.combat:CanTarget(guy)
		if guy.components.follower and guy.components.follower.leader and guy.components.follower.leader:HasTag("player") then
			return false
		else
			return old_CanTarget(self, guy) -- call original function
		end
	end

    local planardamage = inst:AddComponent("planardamage")
    planardamage:SetBaseDamage(TUNING.CLONEDRONE.PLANARDMG)

	--MakeMediumBurnableCharacter(inst, "body")
    --MakeMediumFreezableCharacter(inst, "body")
    --inst.components.burnable.flammability = TUNING.SPIDER_FLAMMABILITY
	--inst:RemoveComponent("propagator")

    if inst.components.timer == nil then
        inst:AddComponent("timer")
    end
    inst.components.timer:StartTimer("selfdestruct", TUNING.CLONEDRONE.DURATION)
    inst:ListenForEvent("timerdone", Explode)

    inst:ListenForEvent("attacked", OnAttacked)
	--inst:ListenForEvent("newcombattarget", OnNewTarget)
	inst:ListenForEvent("death", OnDeath)

    inst:ListenForEvent("clonedrone_updateskin", UpdateSkin)

    onbecomeclone(inst)
	return inst
end

return Prefab("common/clonedrone", fn, assets)