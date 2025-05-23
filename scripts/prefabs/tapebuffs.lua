--require("components/tapeconsume")
require "prefabutil"
require "math"
--FACE OVERRIDES
---------------------------------------------------------------------------------------------

local function OverrideCorrectFace(inst, target)
    if target.components.skinner.skin_name ~= "tvheadguy_none" and target.components.skinner.skin_name ~= nil then
        target.AnimState:OverrideSymbol("face", "face_tapeplay_"..target.components.skinner.skin_name, "face")
    else
        local sus = inst.entity:GetPrefabName()
        --print("inst: "..sus)
        --local inst2 = inst[2]
        local buffid = string.gsub(sus, "buff_tape_", "")
        if buffid ~= "buff_tape_" then
            target.AnimState:OverrideSymbol("face", "face_"..buffid, "face")
        end
        --print("DEBUG: FACE NAME: face_"..buffid)
    end
end

--LIGHTNING TAPE
---------------------------------------------------------------------------------------------
local function GetNearbyLightningables(inst, target)
    local ents2 = {}
    local x, y, z = target.Transform:GetWorldPosition()
    local ents2pre = TheSim:FindEntities(x, y, z, TUNING.TAPE_LIGHTNING.RANGE)
    for k, v in pairs(ents2pre) do
        if v ~= nil
                and v:IsValid()
                and not v:HasTag("player")
                and not v:HasTag("noauradamage") --noauradamage is better at blocking immobile objects and friendlies than notraptrigger
                and not v:HasTag("bird")
                and not v:HasTag("prey")
                and not v:HasTag("companion")
                and not v:HasTag("butterfly")
                --and not v:HasTag("_recentlystruck")
                --and v._slowablefxtask == nil
                and v.components.locomotor ~= nil
                and v.components.locomotor:GetExternalSpeedMultiplier() == 1
                --and v.replica.combat:GetTarget() == target
                and (v.components.health ~= nil and not v.components.health:IsDead()) then
                    if v:HasTag("shadowcreature") and target.components.sanity:GetPercent() > TUNING.SANITY_BECOME_INSANE_THRESH then
                        return
                    end
                table.insert(ents2, v)
        end
    end
    --dumptable(ents2)
    return ents2
    --print("ENTS 1: "..ents[1][1].." + "..ents[1][2])
end

local function lightning_periodictask(inst, target)
    local ents2 = GetNearbyLightningables(inst, target)
    local maxzaps = TUNING.TAPE_LIGHTNING.MAXZAPS
    if target:HasTag("tvheadguy_entertainment_lightning") then
        maxzaps = TUNING.TVSKILLTREE.LIGHTNING_MAXZAPS
    end
    for counter = maxzaps, 1, -1 do
        target:DoTaskInTime(0.5, function()
            if ents2 ~= nil then
                local victim = ents2[counter]
                if victim ~= nil then
                    local debuffkey = inst.prefab
                    local x, y, z = victim.Transform:GetWorldPosition()
                    if x ~= nil then
                        local zap = SpawnPrefab("lightning")
                        zap.Transform:SetPosition(x, y, z)
                        local pft = SpawnPrefab("round_puff_fx_sm")
                        pft.Transform:SetPosition(x, y, z)
                    end

                    --Skilltree
                    if target:HasTag("tvheadguy_entertainment_lightning") then --IDEA: "moonstorm_spark_shock_fx" spawns pre-emptively before lightning
                        if victim:HasTag("epic") then
                            victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING.DAMAGE + TUNING.TAPE_LIGHTNING.BOSS_DMG_BONUS, nil, nil, {planar = TUNING.TVSKILLTREE.LIGHTNING_PLANAR_DMG_BONUS})
                            if victim.AnimState ~= nil then
                                --SpawnPrefab("hitsparks_fx"):Setup(target, victim) --TODO: figure out why these nil checks don't work?????
                            else
                                print("DEBUG: No animstate on target!")
                            end
                        else
                            victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING.DAMAGE, nil, nil, {planar = TUNING.TVSKILLTREE.LIGHTNING_PLANAR_DMG_BONUS})
                            if victim.AnimState ~= nil then
                                --SpawnPrefab("hitsparks_fx"):Setup(target, victim)
                            else
                                print("DEBUG: No animstate on target!")
                            end
                        end
                    else
                        if victim:HasTag("epic") then
                            victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING.DAMAGE + TUNING.TAPE_LIGHTNING.BOSS_DMG_BONUS)
                            if victim.AnimState ~= nil then
                                --SpawnPrefab("hitsparks_fx"):Setup(target, victim) --TODO: figure out why these nil checks don't work?????
                            else
                                print("DEBUG: No animstate on target!")
                            end
                        else
                            victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING.DAMAGE)
                            if victim.AnimState ~= nil then
                                --SpawnPrefab("hitsparks_fx"):Setup(target, victim)
                            else
                                print("DEBUG: No animstate on target!")
                            end
                        end
                    end

                    --victim:AddTag("_recentlystruck")
                    --victim:DoTaskInTime(1, function() victim:RemoveTag("_recentlystruck") end)

                    if victim._slowablefxtask == nil then
                        victim.fx = SpawnPrefab("fx_slowmostatus")
                        victim.fx.entity:SetParent(victim.entity)
                        --v.fx.entity:AddFollower()
                        --v.fx.Follower:FollowSymbol(v.GUID, "", 0, 0, 0)
                    end
                    victim:ListenForEvent("death", function() if victim.fx ~= nil then ErodeAway(victim.fx) end end)
                    if victim._slowmotapespeedtask ~= nil then
                        victim._slowmotapespeedtask:Cancel()
                    end
                    victim._slowmotapespeedtask = victim:DoTaskInTime(TUNING.TAPE_LIGHTNING.EFFECTDURATION, function()
                        victim.components.locomotor:RemoveExternalSpeedMultiplier(victim, debuffkey)
                        victim._slowmotapespeedtask = nil
                    end)
                    victim._slowablefxtask = victim:DoTaskInTime(TUNING.TAPE_LIGHTNING.EFFECTDURATION, function()
                        victim._slowablefxtask = nil
                        --if v.fx ~= nil then
                        --    v.fx:Remove()
                        --end
                    end)
                    victim.components.locomotor:SetExternalSpeedMultiplier(victim, debuffkey, TUNING.TAPE_LIGHTNING.RUNSPEEDMOD)
                end
            end
        end)
    end
end

local function lightningfx_periodictask(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    local zap = SpawnPrefab("moonstorm_spark_shock_fx")
    zap.Transform:SetPosition(x+math.random(-10,10), y, z+math.random(-10,10))
    --zap.AnimState:SetScale((math.random(50, 150)/100), (math.random(50, 150)/100), (math.random(50, 150)/100)) --calling animstate here crashes the game fsr
end

local function lightningtape_attach(inst, target)
    OverrideCorrectFace(inst, target)

    target:AddTag("lightningloop")
    lightning_periodictask(inst, target)
    if TheWorld.state.israining then
        if target:HasTag("lightningloop") then
            target.lightningloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING.INTERVAL_RAIN,
                function() lightning_periodictask(inst, target) end)
        end
        target:DoTaskInTime(1, function() target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_LIGHTNING_ISRAINING) end)
        --print("DEBUG: IT IS RAINING MY DUDES")
    else
        if target:HasTag("lightningloop") then
            target.lightningloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING.INTERVAL,
                function() lightning_periodictask(inst, target) end)
        end
        --print("DEBUG: IT ***NOT*** IS RAINING MY DUDES")
    end

    target:AddTag("lightningfxloop")
    if target:HasTag("lightningfxloop") then
        target.lightningfxloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING.FXINTERVAL,
        function() lightningfx_periodictask(inst, target) end)
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_lightning_LP", "lightningtape")
end

local function lightningtape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.hastapeinserted = false
    target:RemoveTag("lightningloop")
    target.lightningloop:Cancel()
    target:RemoveTag("lightningfxloop")
    target.lightningfxloop:Cancel()
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("lightningtape")
end

--PIG TAPE
---------------------------------------------------------------------------------------------

