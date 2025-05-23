require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS

local tapejunk_disassemble = Class(function(self, inst)
    self.inst = inst
end)

local function SpawnSpookyEffects(owner, skill, x, y, z)
    if skill == "SHADOW" then
        local spook = SpawnPrefab("sanity_lower")
        spook.Transform:SetPosition(x, y, z)

        if owner.SoundEmitter ~= nil then
            owner.SoundEmitter:PlaySound("tvheadguy/skilltree/shadowfind")
        end
    end
    if skill == "LUNAR" then
        local smallguard = SpawnPrefab("gestalt_alterguardian_projectile")
        smallguard:RemoveComponent("combat") --ensure it can't damage player
        smallguard.Transform:SetPosition(x, y, z)
        if smallguard._attack_task ~= nil then
            smallguard._attack_task:Cancel()
            smallguard._attack_task = nil
        end
        smallguard.AnimState:PlayAnimation("mutate")
        smallguard.Physics:SetMotorVelOverride(0, 0, 0) --math.random(0, 2), 0, math.random(0, 2)
        --smallguard:SetTargetPosition(x+math.random(1, 2), y, z+math.random(1, 2))

        if owner.SoundEmitter ~= nil then
            owner.SoundEmitter:PlaySound("tvheadguy/skilltree/lunarfind")
        end
    end
end

local function SpawnRareSkillLoot(owner, receiver, skill, level)
    local x, y, z = owner.Transform:GetWorldPosition()

    --this is what i get for wanting to put things in tuning
    local DROPS = skill.."DROPS_"..level.."_LOOT"
    local CHANCE = skill.."DROPS_"..level.."_CHANCE"
    local JUNK = skill.."DROPS_JUNK"
    local JUNKCHANCE = skill.."DROPS_JUNK_CHANCE"
    local OLDDROPS = skill.."DROPS_1_LOOT"
    local OLDCHANCE = skill.."DROPS_1_CHANCE"
    local table = TUNING.TVSKILLTREE[DROPS]
    local jtable = TUNING.TVSKILLTREE[JUNK]
    local tableold
    if level == 2 then --even if player has level 2 skill, we still want to spawn level 1 skill's drops
        tableold = TUNING.TVSKILLTREE[OLDDROPS]
    end

    SpawnSpookyEffects(owner, skill, x, y, z)

    if level == 1 then
        --spawn level 1 loot
        --TheNet:SystemMessage("Spawning Level 1 Loot", false)
        if math.random() < TUNING.TVSKILLTREE[CHANCE] then
            local rand = math.random(1, #table)
            for k, v in pairs(table) do
                if k == rand then
                    local loot = SpawnPrefab(v)
                    loot.Transform:SetPosition(x, y, z)
                    Launch(loot, owner, TUNING.LAUNCH_SPEED_SMALL-1)
                end
            end
        end
    else --level 2
        --spawn level 2 loot IF rifts are active
        --TheNet:SystemMessage("Spawning Level 2 Loot", false)
        if TheWorld.components.riftspawner.lunar_rifts_enabled and skill == "LUNAR" then
            --TheNet:SystemMessage("Lunar rifts are active, and lunar skill is active", false)
            if math.random() < TUNING.TVSKILLTREE[CHANCE] then
                local rand = math.random(1, #table)
                for k, v in pairs(table) do
                    if k == rand then
                        local loot = SpawnPrefab(v)
                        loot.Transform:SetPosition(x, y, z)
                        Launch(loot, owner, TUNING.LAUNCH_SPEED_SMALL-1)
                    end
                end
            end
        end
        if TheWorld.components.riftspawner.shadow_rifts_enabled and skill == "SHADOW" then
            --TheNet:SystemMessage("Shadow rifts are active, and shadow skill is active", false)
            if math.random() < TUNING.TVSKILLTREE[CHANCE] then
                local rand = math.random(1, #table)
                for k, v in pairs(table) do
                    if k == rand then
                        local loot = SpawnPrefab(v)
                        loot.Transform:SetPosition(x, y, z)
                        Launch(loot, owner, TUNING.LAUNCH_SPEED_SMALL-1)
                    end
                end
            end
        end

        --spawn level 1 loot too
        if tableold ~= nil then
            if math.random() < (TUNING.TVSKILLTREE[OLDCHANCE]) + TUNING.TVSKILLTREE.LEVEL1BONUS then --with bonus in case rifts aren't active
                --TheNet:SystemMessage("Now, spawning tier 1 loot as well with "..(TUNING.TVSKILLTREE[OLDCHANCE]) + TUNING.TVSKILLTREE.LEVEL1BONUS.." chance.", false)
                local rand = math.random(1, #tableold)
                for k, v in pairs(tableold) do
                    if k == rand then
                        local loot = SpawnPrefab(v)
                        loot.Transform:SetPosition(x, y, z)
                        Launch(loot, owner, TUNING.LAUNCH_SPEED_SMALL-1)
                    end
                end
            end
        end
    end

    if math.random() < TUNING.TVSKILLTREE[JUNKCHANCE] then
        local rand = math.random(1, #jtable)
        for k, v in pairs(jtable) do
            if k == rand then
                local loot = SpawnPrefab(v)
                loot.Transform:SetPosition(x, y, z)
                Launch(loot, owner, TUNING.LAUNCH_SPEED_SMALL-1)
            end
        end
    end

end

local function DoTapeAttack(doer)
    --shadow
    if doer:HasTag("tvheadguy_affinity_shadow_tapeexplode") then
        doer.components.sanity:DoDelta(-TUNING.SANITY_TINY/2)

        local x, y, z = doer.Transform:GetWorldPosition()
        if not doer:HasTag("tvheadguy_affinity_shadow_materials2") then --avoid doubling up effects
            SpawnSpookyEffects(doer, "SHADOW", x, y, z)
        end
        local ents = TheSim:FindEntities(x, y, z, TUNING.TVSKILLTREE.SHADOWTAPEEXPLODE_RADIUS)

        SpawnPrefab("tapeexplode_shadow_fx").Transform:SetPosition(x, y, z)

        local delay = 0

        for k, victim in pairs(ents) do
            if victim.components.combat ~= nil
                and (victim.components.health ~= nil and not victim.components.health:IsDead())
                and (victim.components.inventory == nil or not victim.components.inventory:IsInsulated())
                and not (victim:HasTag("player"))
                and not (victim:HasTag("noauradamage"))
                and not (victim:HasTag("bird"))
                and not (victim:HasTag("prey"))
                and not (victim:HasTag("companion"))
                then
                victim:DoTaskInTime(delay, function()
                    delay = delay + 0.1

                    if victim:HasTag("shadowcreature") and doer.components.sanity:GetPercent() > TUNING.SANITY_BECOME_INSANE_THRESH then
                        return
                    end

                    victim.components.combat:GetAttacked(doer, 0, nil, nil, {planar = TUNING.TVSKILLTREE.SHADOWTAPEEXPLODE_PLANAR_DAMAGE}) --planar damage because planar entities are immune to damage vuln
                    victim.components.combat.externaldamagetakenmultipliers:SetModifier(doer, TUNING.TVSKILLTREE.SHADOWTAPEEXPLODE_VULNERABILITY)

                    local vx, vy, vz = victim.Transform:GetWorldPosition()
                    SpawnPrefab("shadow_merm_smacked_poof_fx").Transform:SetPosition(vx, vy, vz)
                    victim.fx = SpawnPrefab("shadow_pillar_base_fx") --.Transform:SetPosition(vx, vy, vz)
                    victim.fx.entity:SetParent(victim.entity)
                    if victim.AnimState ~= nil then
                        victim.AnimState:SetMultColour(0.25, 0.25, 0.25, 0.9)
                    end

                    victim:DoTaskInTime(TUNING.TVSKILLTREE.SHADOWTAPEEXPLODE_DURATION, function()
                        victim.components.combat.externaldamagetakenmultipliers:RemoveModifier(doer)
                        if victim.AnimState ~= nil then
                            victim.AnimState:SetMultColour(1, 1, 1, 1)
                        end
                    end)

                    victim.fx:DoTaskInTime(TUNING.TVSKILLTREE.SHADOWTAPEEXPLODE_DURATION, function()
                        --victim.fx:Remove()
                        ErodeAway(victim.fx)
                    end)

                    victim:ListenForEvent("death", function() if victim.fx ~= nil then ErodeAway(victim.fx) end end)
                end)
            end
        end

    --lunar
    elseif doer:HasTag("tvheadguy_affinity_lunar_tapeexplode") then
        local x, y, z = doer.Transform:GetWorldPosition()
        if not doer:HasTag("tvheadguy_affinity_lunar_materials2") then
            SpawnSpookyEffects(doer, "LUNAR", x, y, z)
        end
        local ents = TheSim:FindEntities(x, y, z, TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_RADIUS)

        SpawnPrefab("tapeexplode_lunar_fx").Transform:SetPosition(x, y, z)
        SpawnPrefab("tapeexplode_goopcloud_fx").Transform:SetPosition(x, y, z)

        for k, victim in pairs(ents) do
            if victim ~= doer and
                (TheNet:GetPVPEnabled() or not victim:HasTag("player")) and
                not (victim.components.freezable ~= nil and victim.components.freezable:IsFrozen()) and
                not (victim.components.pinnable ~= nil and victim.components.pinnable:IsStuck()) and
                not (victim.components.fossilizable ~= nil and victim.components.fossilizable:IsFossilized()) then
                    local mount = victim.components.rider ~= nil and victim.components.rider:GetMount() or nil
                    if mount ~= nil then
                        mount:PushEvent("ridersleep", { sleepiness = TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPPOTENCY, sleeptime = TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPTIME })
                    end
                    if victim.components.sleeper ~= nil then
                        victim.components.sleeper:AddSleepiness(TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPPOTENCY, TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPTIME )
                        SpawnPrefab("lunarrift_crystal_spawn_fx").Transform:SetPosition(victim.Transform:GetWorldPosition())
                        if victim.components.combat then
                            victim.components.combat.target = nil
                        end
                    elseif victim.components.grogginess ~= nil then
                        victim.components.grogginess:AddGrogginess(TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPPOTENCY, TUNING.TVSKILLTREE.LUNARTAPEEXPLODE_SLEEPTIME )
                        SpawnPrefab("lunarrift_crystal_spawn_fx").Transform:SetPosition(victim.Transform:GetWorldPosition())
                        if victim.components.combat then
                            victim.components.combat.target = nil
                        end
                    else
                        victim:PushEvent("knockedout")
                        --SpawnPrefab("lunarrift_crystal_spawn_fx").Transform:SetPosition(victim.Transform:GetWorldPosition())
                    end

            end
        end
    end
end

function tapejunk_disassemble:Disassemble(invobject, doer)
    --doer.AnimState:PushAnimation("pocketwatch_atk", false)

    local owner = invobject.components.inventoryitem:GetGrandOwner()
    local receiver = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local stacksize = invobject.components.stackable ~= nil and invobject.components.stackable:StackSize() or 1

    for i = 1, stacksize do
        local loots = invobject.components.lootdropper:GenerateLoot()
        invobject:Remove() --remove before generating loot to ensure there's space

        --TheNet:SystemMessage(tostring(loots[1]), false)

	    for k, v in pairs(loots) do
            --TheNet:SystemMessage("for loop reached!", false)
	    	    local loot = SpawnPrefab(v)
	    	    if loot ~= nil and receiver ~= nil then
                    --TheNet:SystemMessage(tostring(loot), false)
                    if owner.components.inventory ~= nil then
	    	    	    receiver:GiveItem(loot, nil, doer:GetPosition())
                    else
                        local x, y, z = doer.Transform:GetWorldPosition()
                        loot.Transform:SetPosition(x, y, z)
                        Launch(loot, doer, TUNING.LAUNCH_SPEED_SMALL-1)
                    end
	    	    end
	    end

        --Skilltree
        local skill
        local level
        if doer:HasTag("tvheadguy_affinity_shadow_materials1") then
            skill = "SHADOW"
            level = 1
        end
        if doer:HasTag("tvheadguy_affinity_shadow_materials2") then
            skill = "SHADOW"
            level = 2
        end
        if doer:HasTag("tvheadguy_affinity_lunar_materials1") then
            skill = "LUNAR"
            level = 1
        end
        if doer:HasTag("tvheadguy_affinity_lunar_materials2") then
            skill = "LUNAR"
            level = 2
        end
        if level ~= nil then
            SpawnRareSkillLoot(doer, receiver, skill, level)
        end
        DoTapeAttack(doer)

	    SpawnPrefab("fx_tapebreak").Transform:SetPosition(doer.Transform:GetWorldPosition())
    end
end


--AddComponentAction(actiontype, component, fn, modname)

return tapejunk_disassemble