--this item is supposed to be a onemanband upgrade, so it can tend to plants (even though it's harder to use for that purpose)
local function TendToPlantsAOE(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    for _, v in pairs(TheSim:FindEntities(x, y, z, TUNING.WORMWOOD_BLOOM_FARM_PLANT_INTERACT_RANGE, {"tendable_farmplant"})) do
		if v.components.farmplanttendable ~= nil then
			v.components.farmplanttendable:TendTo(inst)
		end
	end
end

local function MakeMermsAngry(target)
    local x, y, z = target.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, TUNING.TAPE_PIG.RANGE+10, { "merm" }) --{"cant-tags"}
    for k, merm in pairs(ents) do
        if merm:HasTag("merm") then
            if merm.components.combat ~= nil then
                merm.components.combat:SetTarget(target)
            end
            if merm:HasTag("playermerm") then
                merm.components.sanity:DoDelta(-TUNING.SANITY_TINY)
            end
        end
    end

    local entypenties = TheSim:FindEntities(x, y, z, TUNING.TAPE_PIG.RANGE+10, { "structure" }) --{"cant-tags"}
    for k, hut in pairs(entypenties) do
        if hut:HasTag("structure") and hut.components.childspawner then
            if hut.components.childspawner.childname == "merm" then
                hut.components.childspawner:ReleaseAllChildren()
            end
        end
    end
end

local function tvpig_cd(inst)
    inst._tvpigcd = nil
end

local function SayPropagandaGibberish(pig)
    if pig.components.talker ~= nil and math.random() > 0.5 then
        local stringtable = {STRINGS.PROPAGANDA.GIBBERISH1, STRINGS.PROPAGANDA.GIBBERISH2, STRINGS.PROPAGANDA.GIBBERISH3, STRINGS.PROPAGANDA.GIBBERISH4, STRINGS.PROPAGANDA.GIBBERISH5, }
        local rand = math.random(1, #stringtable)
        for k, v in pairs(stringtable) do
            if k == rand then
                pig.components.talker:Say(v)
            end
        end
    end
end

local function band_update(target, inst)
    if target and target.components.leader then
        target.components.sanity:DoDelta(-2)
        target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_pig_recruit")
        local x,y,z = target.Transform:GetWorldPosition()

        TendToPlantsAOE(target)
        MakeMermsAngry(target)

        local rand = math.random(1, 3)
        if rand == 1 then
            local fx = SpawnPrefab("carnival_confetti_fx")
		    fx.Transform:SetPosition(x, y, z)
        else
            local theta0 = math.random() * 2 * PI
            local dtheta = 2 * PI / rand
            local thetavar = dtheta / 10
            local theta, radius
            for i = 1, rand do
                theta = GetRandomWithVariance(theta0 + dtheta * i, thetavar)
                radius = 1.6 + math.random() * .4
                local fx = SpawnPrefab("carnival_confetti_fx")
		        fx.Transform:SetPosition(x + math.cos(theta) * radius, 0, z - math.sin(theta) * radius)
            end
        end

        local ents = TheSim:FindEntities(x, y, z, TUNING.TAPE_PIG.RANGE, {"pig"}, {"werepig", "pigelite"})
        for k, v in pairs(ents) do
            if v.components.follower and not v.components.follower.leader and not target.components.leader:IsFollower(v) and not v:HasTag("pigelite")
                and target.components.leader.numfollowers < 20 then
                target.components.leader:AddFollower(v)
            end
            if target.components.leader:IsFollower(v) and v._tvpigcd == nil then
                v._tvpigcd = v:DoTaskInTime(TUNING.TAPE_PIG.PIGBUFF_DURATION, tvpig_cd)

                if v:HasTag("pig") and not v:HasTag("werepig") or not v:HasTag("pigelite") then --don't buff pigelites because they're already cracked

                    SayPropagandaGibberish(v)
                    v:AddTag("tv_propaganda")
                    if v:HasTag("tv_propaganda") then
                        v.tv_propagandatask = v:DoPeriodicTask(math.random(1, 6), function() SayPropagandaGibberish(v) end)
                    end

                    if v.components.workmultiplier == nil then
                        v:AddComponent("workmultiplier")
                    end
                    v.components.workmultiplier:AddMultiplier(ACTIONS.CHOP,
                        TUNING.TAPE_PIG.PIGBUFF_WORKEFFECTIVENESS_MODIFIER, inst)
                    --add mine and hammer efficiency in case pigs can ever do other worktypes
                    v.components.workmultiplier:AddMultiplier(ACTIONS.MINE,
                        TUNING.TAPE_PIG.PIGBUFF_WORKEFFECTIVENESS_MODIFIER, inst)
                    v.components.workmultiplier:AddMultiplier(ACTIONS.HAMMER,
                        TUNING.TAPE_PIG.PIGBUFF_WORKEFFECTIVENESS_MODIFIER, inst)

                    if v.components.health ~= nil then
                        v.components.health.externalabsorbmodifiers:SetModifier(inst,
                            TUNING.TAPE_PIG.PIGBUFF_PLAYERABSORPTION_MODIFIER)
                    end

                    if v.components.combat ~= nil then
                        v.components.combat.externaldamagemultipliers:SetModifier(inst,
                            TUNING.TAPE_PIG.PIGBUFF_ATTACK_MULTIPLIER)
                    end

                    if v.components.locomotor ~= nil then
                        v.components.locomotor:SetExternalSpeedMultiplier(inst, "tape_pigbuff",
                            TUNING.TAPE_PIG.PIGBUFF_SPEED_MULTIPLIER)
                    end

                    v:DoTaskInTime(TUNING.TAPE_PIG.PIGBUFF_DURATION, function()
                        v.tv_propagandatask:Cancel() -- stop that yammerin'

                        if v.components.workmultiplier ~= nil then
                            v.components.workmultiplier:RemoveMultiplier(ACTIONS.CHOP, inst)
                            v.components.workmultiplier:RemoveMultiplier(ACTIONS.MINE, inst)
                            v.components.workmultiplier:RemoveMultiplier(ACTIONS.HAMMER, inst)
                        end
                        if v.components.health ~= nil then
                            v.components.health.externalabsorbmodifiers:RemoveModifier(inst)
                        end
                        if v.components.combat ~= nil then
                            v.components.combat.externaldamagemultipliers:RemoveModifier(inst)
                        end
                        if v.components.locomotor ~= nil then
                            v.components.locomotor:RemoveExternalSpeedMultiplier(inst, "tape_pigbuff")
                        end
                    end)
                end
            end
        end

        for k,v in pairs(target.components.leader.followers) do
            if k:HasTag("pig") and k.components.follower then
                k.components.follower:AddLoyaltyTime(TUNING.TAPE_PIG.PIGBUFF_DURATION)
            end
        end
    end
end

local function tvpigelite_cd(inst)
    inst._tvpigelitecd = nil
end

local function generate_random_pig()
    local num = {1, 2, 3, 4}
    local randnum = {}

    for i = #num, 2, -1 do
        local j = math.random(i)
        num[i], num[j] = num[j], num[i]
    end

    for i = 1, 3 do
        table.insert(randnum, num[i])
    end

    return randnum
end

local function pigtape_attach(inst, target)
    OverrideCorrectFace(inst, target)
    band_update(target, inst) --recruit once immediately
    target:AddTag("tvpigloop")
    if target:HasTag("tvpigloop") then
        target.tvpigloop = target:DoPeriodicTask(TUNING.TAPE_PIG.INTERVAL, function() band_update(target, inst) end)
    end

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_pig") then
        if target._tvpigelitecd == nil then
            local pos = target:GetPosition()
            local randnum = generate_random_pig()
            for i = 1, TUNING.TVSKILLTREE.PIGTAPE_NUM_OF_PIGELITES do
                local elite = SpawnPrefab("tape_pig_pigelitefighter"..randnum[i])
                elite.Transform:SetPosition(pos.x + math.cos(22.5*i) * 4, 0, pos.z - math.sin(22.5*i) * 4)
                elite.components.follower:SetLeader(target)
                elite.components.follower:AddLoyaltyTime(TUNING.TVSKILLTREE.PIGTAPE_PIGELITE_CD)

                local theta = math.random() * PI2
                local offset = FindWalkableOffset(pos, theta, 2.5, 16, true, true, nil, false, true)
		    				or FindWalkableOffset(pos, theta, 2.5, 16, false, false, nil, false, true)
		    				or Vector3(0, 0, 0)
                pos.x, pos.y, pos.z = pos.x + offset.x, 0, pos.z + offset.z
                elite.sg:GoToState("spawnin", { dest = pos })
            end
            --after spawning elite pigs, start timer to prevent further pig spawns
            target._tvpigelitecd = target:DoTaskInTime(TUNING.TVSKILLTREE.PIGTAPE_PIGELITE_CD, tvpigelite_cd)
        else
            target:DoTaskInTime(1, function() target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_CANT_ELITEPIGS) end)
        end
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_pig_LP", "pigtape")
end

local function pigtape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target:RemoveTag("tvpigloop")
    target.tvpigloop:Cancel()

    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false

    --Skilltree
    local x, y, z = target.Transform:GetWorldPosition()
    local pigs = TheSim:FindEntities(x, y, z, 30, {"pigelite"})
    for k, pig in pairs(pigs) do
        pig._should_despawn = true
		pig.persists = false
    end

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("pigtape")
end

--ELECTRIC TAPE
---------------------------------------------------------------------------------------------

local function electape_cooldown(inst)
    inst._cdtask = nil
end

local function electape_payback(player, data, inst)
    if (data ~= nil and data.attacker ~= nil and not data.redirected) and inst._cdtask == nil then
        inst._cdtask = inst:DoTaskInTime(TUNING.TAPE_ELECTRIC.COOLDOWN, electape_cooldown)

        player.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_electric_payback")

        local pos = data.attacker:GetPosition()
        local attackers = {data.attacker}
        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, TUNING.TAPE_ELECTRIC.RADIUS)
        for k, v in pairs(ents) do
            table.insert(attackers, v)
        end
        --TheNet:SystemMessage(attackers, false)

        local fx = SpawnPrefab("electrichitsparks")
        fx.Transform:SetPosition(player.Transform:GetWorldPosition())
        fx.Transform:SetScale(1.5, 1.5, 1.5)
        ShakeAllCameras(CAMERASHAKE.FULL, .25, .03, .25, inst, 6)

        for k, attacker in pairs(attackers) do
            if attacker.components.combat ~= nil
                and (attacker.components.health ~= nil and not attacker.components.health:IsDead())
                and (attacker.components.inventory == nil or not attacker.components.inventory:IsInsulated())
                and not (attacker:HasTag("player"))
                and not (attacker:HasTag("companion"))
                and (data.weapon == nil or
                    (data.weapon.components.projectile == nil
                        and (data.weapon.components.weapon == nil or data.weapon.components.weapon.projectile == nil))
                ) then

                SpawnPrefab("electrichitsparks"):AlignToTarget(attacker, player, true)

                local damage_mult = 1
                if not (attacker:HasTag("electricdamageimmune") or (attacker.components.inventory ~= nil and attacker.components.inventory:IsInsulated())) then
                    damage_mult = TUNING.ELECTRIC_DAMAGE_MULT

                    local wetness_mult = (
                        attacker.components.moisture ~= nil and attacker.components.moisture:GetMoisturePercent())
                        or (attacker:GetIsWet() and 1)
                        or 0
                    damage_mult = damage_mult + wetness_mult
                end

                --Skilltree
                if player:HasTag("tvheadguy_entertainment_electric") then
                    attacker.components.combat:GetAttacked(player, damage_mult * TUNING.TAPE_ELECTRIC.DAMAGE, nil, nil, {planar = TUNING.TVSKILLTREE.ELECTRIC_PLANAR_DMG_BONUS})
                    if attacker.AnimState ~= nil then
                        SpawnPrefab("hitsparks_fx"):Setup(player, attacker)
                    else
                        print("DEBUG: No animstate on attacker!")
                    end
                else
                    attacker.components.combat:GetAttacked(player, damage_mult * TUNING.TAPE_ELECTRIC.DAMAGE)
                end
            end
        end
    end
end

local function electape_fxperiodictask(inst, target)
    target.fx = SpawnPrefab("lightning_rod_fx")
    target.fx.entity:AddFollower()
    target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, 200, 0) --0, 25 0
    target.fx.Transform:SetScale(1, 0.6, 1)
    target.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
end


local function electrictape_attach(inst, target)
    OverrideCorrectFace(inst, target)
    target:AddTag("tv_wimpyimmune")

    if inst._onblocked == nil then
        inst._onblocked = function (owner, data)
            electape_payback(target, data, inst)
        end
    end

    electape_fxperiodictask(inst, target)
    target:AddTag("electape_fxloop")
    if target:HasTag("electape_fxloop") then
        target.electape_fxloop = target:DoPeriodicTask(math.random(6, 8),
        function() electape_fxperiodictask(inst, target) end)
    end

    inst:ListenForEvent("blocked", inst._onblocked, target)
    inst:ListenForEvent("attacked", inst._onblocked, target)

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_electric") then
        target.components.combat.externaldamagetakenmultipliers:SetModifier(inst, TUNING.TVSKILLTREE.ELECTRIC_NEWRESISTANCE)
    else
        target.components.combat.externaldamagetakenmultipliers:SetModifier(inst, TUNING.TAPE_ELECTRIC.RESISTANCE)
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_electric_LP", "electrictape")

    --if target.components.inventory ~= nil then
    --    target.components.inventory.isexternallyinsulated:SetModifier(inst, true)
    --end
end

local function electrictape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    inst:RemoveEventCallback("blocked", inst._onblocked, target)
    inst:RemoveEventCallback("attacked", inst._onblocked, target)
    target.components.combat.externaldamagetakenmultipliers:RemoveModifier(inst)
    target:RemoveTag("tv_wimpyimmune")
    target:RemoveTag("electape_fxloop")
    target.electape_fxloop:Cancel()
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false
    --remove damage event callback

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("electrictape")
end

--SYSTEM RESTORE TAPE
---------------------------------------------------------------------------------------------

local function sysrestore_periodictask(inst, target)
    target.fx = SpawnPrefab("fx_sysrestoregear")
    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_sysrestore_repair")
    target.fx.entity:AddFollower()
    target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, 25, 0)
    --sounds will be played through fx prefab
    --target.SoundEmitter:PlaySound("dontstarve/common/diviningrod_ping")
    target:DoTaskInTime(0.5, function() --time restoration with middle of gear animation.
        target.components.health:DoDelta(TUNING.TAPE_SYSRESTORE.HEALTHVALUE)
        target.components.itchmeter:DoDelta(TUNING.TAPE_SYSRESTORE.ITCHVALUE)
        --Skilltree
        if target:HasTag("tvheadguy_entertainment_sysrestore") then
            target.components.sanity:DoDelta(TUNING.TVSKILLTREE.SYSRESTORE_BONUSSANITY)
            --local max = target.components.health:GetMaxWithPenalty()
            target.components.health:DeltaPenalty(-TUNING.TVSKILLTREE.SYSRESTORE_MAXHP)
            target.SoundEmitter:PlaySound("tvheadguy/skilltree/tapesysrestore_soothe") --we wanna play both sounds
        else
            target.components.sanity:DoDelta(TUNING.TAPE_SYSRESTORE.SANITYVALUE)
        end
    end)
end

local function sysrestoretape_attach(inst, target)
    OverrideCorrectFace(inst, target)
    target:AddTag("healloop")
    --heal once immediately
    sysrestore_periodictask(inst, target)
    if target:HasTag("healloop") then
        target.healloop = target:DoPeriodicTask(TUNING.TAPE_SYSRESTORE.INTERVAL,
            function() sysrestore_periodictask(inst, target) end)
    end
end

local function sysrestoretape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.hastapeinserted = false
    target:RemoveTag("healloop")
    target.healloop:Cancel()
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    target.SoundEmitter:KillSound("tapeloop")
end

--SLOWMO TAPE
---------------------------------------------------------------------------------------------
local ents = {}
local time
--local debuffkey
local function GetNearbySlowables(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    ents = TheSim:FindEntities(x, y, z, TUNING.TAPE_SLOWMO.RANGE)
    --print("ENTS 1: "..ents[1][1].." + "..ents[1][2])
    return ents
end
--[[

local function slownearbythings(inst, target)
    local debuffkey = inst.prefab
    GetNearbySlowables(inst, target)
    for k, slowable in pairs(ents) do
        if slowable ~= nil
        and slowable:IsValid()
        and slowable.components.locomotor ~= nil
        and slowable.components.locomotor:GetExternalSpeedMultiplier() == 1
        and not slowable:HasTag("player")
        and not slowable:HasTag("noauradamage") --noauradamage is better at blocking immobile objects and friendlies than notraptrigger
        and slowable.replica.combat:GetTarget() == target
        and (slowable.components.health ~= nil and not slowable.components.health:IsDead()) then
            if slowable:HasTag("shadowcreature") and target.components.sanity:GetPercent() > TUNING.SANITY_BECOME_INSANE_THRESH then
                return
            end
            if slowable._slowablefxtask == nil then
                slowable.fx = SpawnPrefab("fx_slowmostatus")
                slowable.fx.entity:AddFollower()
                slowable.fx.Follower:FollowSymbol(slowable.GUID, "", 0, 0, 0)
            end
            slowable:ListenForEvent("death", function() if slowable.fx ~= nil then slowable.fx:Remove() end end)
            if slowable._slowmotapespeedtask ~= nil then
                slowable._slowmotapespeedtask:Cancel()
            end
            slowable._slowmotapespeedtask = slowable:DoTaskInTime(TUNING.TAPE_SLOWMO.EFFECTDURATION, function()
                slowable.components.locomotor:RemoveExternalSpeedMultiplier(slowable, debuffkey)
                slowable._slowmotapespeedtask = nil
            end)
            slowable._slowablefxtask = slowable:DoTaskInTime(TUNING.TAPE_SLOWMO.EFFECTDURATION, function()
                slowable._slowablefxtask = nil
                if slowable.fx ~= nil then
                    slowable.fx:Remove()
                end
            end)
            slowable.components.locomotor:SetExternalSpeedMultiplier(slowable, debuffkey, TUNING.TAPE_SLOWMO.RUNSPEEDMOD)
        end
    end
end ]]

local function UpdateTime()
    local newTime = GetTime()
    --print("TIME = "..time)
    return newTime - time
end

local function speednearbythings(inst, target)
    debuffkey = inst.prefab
    GetNearbySlowables(inst, target)
    for k, speedable in pairs(ents) do
        if speedable ~= nil and not speedable:HasTag("player") then
            if speedable:IsValid()
            and speedable.components.locomotor ~= nil
            and speedable.components.locomotor:GetExternalSpeedMultiplier() == 1
            and not speedable:HasTag("noauradamage") --noauradamage is better at blocking immobile objects and friendlies than notraptrigger
            and speedable.replica.combat:GetTarget() == target
            and (speedable.components.health ~= nil and not speedable.components.health:IsDead()) then
                if speedable:HasTag("shadowcreature") and target.components.sanity:GetPercent() > TUNING.SANITY_BECOME_INSANE_THRESH then
                    return
                end
                --if speedable._slowablefxtask == nil then
                --    speedable.fx = SpawnPrefab("fx_slowmostatus")
                --    speedable.fx.entity:AddFollower()
                --    speedable.fx.Follower:FollowSymbol(speedable.GUID, "", 0, 0, 0)
                --end
                speedable:ListenForEvent("death", function() if speedable.fx ~= nil then speedable.fx:Remove() end end)
                if speedable._slowmotapespeedtask ~= nil then
                    speedable._slowmotapespeedtask:Cancel()
                end
                speedable._slowmotapespeedtask = speedable:DoTaskInTime(TUNING.TAPE_SLOWMO.EFFECTDURATION, function()
                    speedable.components.locomotor:RemoveExternalSpeedMultiplier(speedable, debuffkey)
                    speedable._slowmotapespeedtask = nil
                end)
                speedable._slowablefxtask = speedable:DoTaskInTime(TUNING.TAPE_SLOWMO.EFFECTDURATION, function()
                    speedable._slowablefxtask = nil
                    if speedable.fx ~= nil then
                        speedable.fx:Remove()
                    end
                end)
                speedable.components.locomotor:SetExternalSpeedMultiplier(speedable, debuffkey, TUNING.TAPE_SLOWMO.SPEEDMOD_NONPLAYER)
            end
        else
            local newTime
            local function SetSpeedBoost()
                newTime = UpdateTime() --newTime is the time since the ability was initiated
                target.components.locomotor:SetExternalSpeedMultiplier(target, debuffkey, TUNING.TAPE_SLOWMO.SPEEDMOD_PLAYER + (newTime * 0.1))
            end
            target:AddTag("speedingup")
            if target:HasTag("speedingup") then
                target.speedinguptask = target:DoPeriodicTask(1, function() SetSpeedBoost() end) --todo: make this actually get canceled lol
            end
        end
    end
end

local function slowmotape_attach(inst, target)
    OverrideCorrectFace(inst, target)
    speednearbythings(inst, target)
    time = GetTime()
    target:AddTag("slowloop")
    if target:HasTag("slowloop") then
        target.slowtask = target:DoPeriodicTask(TUNING.TAPE_SLOWMO.INTERVAL, function() speednearbythings(inst, target)
        end)
    end
end

local function slowmotape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target:RemoveTag("slowloop")
    target.slowtask:Cancel()
    target:RemoveTag("speedingup")
    target.speedinguptask:Cancel()
    target.components.locomotor:RemoveExternalSpeedMultiplier(inst, debuffkey)
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    target.SoundEmitter:KillSound("tapeloop")
end

--SCANNER TAPE
---------------------------------------------------------------------------------------------

local function scantape_scancircle(target, x, z)
    local radius = 15
    for i = 0, 16 do
        target.player_classified.MapExplorer:RevealArea(x + math.cos(22.5*i) * radius, 0, z - math.sin(22.5*i) * radius, true, true)
    end
end

local function scantape_scansection(inst, target)
    --scan map segment
    local map_width, map_height = TheWorld.Map:GetSize()
    --map_width = map_width * 4
    --map_height = map_height * 4
    --local x = math.random(0, map_width)
    --local z = math.random(0, map_height)
    local x, y, z
    if TUNING.TAPE_SCANNER.POIREVEALCHANCE > math.random() then
        local things = {}
        local hash = {}
        local res = {}
        local c = 1
        if TheWorld:HasTag("forest") then
            for k, v in pairs(Ents) do
                if v:HasTag("tvPOIsurface") then
                    things[c] = v
                    c = c + 1
                end
            end
        elseif TheWorld:HasTag("cave") then
            for k, v in pairs(Ents) do
                if v:HasTag("tvPOIcaves") then
                    things[c] = v
                    c = c + 1
                end
            end
        end
        for _,v in ipairs(things) do --credit: from vogomantix on stackexchange
            if not hash[v.prefab] then --filter duplicate results from table
                res[#res+1] = v
                hash[v.prefab] = true
            end
        end
        local thing = res[math.random(#res)]
        x, y, z = thing.Transform:GetWorldPosition()
        x = x + math.random(12)
        z = z + math.random(12)
    else
        x = math.random(-1000, 1000) --Map:GetSize() only seems to return a much smaller area, so I'll do -1000 by 1000 for now. Not perfect, but it's close enough
        z = math.random(-1000, 1000)
    end
    scantape_scancircle(target, x, z)
    target.fx = SpawnPrefab("dr_hot_loop")
    target.fx.entity:AddFollower()
    target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_scanner_pulse")
    --target.SoundEmitter:PlaySound("dontstarve/common/diviningrod_ping")
    if target:HasTag("scanloop") then
        target:DoTaskInTime(0.25, function()
            target.fx = SpawnPrefab("dr_hot_loop")
            target.fx.entity:AddFollower()
            target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
            target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_scanner_pulse")
            --target.SoundEmitter:PlaySound("dontstarve/common/diviningrod_ping")
        end)
    end
end

local function scantape_scanfn(inst, target)
    if target.components.itchmeter ~= nil then
        target.components.itchmeter:DoDelta(TUNING.TAPE_SCANNER.ITCHMINIVALUE)
    end
    --spawn bigger fx to notify player map segment has been scanned
    local chance
    if target:HasTag("tvheadguy_entertainment_scanner") then
        chance = TUNING.TVSKILLTREE.SCANNER_NEWRAREREVEALCHANCE
    else
        chance = TUNING.TAPE_SCANNER.RAREREVEALCHANCE
    end
    if chance > math.random() then
        local x = math.random(-1000, 1000)
        local z = math.random(-1000, 1000)
        --local target_pos = target:G
        if x ~= nil then
            local testground = SpawnPrefab("twigs")
            testground.Transform:SetPosition(x, 0, z)
            if testground:IsOnValidGround() then
                if target.components.talker ~= nil then
                    target:DoTaskInTime(2,
                        target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_SCANNERRAREFIND))
                end
                target.fx = SpawnPrefab("dr_hot_loop")
                target.fx.entity:AddFollower()
                target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
                target.SoundEmitter:PlaySound("tvheadguy/skilltree/tapescanner_rarefind")
                --target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_scanner_pulse")
                --target.SoundEmitter:PlaySound("dontstarve/common/diviningrod_ping")
                if target:HasTag("scanloop") then
                    target:DoTaskInTime(0.25, function()
                        target.fx = SpawnPrefab("dr_hot_loop")
                        target.fx.entity:AddFollower()
                        target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
                        --target.fx.AnimState:SetAddColour(0, 255, 0, 0)
                        target.SoundEmitter:PlaySound("tvheadguy/skilltree/tapescanner_rarefind")
                        --target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_scanner_pulse")
                        --target.SoundEmitter:PlaySound("dontstarve/common/diviningrod_ping")
                    end)
                end
                target.SoundEmitter:PlaySound("tvheadguy/skilltree/tapescanner_rarefind")
                local cache = SpawnPrefab("tapecache")
                cache.Transform:SetPosition(x, 0, z)
                if cache.components.treasuremarked ~= nil then
                    cache.components.treasuremarked:TurnOn()
                end
                local poof = SpawnPrefab("fx_tapefind") --spawn a poof at the same spot for the 1 in 10000 chance another player is standing near the spawn location
                poof.Transform:SetPosition(x, 0, z)
                target:DoTaskInTime(0,
                    function() scantape_scancircle(target, x, z) end) --delay map reveal by 1 frame to ensure icon for cache is present
                testground:Remove()
            else
                testground:Remove()
                scantape_scansection(inst, target)
            end

        end
    else
        scantape_scansection(inst, target)
    end
end

local function scannertape_attach(inst, target)
    OverrideCorrectFace(inst, target)
    target:AddTag("scanloop")
    --scan once immediately
    scantape_scanfn(inst, target)
    --and then scan every interval
    if target:HasTag("scanloop") then
        target.scanloop = target:DoPeriodicTask(TUNING.TAPE_SCANNER.INTERVAL, function()
            scantape_scanfn(inst, target)
        end)
    end

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_scanner") then
        target:AddCameraExtraDistance(inst, TUNING.TVSKILLTREE.SCANNER_EXTRA_VIEW_DIST)
        target:AddTag("bonusmap")
        if target:HasTag("bonusmap") then
            target.bonusmap = target:DoPeriodicTask(TUNING.TVSKILLTREE.SCANNER_BONUSMAP_INTERVAL, function()
            local x, y, z = target.Transform:GetWorldPosition()
            scantape_scancircle(target, x, z)
        end)
        end
    end
end

local function scannertape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.hastapeinserted = false
    target:RemoveTag("scanloop")
    target.scanloop:Cancel()
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_scanner") then
        target:RemoveCameraExtraDistance(inst)
        target:RemoveTag("bonusmap")
        if target.bonusmap ~= nil then
            target.bonusmap:Cancel()
        end
    end

    target.SoundEmitter:KillSound("tapeloop")
end

--BROADCAST TAPE
---------------------------------------------------------------------------------------------

local function isgifting(target) --might as well add gifting powers, otherwise players will make science machines in the early game just to open gifts
    --TheNet:SystemMessage(target, false)
    if target.components.prototyper == nil then
        target:AddComponent("prototyper")
    end
    for k, v in pairs(target.components.prototyper.doers) do
        if k.components.giftreceiver ~= nil and
            k.components.giftreceiver:HasGift() and
            k.components.giftreceiver.giftmachine == target then
            return true
        end
    end
end

local function onturnon(target)
    if isgifting(target) then
        if not target.SoundEmitter:PlayingSound("loop") then
            --target.SoundEmitter:KillSound("idlesound")
            --target.SoundEmitter:PlaySound("dontstarve/common/research_machine_gift_active_LP", "loop")
        end
    else
        if not target.SoundEmitter:PlayingSound("idlesound") then
            --target.SoundEmitter:KillSound("loop")
            --target.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_idle_LP", "idlesound")
        end
    end
end

local function onturnoff(target)
    if target._activetask == nil then
        target.SoundEmitter:KillSound("idlesound")
        target.SoundEmitter:KillSound("loop")
    end
end

local function onactivate(target)
    --f not target.SoundEmitter:PlayingSound("sound") then
    --target.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_ding", "sound") --alchemy snds are more fitting
    target:DoTaskInTime(0, target.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_ding", "sound"))
    target:DoTaskInTime(0, SpawnPrefab("electricchargedfx"):SetTarget(target))
    --end
end

local function ongiftopened(target)
    target:DoTaskInTime(0, target.SoundEmitter:PlaySound("wes/characters/wes/balloon_party", "sound"))
    target:DoTaskInTime(0, function() --heehee hoohoo balon
        local x, y, z = target.Transform:GetWorldPosition()
        local r = 1.0
        local mini_balloons = SpawnPrefab("balloonparty_confetti_balloon")
        mini_balloons.Transform:SetPosition(x + math.random() * r, y, z + math.random() * r)

        mini_balloons = SpawnPrefab("balloonparty_confetti_balloon")
        mini_balloons.Transform:SetPosition(x + math.random() * r, y, z + math.random() * r)

        mini_balloons = SpawnPrefab("balloonparty_confetti_balloon")
        mini_balloons.Transform:SetPosition(x + math.random() * r, y, z + math.random() * r)

        mini_balloons = SpawnPrefab("balloonparty_confetti_balloon")
        mini_balloons.Transform:SetPosition(x + math.random() * r, y, z + math.random() * r)
    end)
end

local function refreshonstate(target)
    --V2C: if "burnt" tag, prototyper cmp should've been removed *see standardcomponents*
    onturnon(target)
end

local function broadcasttape_attach(inst, target)
    target:AddTag("fxloop")
    OverrideCorrectFace(inst, target)
    if target:HasTag("fxloop") then
        target.fxloop = target:DoPeriodicTask(0.25, function()
            target.fx = SpawnPrefab("dr_warm_loop_1")
            target.fx.entity:AddFollower()
            target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
        end)
    end
    target:AddTag("prototyper")
    target:AddTag("giftmachine")
    target:AddComponent("prototyper")
    target.components.prototyper.onturnon = onturnon
    target.components.prototyper.onturnoff = onturnoff
    target.components.prototyper.trees = TUNING.PROTOTYPER_TREES.SCIENCEMACHINE --techtree
    target.components.prototyper.onactivate = onactivate
    target.broadcasticon = SpawnPrefab("globalmapicon")
    target.broadcasticon:TrackEntity(target)
    target.broadcasticon.MiniMapEntity:SetIcon("images/map_icons/tvheadguy.tex")
    target.broadcasticon.MiniMapEntity:SetCanUseCache(false)
    target.broadcasticon.MiniMapEntity:SetDrawOverFogOfWar(true)
    target.broadcasticon.MiniMapEntity:SetPriority(21)
    target:ListenForEvent("ms_addgiftreceiver", refreshonstate)
    target:ListenForEvent("ms_removegiftreceiver", refreshonstate)
    target:ListenForEvent("ms_giftopened", ongiftopened)

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_research") then
        local bpspawned = false
        target:AddTag("freebploop")
        if target:HasTag("freebploop") then
            target.freebploop = target:DoPeriodicTask(1, function()
                if math.random() < TUNING.TVSKILLTREE.RESEARCH_BLUEPRINT_SPAWN_CHANCE and bpspawned == false then
                    local blueprint = SpawnPrefab("blueprint")
                    blueprint.Transform:SetPosition(target.Transform:GetWorldPosition())
                    Launch(blueprint, target, TUNING.LAUNCH_SPEED_SMALL)
                    target.SoundEmitter:PlaySound("tvheadguy/skilltree/taperesearch_print")
                    bpspawned = true
                end
            end)
        end
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_broadcast_LP", "broadcasttape")
end

local function broadcasttape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.fxloop:Cancel()
    target:RemoveTag("fxloop")
    target:RemoveTag("prototyper")
    target:RemoveTag("giftmachine")
    target:RemoveComponent("prototyper")
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false
    target.SoundEmitter:KillSound("idlesound")
    target.SoundEmitter:KillSound("loop")
    target.broadcasticon:Remove()
    target.broadcasticon = nil

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_research") then
        target:RemoveTag("freebploop")
        if target.freebploop ~= nil then
            target.freebploop:Cancel()
        end
    end

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("broadcasttape")
end


--HYPER CAST TAPE (ALCHEMY)
---------------------------------------------------------------------------------------------

local function hypercasttape_attach(inst, target)
    target:AddTag("fxloop")
    OverrideCorrectFace(inst, target)
    if target:HasTag("fxloop") then
        target.fxloop = target:DoPeriodicTask(0.25, function()
            target.fx = SpawnPrefab("dr_warmer_loop")
            target.fx.entity:AddFollower()
            target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, -200, 0)
        end)
    end
    target:AddTag("prototyper")
    target:AddTag("giftmachine")
    target:AddComponent("prototyper")
    target.components.prototyper.onturnon = onturnon
    target.components.prototyper.onturnoff = onturnoff
    target.components.prototyper.trees = TUNING.PROTOTYPER_TREES.ALCHEMYMACHINE --techtree
    target.components.prototyper.onactivate = onactivate
    target.broadcasticon = SpawnPrefab("globalmapicon")
    target.broadcasticon:TrackEntity(target)
    target.broadcasticon.MiniMapEntity:SetIcon("images/map_icons/tvheadguy.tex")
    target.broadcasticon.MiniMapEntity:SetCanUseCache(false)
    target.broadcasticon.MiniMapEntity:SetDrawOverFogOfWar(true)
    target.broadcasticon.MiniMapEntity:SetPriority(21)
    target:ListenForEvent("ms_addgiftreceiver", refreshonstate)
    target:ListenForEvent("ms_removegiftreceiver", refreshonstate)
    target:ListenForEvent("ms_giftopened", ongiftopened)

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_research") then
        local bpspawned = false
        target:AddTag("freebploop")
        if target:HasTag("freebploop") then
            target.freebploop = target:DoPeriodicTask(1, function()
                if math.random() < TUNING.TVSKILLTREE.RESEARCH_BLUEPRINT_SPAWN_CHANCE and bpspawned == false then
                    local blueprint = SpawnPrefab("blueprint")
                    blueprint.Transform:SetPosition(target.Transform:GetWorldPosition())
                    Launch(blueprint, target, TUNING.LAUNCH_SPEED_SMALL)
                    target.SoundEmitter:PlaySound("tvheadguy/skilltree/taperesearch_print")
                    bpspawned = true
                end
            end)
        end
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_broadcast_LP", "broadcasttape")
end

local function hypercasttape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.fxloop:Cancel()
    target:RemoveTag("fxloop")
    target:RemoveTag("prototyper")
    target:RemoveTag("giftmachine")
    target:RemoveComponent("prototyper")
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false
    target.SoundEmitter:KillSound("idlesound")
    target.SoundEmitter:KillSound("loop")
    target.broadcasticon:Remove()
    target.broadcasticon = nil

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_research") then
        target:RemoveTag("freebploop")
        if target.freebploop ~= nil then
            target.freebploop:Cancel()
        end
    end

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("broadcasttape")
end

--INVISIBILITY TAPE
---------------------------------------------------------------------------------------------

local ents3 = {}

--invisibility code borrowed from the Gollum mod
local function DropTargets(inst, target)
    --TheNet:SystemMessage(tostring(target), false)
    local x, y, z = target.Transform:GetWorldPosition()
    ents3 = TheSim:FindEntities(x, y, z, 100)

    for k, v in pairs(ents3) do
        if v.components.combat and v.components.combat.target == target then
            v.components.combat.target = nil
            v:AddTag("_attackinvisibletv")
        end
    end
end

local function RememberInvisibleBastard(inst, target)
    for k, v in pairs(ents3) do
        --local x, y, z = target.Transform:GetWorldPosition()
        if target:IsValid() and v:IsValid() and v.components.combat and v:IsNear(target, TUNING.TAPE_INVIS.REAGGRORADIUS) and v:HasTag("_attackinvisibletv") then
            v.components.combat.target = target
            v:RemoveTag("_attackinvisibletv")
        end
    end
end

local function OnHitOther(inst, data) --inst, data
	if data.target ~= nil and data.target:IsValid() then
		SpawnPrefab("hitsparks_fx"):Setup(inst, data.target)
	end
end

local function RecalculatePlanarDamage(target, data)
    --local weapon = target.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    if target:HasTag("is_invisible") then
        target.components.planardamage:AddBonus(target, TUNING.TVSKILLTREE.INVIS_PLANAR_DMG_BONUS, "tape_invis")
    else
        target.components.planardamage:RemoveBonus(target, "tape_invis")
    end
end

local function OnEquip(target, data)
	if data ~= nil and data.item ~= nil then
		if data.eslot == EQUIPSLOTS.HANDS then
			RecalculatePlanarDamage(target)
		end
    end
end

local function OnUnequip(target, data)
	if data ~= nil and data.item ~= nil then
		if data.eslot == EQUIPSLOTS.HANDS then
			RecalculatePlanarDamage(target)
		end
    end
end

local function ShedArmourEffects(target)
    for k, v in pairs(EQUIPSLOTS) do
        if v == EQUIPSLOTS.BEARD then
            return
        end
        --local inventory_replica = target and target._parent and target._parent.replica.inventory
        --local gear = inventory_replica:GetEquippedItem(v)
        local gear = target.components.inventory:GetEquippedItem(v)
        if gear ~= nil and gear.fx ~= nil then
            gear.fx:Hide()
        else
            --print("DEBUG: gear fx nil")
        end
    end
end

local function ReapplyArmourEffects(target)
    for k, v in pairs(EQUIPSLOTS) do
        if v == EQUIPSLOTS.BEARD then
            return
        end
        local gear = target.components.inventory:GetEquippedItem(v)
        if gear ~= nil and gear.fx ~= nil then
            gear.fx:Show()
        else
            --print("DEBUG: gear fx nil")
        end
    end
end

local function invistape_attach(inst, target)
    target.components.sanity:DoDelta(-TUNING.SANITY_TINY)
    target.AnimState:ClearOverrideSymbol("face") --clear 'loading' face
    --target.SoundEmitter:PlaySound("dontstarve/maxwell/disappear")

    --inst.task = inst:DoPeriodicTask(TUNING.TAPE_INVIS.ITCHTICKRATE, OnTick, nil, target)

    local coolpoof = SpawnPrefab("carnival_sparkle_fx") --maxwell_smoke
    coolpoof.Transform:SetPosition(target.Transform:GetWorldPosition())
    --coolpoof.AnimState:SetScale(0.7, 0.7) --calling AnimState on maxwell_smoke causes a crash
    --coolpoof.AnimState:SetAddColour(1, 1, 1, 1)
    --coolpoof.AnimState:SetMultColour(1, 1, 1, 1)
    --coolpoof.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    target.components.locomotor.walkspeed = 4*1.5
    target.components.locomotor.runspeed = 6*1.5
    target.tapeinvisible = true
    target:AddTag("notarget")
    target:AddTag("is_invisible")
    target.m_compatibility.UpdateAnim(inst, true) --true means only once
    target.net_tapeinvisible:set(true)
    --target:ListenForEvent("onattackother", OnAttackOther) --(inst, target)

    --previously, wait 5 seconds to drop targets, but I want it to be instant
    DropTargets(inst, target)
    ShedArmourEffects(target)
    --local timer = 0
    --target.task_drop_targets = target:DoPeriodicTask(0.2,function(target)
    --	timer = timer + 0.2
    --	if timer > TUNING.TAPE_INVIS.AGGROTIME then
    --		DropTargets(inst, target)
    --	end
    --	if target.task_drop_targets and (timer > TUNING.TAPE_INVIS.AGGROTIME or not target.tapeinvisible)  then
    --		target.task_drop_targets:Cancel()
    --		target.task_drop_targets = nil
    --	end
    --end)
    target:RemoveTag("scarytoprey")

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_invis") then
        RecalculatePlanarDamage(target)
        target:ListenForEvent("onhitother", OnHitOther)
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_invis_cloak")
    target:DoTaskInTime(TUNING.TAPE_INVIS.DURATION-1.5, function() target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_invis_decloak") end)
end

local function invistape_detach(inst, target)
    --target.SoundEmitter:PlaySound("dontstarve/maxwell/disappear") --dontstarve/common/deathpoof
    RememberInvisibleBastard(inst, target) --old attackers will re attack tvheadguy
    local coolpoof = SpawnPrefab("carnival_sparkle_fx") --maxwell_smoke
    coolpoof.Transform:SetPosition(target.Transform:GetWorldPosition())
    --coolpoof.AnimState:SetScale(0.7, 0.7)
    --coolpoof.AnimState:SetAddColour(1, 1, 1, 1)
    --coolpoof.AnimState:SetMultColour(1, 1, 1, 1)
    --coolpoof.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    target.components.locomotor.walkspeed = 4
    target.components.locomotor.runspeed = 6
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false
    target:RemoveTag("notarget")
    target:RemoveTag("is_invisible")
    target:AddTag("scarytoprey")
    target.tapeinvisible = false
    target.net_tapeinvisible:set(false)

    ReapplyArmourEffects(target)

    --Skilltree
    if target:HasTag("tvheadguy_entertainment_invis") then
        RecalculatePlanarDamage(target)
        target:RemoveEventCallback("onhitother", OnHitOther)
    end

    target.SoundEmitter:KillSound("tapeloop")
end

----Decided to ditch removing the buff on attack because it's more fun and sets it apart from other invisibility abilities
--function OnAttackOther(inst, target)
--    --local target = inst
--	target.lastrevealed = GetTime()
--	invistape_detach(target)
--end

--NIGHTVIS TAPE
---------------------------------------------------------------------------------------------

--local STATICVISION_COLOURCUBES = --TODO: TRY PUTTING THIS IN TVHEADGUY.LUA
--{
--    day = "images/colour_cubes/tape_vision_cc.tex",
--    dusk = "images/colour_cubes/tape_vision_cc.tex",
--    night = "images/colour_cubes/tape_vision_cc.tex",
--    full_moon = "images/colour_cubes/tape_vision_cc.tex",
--}

local function nightvistape_saythething(target, inst)
    if target.components.talker ~= nil then
        target:DoTaskInTime(2, function()
            if TheWorld.state.isday then
                target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_NIGHTVISDAY)
            elseif TheWorld.state.isdusk then
                target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_NIGHTVISDUSK)
            elseif TheWorld.state.isnight or TheWorld.state.iscavenight or TheWorld.state.iscavedusk or TheWorld.state.iscaveday then
                target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_NIGHTVISNIGHT)
            elseif TheWorld.state.isfullmoon then
                target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_NIGHTVISFULLMOON)
            end
        end)
    end
end

--local function nightvistape_spawngestalt_fn(owner, inst, data)
--    if not inst._is_active then
--        return
--    end
--
--    if owner ~= nil and (owner.components.health == nil or not owner.components.health:IsDead()) then
--        local target = data.target
--        if target and target ~= owner and target:IsValid() and (target.components.health == nil or not target.components.health:IsDead() and not target:HasTag("structure") and not target:HasTag("wall")) then
--
--            -- In combat, this is when we're just launching a projectile, so don't spawn a gestalt yet
--            if data.weapon ~= nil and data.projectile == nil
--                    and (data.weapon.components.projectile ~= nil
--                        or data.weapon.components.complexprojectile ~= nil
--                        or data.weapon.components.weapon:CanRangedAttack()) then
--                return
--            end
--
--            local x, y, z = target.Transform:GetWorldPosition()
--
--            local gestalt = SpawnPrefab("alterguardianhat_projectile")
--            local r = GetRandomMinMax(3, 5)
--            local delta_angle = GetRandomMinMax(-90, 90)
--            local angle = (owner:GetAngleToPoint(x, y, z) + delta_angle) * DEGREES
--            gestalt.Transform:SetPosition(x + r * math.cos(angle), y, z + r * -math.sin(angle))
--            gestalt:ForceFacePoint(x, y, z)
--            gestalt:SetTargetPosition(Vector3(x, y, z))
--            gestalt.components.follower:SetLeader(owner)
--
--            if owner.components.sanity ~= nil then
--                owner.components.sanity:DoDelta(-1, true) -- using overtime so it doesnt make the sanity sfx every time you attack
--            end
--        end
--    end
--end

local function PurgeCCAndNightVis(inst, data)
    --print("DEBUG: purge fn reached!")
    --print("DEBUG: inst: "..inst.prefab)
    inst.components.playervision:ForceNightVision(false)
    --inst.components.playervision:SetCustomCCTable(nil)

    inst.components.grue:RemoveImmunity("tvheadguytape_nightvis")
    inst:SetForcedNightVision(false)

    --clearnightvistags(nil, inst)
end

--TODO: find out why dusk buff doesn't get removed when it becomes night
local function clearnightvistags(inst, target)
    --print("DEBUG: target: "..tostring(target))
    --print("DEBUG: inst: "..tostring(inst).." (should be nil)")
    if target == true or target == false then
        local _target = inst
        local _inst = target
        target = _target
        inst = _inst
    end
    target:RemoveTag("tvnightvis_dayloop")
    target:RemoveTag("tvnightvis_duskloop")
    if target.tvnightvis_dayloop ~= nil then
        target.tvnightvis_dayloop:Cancel()
    end
    if target.tvnightvis_duskloop ~= nil then
        target.tvnightvis_duskloop:Cancel()
    end
    --target:RemoveEventCallback("onattackother", nightvistape_spawngestalt_fn)
end

local function nightvistape_day(target, inst)
    --print("DEBUG: target: "..tostring(target))
    --print("DEBUG: inst: "..tostring(inst).." (should be nil)")
    nightvistape_saythething(target, inst)
    clearnightvistags(inst, target)
    PurgeCCAndNightVis(target)
    target:AddTag("tvnightvis_dayloop")
    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_nightvis_newsegment")

    target.tvnightvis_dayloop = target:DoPeriodicTask(TUNING.TAPE_NIGHTVIS.DAYINTERVAL, function()
        if target:HasTag("tvnightvis_dayloop") then
            if target.components.tapefinder ~= nil then
                if target:HasTag("tvheadguy_entertainment_nightvis") then
                    target.components.tapefinder:IncreasePity(target)
                    target.components.tapefinder:IncreasePity(target)
                else
                    target.components.tapefinder:IncreasePity(target)
                end
            end
        end
    end)
end

local function nightvistape_dusk_task(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    local fx = SpawnPrefab("bee_poof_small")
    fx.Transform:SetPosition(x, y, z)

    target.components.locomotor.walkspeed = 4.5
    target.components.locomotor.runspeed = 6.5

    DropTargets(nil, target)
    target.tapeinvisible = true
    target:AddTag("notarget")
    target.m_compatibility.UpdateAnim(target, true) --true means only once
    target.net_tapeinvisible:set(true)
    target:AddTag("scarytoprey") --don't want this ability to permit easy bird killing

    target.invistask = target:DoTaskInTime(TUNING.TAPE_NIGHTVIS.DUSKDURATION, function()
        x, y, z = target.Transform:GetWorldPosition()
        local afx = SpawnPrefab("bee_poof_big")
        afx.Transform:SetPosition(x, y, z)

        target.components.locomotor.walkspeed = 4
        target.components.locomotor.runspeed = 6

        target:RemoveTag("notarget")
        target:AddTag("scarytoprey")
        target.tapeinvisible = false
        target.net_tapeinvisible:set(false)
    end)
end

local function nightvistape_dusk_task_skilltree(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    local fx = SpawnPrefab("bee_poof_big")
    fx.Transform:SetPosition(x, y, z)

    target.components.locomotor.walkspeed = 5
    target.components.locomotor.runspeed = 7

    DropTargets(nil, target)
    target.tapeinvisible = true
    target:AddTag("notarget")
    target.m_compatibility.UpdateAnim(target, true) --true means only once
    target.net_tapeinvisible:set(true)
    --target:AddTag("scarytoprey") --don't want this ability to permit easy bird killing

    target.invistaskskilltree = target:DoTaskInTime(TUNING.TVSKILLTREE.NIGHTVIS_DUSK_NEWDURATION, function()
        x, y, z = target.Transform:GetWorldPosition()
        local afx = SpawnPrefab("bee_poof_big")
        afx.Transform:SetPosition(x, y, z)

        target.components.locomotor.walkspeed = 4
        target.components.locomotor.runspeed = 6

        target:RemoveTag("notarget")
        --target:AddTag("scarytoprey")
        target.tapeinvisible = false
        target.net_tapeinvisible:set(false)
    end)
end


local function nightvistape_dusk(target, inst)
    --print("DEBUG: target: "..tostring(target))
    --print("DEBUG: inst: "..tostring(inst).." (should be nil)")
    nightvistape_saythething(target, inst)
    clearnightvistags(inst, target)
    PurgeCCAndNightVis(target)
    target:AddTag("tvnightvis_duskloop")
    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_nightvis_newsegment")
    --nightvistape_dusk_task(target)

    target:DoTaskInTime(5, function()
        if target:HasTag("tvnightvis_duskloop") then
            nightvistape_dusk_task(inst, target)  --go invisible once at first
            --todo: test if DoPeriodicTask works with randomised numbers
            target.tvnightvis_duskloop = target:DoPeriodicTask((TUNING.TAPE_NIGHTVIS.DUSKINTERVAL * (math.random() + 1)), function()
                if target:HasTag("tvnightvis_duskloop") then
                    if target:HasTag("tvheadguy_entertainment_nightvis") then
                        nightvistape_dusk_task_skilltree(inst, target)
                    else
                        nightvistape_dusk_task(inst, target) end
                    end
            end)
        end
    end)
end

local function nightvistape_night(target, inst)
    --print("DEBUG: target: "..tostring(target))
    --print("DEBUG: inst: "..tostring(inst).." (should be nil)")
    if TheWorld.state.isnight or TheWorld.state.iscavenight or TheWorld.state.iscaveday or TheWorld.state.iscavedusk then
        clearnightvistags(inst, target)
        nightvistape_saythething(target, inst)

        --target.components.playervision:ForceNightVision(true)
        target:SetForcedNightVision(true)
        --target.components.playervision:SetCustomCCTable(STATICVISION_COLOURCUBES)
    elseif TheWorld.state.isfullmoon then
        clearnightvistags(inst, target)
        nightvistape_saythething(target, inst)
		--target:ListenForEvent("onattackother", nightvistape_spawngestalt_fn, target)
    end
    target:SetForcedNightVision(TheWorld.state.isnight and not TheWorld.state.isfullmoon)
    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_nightvis_newsegment")
end

local function nightvistape_attach(inst, target)
    OverrideCorrectFace(inst, target)

    target:WatchWorldState("isday", nightvistape_day)
    target:WatchWorldState("isdusk", nightvistape_dusk)
    if TheWorld:HasTag("cave") then
        nightvistape_night(target, inst)
    elseif TheWorld:HasTag("forest") then --forest: ~= cave
        target:WatchWorldState("isnight", nightvistape_night)
        target:WatchWorldState("isfullmoon", nightvistape_night)
    end

    if TheWorld.state.isday then
        nightvistape_day(target, inst)
    elseif TheWorld.state.isdusk then
        nightvistape_dusk(target, inst)
    elseif TheWorld.state.isnight then
        nightvistape_night(target, inst)
    end

    target:ListenForEvent("tvejectattempt", PurgeCCAndNightVis)

    --target.components.playervision:ForceNightVision(true)
    --target.components.playervision:SetCustomCCTable(STATICVISION_COLOURCUBES)
end

local function nightvistape_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")

    clearnightvistags(inst, target)

    --if target.SetForcedNightVision ~= nil then
    --    if TheWorld:HasTag("cave") then
    --        target:SetForcedNightVision(false)
    --    else
    --        
    --        --target.components.playervision:SetCustomCCTable(nil)
    --    end
    --end
    target.components.playervision:ForceNightVision(false)
    --target.components.playervision:SetCustomCCTable(nil)

    target:StopWatchingWorldState("isnight", nightvistape_night)
    target:StopWatchingWorldState("isfullmoon", nightvistape_night)
    target:StopWatchingWorldState("isday", nightvistape_day)
    target:StopWatchingWorldState("isdusk", nightvistape_dusk)

    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    target.SoundEmitter:KillSound("tapeloop")

    target:RemoveEventCallback("tvejectattempt", PurgeCCAndNightVis)
    --if TheWorld:HasTag("cave") then
    --    target.components.playervision:ForceNightVision(false)
    --    --target:SetForcedNightVision(false)
    --    target.components.playervision:SetCustomCCTable(nil)
    --else
    --    target:StopWatchingWorldState("isnight", nightvision_onworldstateupdate)
    --    target:StopWatchingWorldState("isfullmoon", nightvision_onworldstateupdate)
    --    target.components.playervision:ForceNightVision(false)
    --    --target:SetForcedNightVision(false)
    --    target.components.playervision:SetCustomCCTable(nil)
    --end
end

--PORTAL TAPE
---------------------------------------------------------------------------------------------

local function portaltape_attach(inst, target)
    OverrideCorrectFace(inst, target)

    local x, y, z = target.Transform:GetWorldPosition()
    local theta0 = math.random() * 2 * PI
    local dtheta = 2 * PI
    local thetavar = dtheta / 10
    local theta, radius
    theta = GetRandomWithVariance(theta0 + dtheta, thetavar)
    radius = 1.6 + math.random() * .4

    local mylittleportal = SpawnPrefab("remoteportal")
	mylittleportal.Transform:SetPosition(x + math.cos(theta) * radius, 0, z - math.sin(theta) * radius)
    mylittleportal.components.follower:SetLeader(target)
end

local function portaltape_detach(inst, target)
    --if target.mylittleportal ~= nil then
    --    target:DoTaskInTime(1, function() target.mylittleportal:PushEvent("ejectdeleteportal") end)
    --    target.mylittleportal = nil
    --end

    target:DoTaskInTime(0.5, function()
        local x, y, z = target.Transform:GetWorldPosition()
        local entities = TheSim:FindEntities(x, y, z, 20, { "remoteportal" }) --{"cant-tags"}
        local c = 1
        for k, portal in pairs(entities) do
            if c == 1 then
                portal:PushEvent("ejectdeleteportal")
            end
            c = c - 1
        end
    end)

    target.AnimState:ClearOverrideSymbol("face")
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false

    target.SoundEmitter:KillSound("tapeloop")
end

--UPGRADED INVISIBILITY TAPE
---------------------------------------------------------------------------------------------

local function SpawnFunnyGuy(target, firstguy)
    local x, y, z = target.Transform:GetWorldPosition()
    local clonedrone = SpawnPrefab("clonedrone")
    local skin = target.components.skinner.skin_name
    clonedrone:PushEvent("clonedrone_updateskin", {skin = skin})

    if firstguy == true then
        clonedrone.Transform:SetPosition(x, y, z)
    else
        local amt = 1
        local theta0 = math.random() * 2 * PI
        local dtheta = 2 * PI / amt
        local thetavar = dtheta / 10
        local theta, radius
        theta = GetRandomWithVariance(theta0 + dtheta * amt, thetavar)
        radius = 1.6 + math.random() * .4
        clonedrone.Transform:SetPosition(x + math.cos(theta) * radius, y, z - math.sin(theta) * radius)
    end
    if clonedrone.components.follower ~= nil then
        clonedrone.components.follower:SetLeader(target)
    end
    if clonedrone.components.combat ~= nil then
        local ents5 = TheSim:FindEntities(x, y, z, 20)
        for k, v in pairs(ents5) do
            if v.components.combat ~= nil and v.components.combat.target == target then
                clonedrone.components.combat:SetTarget(v)
            end
        end
    end
end

local function OnHitOtherUpgraded(inst, data) --inst, data
	if data.target ~= nil and data.target:IsValid() then
		SpawnPrefab("hitsparks_fx"):Setup(inst, data.target)
	end

    SpawnFunnyGuy(inst)
end

local function invistape_upgraded_attach(inst, target)
    target.components.sanity:DoDelta(-TUNING.SANITY_TINY)
    target.AnimState:ClearOverrideSymbol("face") --clear 'loading' face
    --target.SoundEmitter:PlaySound("dontstarve/maxwell/disappear")

    --inst.task = inst:DoPeriodicTask(TUNING.TAPE_INVIS_UPGRADED.ITCHTICKRATE, OnTick, nil, target)

    --local coolpoof = SpawnPrefab("carnival_sparkle_fx") --maxwell_smoke --dont' spawn sparkles for the upgraded tape, clone drones already spawn fx

    target.components.locomotor.walkspeed = 4*1.5
    target.components.locomotor.runspeed = 6*1.5
    target.tapeinvisible = true
    target:AddTag("notarget")
    target:AddTag("is_invisible")
    target.m_compatibility.UpdateAnim(inst, true) --true means only once
    target.net_tapeinvisible:set(true)
    --target:ListenForEvent("onattackother", OnAttackOther) --(inst, target)

    --previously, wait 5 seconds to drop targets, but I want it to be instant
    DropTargets(inst, target)
    ShedArmourEffects(target)
    --local timer = 0
    --target.task_drop_targets = target:DoPeriodicTask(0.2,function(target)
    --	timer = timer + 0.2
    --	if timer > TUNING.TAPE_INVIS_UPGRADED.AGGROTIME then
    --		DropTargets(inst, target)
    --	end
    --	if target.task_drop_targets and (timer > TUNING.TAPE_INVIS_UPGRADED.AGGROTIME or not target.tapeinvisible)  then
    --		target.task_drop_targets:Cancel()
    --		target.task_drop_targets = nil
    --	end
    --end)
    target:RemoveTag("scarytoprey")

    RecalculatePlanarDamage(target)
    target:ListenForEvent("onhitother", OnHitOtherUpgraded)
    SpawnFunnyGuy(target, true)

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_invis_cloak")
    target:DoTaskInTime(TUNING.TAPE_INVIS_UPGRADED.DURATION-1.5, function() target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_invis_decloak") end)
    target.SoundEmitter:PlaySound("tvheadguy/skilltree/thefinalact_LP", "tv_finalact")
end

local function invistape_upgraded_detach(inst, target)
    RememberInvisibleBastard(inst, target) --old attackers will re attack tvheadguy
    local coolpoof = SpawnPrefab("maxwell_smoke") --carnival_sparkle_fx
    coolpoof.Transform:SetPosition(target.Transform:GetWorldPosition())
    target.SoundEmitter:PlaySound("dontstarve/maxwell/disappear") --dontstarve/common/deathpoof

    target.components.locomotor.walkspeed = 4
    target.components.locomotor.runspeed = 6
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)
    target.hastapeinserted = false
    target:RemoveTag("notarget")
    target:RemoveTag("is_invisible")
    target:AddTag("scarytoprey")
    target.tapeinvisible = false
    target.net_tapeinvisible:set(false)

    ReapplyArmourEffects(target)

    RecalculatePlanarDamage(target)
    target:RemoveEventCallback("onhitother", OnHitOtherUpgraded)

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("tv_finalact")
end

--UPGRADED LIGHTNING TAPE
---------------------------------------------------------------------------------------------

local puffs = {"round_puff_fx_sm", "round_puff_fx_hi", "round_puff_fx_lg"}

local function SpawnBoomBoomAt(x, y, z, target)
    local puff = puffs[math.random(1, #puffs)]
    SpawnPrefab(puff).Transform:SetPosition(x, y, z)

    local boomvictims = TheSim:FindEntities(x, y, z, TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOM_RADIUS)
    for k, v in pairs(boomvictims) do
        if v:IsValid()
        and not v:HasTag("player")
        and v.components.combat ~= nil then
            v.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOM_DMG, nil, nil, {planar = TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOM_PLANARDMG})
        end
    end
end

local function SpawnRingOfBoomBooms(x, y, z, target)
    ShakeAllCameras(CAMERASHAKE.FULL, .25, .03, .1, target, 6)

    local numboombooms = math.random(TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOMS_MIN, TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOMS_MAX)
    for i = numboombooms, 0, -1 do
        target:DoTaskInTime(((i-10)*0.1), function()
            local radius
            if math.random() < 0.5 then
                radius = TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOM_SPAWNRADIUS * (math.random() * .4)
            else
                radius = -TUNING.TAPE_LIGHTNING_UPGRADED.BOOMBOOM_SPAWNRADIUS * (math.random() * .4)
            end
            SpawnBoomBoomAt(x + radius, 0, z + radius, target)
        end)
    end
end

local function GetNearbyLightningablesUpgraded(inst, target)
    local ents2 = {}
    local x, y, z = target.Transform:GetWorldPosition()
    local ents2pre = TheSim:FindEntities(x, y, z, TUNING.TAPE_LIGHTNING.RANGE)
    for k, v in pairs(ents2pre) do
        if v ~= nil
                and v:IsValid()
                and not v:HasTag("player")
                and not v:HasTag("noauradamage") --noauradamage is better at blocking immobile objects and friendlies than notraptrigger
                and not v:HasTag("bird")
                and not v:HasTag("prey")
                and not v:HasTag("companion")
                and not v:HasTag("butterfly")
                --and not v:HasTag("_recentlystruck")
                --and v._slowablefxtask == nil
                and v.components.locomotor ~= nil
                and v.components.locomotor:GetExternalSpeedMultiplier() == 1
                --and v.replica.combat:GetTarget() == target
                and (v.components.health ~= nil and not v.components.health:IsDead()) then
                    if v:HasTag("shadowcreature") and target.components.sanity:GetPercent() > TUNING.SANITY_BECOME_INSANE_THRESH then
                        return
                    end
                table.insert(ents2, v)
        end
    end
    --dumptable(ents2)
    return ents2
    --print("ENTS 1: "..ents[1][1].." + "..ents[1][2])
end

local function lightning_upgraded_periodictask(inst, target)
    local ents2 = GetNearbyLightningablesUpgraded(inst, target)
    local maxzaps = TUNING.TAPE_LIGHTNING_UPGRADED.MAXZAPS
    for counter = maxzaps, 1, -1 do
        target:DoTaskInTime(0.5, function()
            if ents2 ~= nil then
                local victim = ents2[counter]
                if victim ~= nil then
                    local debuffkey = inst.prefab
                    local x, y, z = victim.Transform:GetWorldPosition()
                    if x ~= nil then
                        local zap = SpawnPrefab("lightning")
                        zap.Transform:SetPosition(x, y, z)
                        local pft = SpawnPrefab("round_puff_fx_sm")
                        pft.Transform:SetPosition(x, y, z)
                    end

                    if victim:HasTag("epic") then
                        victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING_UPGRADED.DAMAGE + TUNING.TAPE_LIGHTNING_UPGRADED.BOSS_DMG_BONUS, nil, nil, {planar = TUNING.TAPE_LIGHTNING_UPGRADED.PLANAR_DMG_BONUS})
                        if victim.AnimState ~= nil then
                            --SpawnPrefab("hitsparks_fx"):Setup(target, victim) --TODO: figure out why these nil checks don't work?????
                        else
                            print("DEBUG: No animstate on target!")
                        end
                    else
                        victim.components.combat:GetAttacked(target, TUNING.TAPE_LIGHTNING_UPGRADED.DAMAGE, nil, nil, {planar = TUNING.TAPE_LIGHTNING_UPGRADED.PLANAR_DMG_BONUS})
                        if victim.AnimState ~= nil then
                            --SpawnPrefab("hitsparks_fx"):Setup(target, victim)
                        else
                            print("DEBUG: No animstate on target!")
                        end
                    end

                    target:DoTaskInTime(1, function() SpawnRingOfBoomBooms(x, y, z, target) end)

                    --victim:AddTag("_recentlystruck")
                    --victim:DoTaskInTime(1, function() victim:RemoveTag("_recentlystruck") end)

                    if victim._slowablefxtask == nil then
                        victim.fx = SpawnPrefab("fx_slowmostatus")
                        victim.fx.entity:SetParent(victim.entity)
                        --v.fx.entity:AddFollower()
                        --v.fx.Follower:FollowSymbol(v.GUID, "", 0, 0, 0)
                    end
                    victim:ListenForEvent("death", function() if victim.fx ~= nil then ErodeAway(victim.fx) end end)
                    if victim._slowmotapespeedtask ~= nil then
                        victim._slowmotapespeedtask:Cancel()
                    end
                    victim._slowmotapespeedtask = victim:DoTaskInTime(TUNING.TAPE_LIGHTNING_UPGRADED.EFFECTDURATION, function()
                        victim.components.locomotor:RemoveExternalSpeedMultiplier(victim, debuffkey)
                        victim._slowmotapespeedtask = nil
                    end)
                    victim._slowablefxtask = victim:DoTaskInTime(TUNING.TAPE_LIGHTNING_UPGRADED.EFFECTDURATION, function()
                        victim._slowablefxtask = nil
                        --if v.fx ~= nil then
                        --    v.fx:Remove()
                        --end
                    end)
                    victim.components.locomotor:SetExternalSpeedMultiplier(victim, debuffkey, TUNING.TAPE_LIGHTNING_UPGRADED.RUNSPEEDMOD)
                end
            end
        end)
    end
end

local function lightning_upgraded_fx_periodictask(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    local zap = SpawnPrefab("moonstorm_spark_shock_fx")
    zap.Transform:SetPosition(x+math.random(-10,10), y, z+math.random(-10,10))
    --zap.AnimState:SetScale((math.random(50, 150)/100), (math.random(50, 150)/100), (math.random(50, 150)/100)) --calling animstate here crashes the game fsr
end

local function lightningtape_upgraded_attach(inst, target)
    OverrideCorrectFace(inst, target)

    target:AddTag("lightningloop")
    lightning_upgraded_periodictask(inst, target)
    if TheWorld.state.israining then
        if target:HasTag("lightningloop") then
            target.lightningloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING_UPGRADED.INTERVAL_RAIN,
                function() lightning_upgraded_periodictask(inst, target) end)
        end
        target:DoTaskInTime(1, function() target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_LIGHTNING_ISRAINING) end)
        --print("DEBUG: IT IS RAINING MY DUDES")
    else
        if target:HasTag("lightningloop") then
            target.lightningloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING_UPGRADED.INTERVAL,
                function() lightning_upgraded_periodictask(inst, target) end)
        end
        --print("DEBUG: IT ***NOT*** IS RAINING MY DUDES")
    end

    target:AddTag("lightningfxloop")
    if target:HasTag("lightningfxloop") then
        target.lightningfxloop = target:DoPeriodicTask(TUNING.TAPE_LIGHTNING_UPGRADED.FXINTERVAL,
        function() lightning_upgraded_fx_periodictask(inst, target) end)
    end

    target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_lightning_LP", "lightningtape")

    --target:PushEvent("net_tape_moonstorm_over_dirty")

    --if target.HUD.moonlightningover == nil then
    --    target.HUD.moonlightningover = target.HUD.overlayroot:AddChild(MoonLightningOver(inst)) --TODO: FIND OUT WHY target.HUD IS NIL!!!!!!!!
    --    target.HUD.moonlightningover:MoveToBack()
    --    target.HUD.moonlightningover:Show()
    --end
end

local function lightningtape_upgraded_detach(inst, target)
    target.AnimState:ClearOverrideSymbol("face")
    target.hastapeinserted = false
    target:RemoveTag("lightningloop")
    target.lightningloop:Cancel()
    target:RemoveTag("lightningfxloop")
    target.lightningfxloop:Cancel()
    inst:AddComponent("tapeconsume")
    inst.components.tapeconsume:ReturnTape(inst, target)

    target.SoundEmitter:KillSound("tapeloop")
    target.SoundEmitter:KillSound("lightningtape")

    --if target.HUD.moonlightningover ~= nil then
    --    target.HUD.moonlightningover:Hide()
    --end
end

---------------------------------------------------------------------------------------------

local function OnTimerDone(inst, data)
    if data.name == "buffover" then
        inst.components.debuff:Stop()
    end
    --inst:PushEvent("nomorebuff")
    inst.hastapeinserted = false
end

--MAKE BUFF PREFABS
---------------------------------------------------------------------------------------------

local function MakeBuff(name, onattachedfn, onextendedfn, ondetachedfn, duration, priority, prefabs)
    local function OnAttached(inst, target)
        inst.entity:SetParent(target.entity)
        inst.Transform:SetPosition(0, 0, 0) --in case of loading
        inst:ListenForEvent("death", function()
            inst.components.debuff:Stop()
        end, target)

        target:PushEvent("foodbuffattached", { buff = "ANNOUNCE_ATTACH_BUFF_" .. string.upper(name), priority = priority })
        if onattachedfn ~= nil then
            onattachedfn(inst, target)
        end
    end

    local function OnExtended(inst, target)
        inst.components.timer:StopTimer("buffover")
        inst.components.timer:StartTimer("buffover", duration)

        target:PushEvent("foodbuffattached", { buff = "ANNOUNCE_ATTACH_BUFF_" .. string.upper(name), priority = priority }) --wisecracker.lua listens for 'foodbuffattached' event
        if onextendedfn ~= nil then
            onextendedfn(inst, target)
        end
    end

    local function OnDetached(inst, target)
        if ondetachedfn ~= nil then
            ondetachedfn(inst, target)
        end

        target:PushEvent("foodbuffattached", { buff = "ANNOUNCE_DETACH_BUFF_" .. string.upper(name), priority = priority })
        inst:Remove()
    end

    local function fn()
        local inst = CreateEntity()

        if not TheWorld.ismastersim then
            --Not meant for client!
            inst:DoTaskInTime(0, inst.Remove)
            return inst
        end

        inst.entity:AddTransform()

        --[[Non-networked entity]]
        --inst.entity:SetCanSleep(false)
        inst.entity:Hide()
        inst.persists = false

        inst:AddTag("CLASSIFIED")

        inst:AddComponent("debuff")
        inst.components.debuff:SetAttachedFn(OnAttached)
        inst.components.debuff:SetDetachedFn(OnDetached)
        inst.components.debuff:SetExtendedFn(OnExtended)
        inst.components.debuff.keepondespawn = true

        inst:AddComponent("timer")
        inst.components.timer:StartTimer("buffover", duration)
        inst:ListenForEvent("timerdone", OnTimerDone)

        return inst
    end

    return Prefab("buff_" .. name, fn, nil, prefabs)
end

--MakeBuff(name, onattachedfn, onextendedfn, ondetachedfn, duration, priority, prefabs)
return MakeBuff("tape_invis", invistape_attach, nil, invistape_detach, TUNING.TAPE_INVIS.DURATION, 2),
    MakeBuff("tape_broadcast", broadcasttape_attach, nil, broadcasttape_detach, TUNING.TAPE_BROADCAST.DURATION, 1,
        {"electrichitsparks", "globalmapicon", "balloonparty_confetti_balloon" }),
    MakeBuff("tape_scanner", scannertape_attach, nil, scannertape_detach, TUNING.TAPE_SCANNER.DURATION, 1),
    MakeBuff("tape_slowmo", slowmotape_attach, nil, slowmotape_detach, TUNING.TAPE_SLOWMO.DURATION, 1),
    MakeBuff("tape_nightvis", nightvistape_attach, nil, nightvistape_detach, TUNING.TAPE_NIGHTVIS.DURATION, 1),
    MakeBuff("tape_sysrestore", sysrestoretape_attach, nil, sysrestoretape_detach, TUNING.TAPE_SYSRESTORE.DURATION, 1),
    MakeBuff("tape_hypercast", hypercasttape_attach, nil, hypercasttape_detach, TUNING.TAPE_HYPERCAST.DURATION, 1,
        {"electrichitsparks", "globalmapicon", "balloonparty_confetti_balloon" }),
    MakeBuff("tape_electric", electrictape_attach, nil, electrictape_detach, TUNING.TAPE_ELECTRIC.DURATION, 1,
        {"electrichitsparks"}),
    MakeBuff("tape_pig", pigtape_attach, nil, pigtape_detach, TUNING.TAPE_PIG.DURATION, 1),
    MakeBuff("tape_lightning", lightningtape_attach, nil, lightningtape_detach, TUNING.TAPE_LIGHTNING.DURATION, 1),
    MakeBuff("tape_portal", portaltape_attach, nil, portaltape_detach, TUNING.TAPE_PORTAL.DURATION, 1),
    MakeBuff("tape_invis_upgraded", invistape_upgraded_attach, nil, invistape_upgraded_detach, TUNING.TAPE_INVIS_UPGRADED.DURATION, 1),
    MakeBuff("tape_lightning_upgraded", lightningtape_upgraded_attach, nil, lightningtape_upgraded_detach, TUNING.TAPE_LIGHTNING_UPGRADED.DURATION, 1)
--MakeBuff("follower_thehorde", follower_thehorde_attach, nil, follower_thehorde_detach, TUNING.TAPE_BAND.FOLLOWBUFF.DURATION, 1))
--createmachine("")
