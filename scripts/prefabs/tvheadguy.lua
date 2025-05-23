local MakePlayerCharacter = require "prefabs/player_common"
local tape_spawn_common = require("prefabs/tape_spawn_common")
local itchbadge = require("widgets/itchbadge")
if not TheNet:GetServerGameMode() == "" then
    local tapebuffs = require("prefabs/tapebuffs")
end

local assets = {

        Asset( "SCRIPT", "scripts/prefabs/skilltree_tvheadguy.lua"),
		Asset( "SCRIPT", "scripts/prefabs/tape_spawn_common.lua"),
        Asset( "SCRIPT", "scripts/prefabs/tapebuffs.lua"),
		Asset( "SCRIPT", "scripts/prefabs/player_common.lua"),
        --Asset( "SCRIPT", "scripts/prefabs/fxcooltvhead.lua"),
        Asset( "SCRIPT", "scripts/prefabs/tvheadguy_skins.lua"),
        Asset( "SCRIPT", "scripts/components/tapejunk_disassemble.lua"),
        Asset( "SCRIPT", "scripts/components/tapeconsume.lua"),
        Asset( "SCRIPT", "scripts/components/tapefinder.lua"),
        Asset( "SCRIPT", "scripts/components/tveject.lua"),
        Asset( "SCRIPT", "scripts/components/tapebits_smash.lua"),
        Asset( "SCRIPT", "scripts/components/tape_furnituredecor.lua"),
        Asset( "SCRIPT", "scripts/components/tapestorageregistry.lua"),
        Asset( "SCRIPT", "scripts/widgets/itchbadge.lua"),
        Asset( "SCRIPT", "scripts/brains/tape_pig_pigelitefighterbrain.lua"),
        Asset( "SCRIPT", "scripts/brains/remoteportalbrain.lua"),
        Asset( "SCRIPT", "scripts/brains/clonedronebrain.lua"),
        Asset( "SCRIPT", "scripts/stategraphs/SGremoteportal.lua"),
        Asset( "SCRIPT", "scripts/stategraphs/SGclonedrone.lua"),
        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "MINIMAP_IMAGE", "images/map_icons/tvheadguy" ),
        Asset( "MINIMAP_IMAGE", "images/map_icons/tapestorage" ),
        Asset( "ANIM", "anim/itchmeter.zip"),
        Asset( "ANIM", "anim/ui_tapestorage_4x5.zip" ),
        Asset( "ANIM", "anim/tape_lunar_fx.zip"),

        --skins
        Asset( "ANIM", "anim/tvheadguy.zip" ),
        Asset( "ANIM", "anim/ms_tvheadguy_pirate.zip" ),
        Asset( "ANIM", "anim/ms_tvheadguy_rose.zip" ),
        Asset( "ANIM", "anim/ms_tvheadguy_triumphant.zip" ),
        Asset( "ANIM", "anim/ghost_tvheadguy_build.zip" ),

        --unskinned faces
        Asset( "ANIM", "anim/face_loading.zip" ),
        Asset( "ANIM", "anim/face_broadcast.zip" ),
        Asset( "ANIM", "anim/face_scanner.zip" ),
        Asset( "ANIM", "anim/face_slowmo.zip" ),
        Asset( "ANIM", "anim/face_nightvis.zip" ),
        Asset( "ANIM", "anim/face_sysrestore.zip" ),
        Asset( "ANIM", "anim/face_hypercast.zip" ),
        Asset( "ANIM", "anim/face_electric.zip" ),
        Asset( "ANIM", "anim/face_pig.zip" ),
        Asset( "ANIM", "anim/face_lightning.zip" ),
        Asset( "ANIM", "anim/face_lightning_upgraded.zip" ),
        Asset( "ANIM", "anim/face_portal.zip" ),

        --rose faces
        Asset( "ANIM", "anim/face_loading_ms_tvheadguy_rose.zip" ),
        Asset( "ANIM", "anim/face_tapeplay_ms_tvheadguy_rose.zip" ),

        --triumph faces
        Asset( "ANIM", "anim/face_loading_ms_tvheadguy_triumphant.zip" ),
        Asset( "ANIM", "anim/face_tapeplay_ms_tvheadguy_triumphant.zip" ),

        --pirate faces
        Asset( "ANIM", "anim/face_loading_ms_tvheadguy_pirate.zip" ),
        Asset( "ANIM", "anim/face_tapeplay_ms_tvheadguy_pirate.zip" ),

}

--local prefabs = {
--	"tape1",
--    "tape2",
--    "tape3",
--    "tape4",
--}

-- Custom starting items
--local start_inv = {
--	"tape1",
--}

local start_inv = {"tape1"}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.TVHEADGUY
end

local prefabs = FlattenTree(start_inv, true)

if not TheNet:GetServerGameMode() == "" then
    TUNING.TVHEADGUY.HEALTH = 100
    TUNING.TVHEADGUY.HUNGER = 100
    TUNING.TVHEADGUY.SANITY = 150
end

--this is the hackiest way to do random voice lines but it works
--and if it ain't broke...

local function RandomWimpyString(inst)
    if math.random() < 0.33 then
        local stringtable = {STRINGS.CHARACTERS.TVHEADGUY.WIMPYSTRING1, STRINGS.CHARACTERS.TVHEADGUY.WIMPYSTRING2, STRINGS.CHARACTERS.TVHEADGUY.WIMPYSTRING3, STRINGS.CHARACTERS.TVHEADGUY.WIMPYSTRING4, STRINGS.CHARACTERS.TVHEADGUY.WIMPYSTRING5}
        local rand = math.random(1, #stringtable)
        for k, v in pairs(stringtable) do
            if k == rand then
                inst.components.talker:Say(v)
            end
        end
    end
end

local function RandomWimpyFailString(inst)
    if math.random() < 0.33 then
        local stringtable = {STRINGS.CHARACTERS.TVHEADGUY.WIMPYFAIL1, STRINGS.CHARACTERS.TVHEADGUY.WIMPYFAIL2, STRINGS.CHARACTERS.TVHEADGUY.WIMPYFAIL3, STRINGS.CHARACTERS.TVHEADGUY.WIMPYFAIL4, STRINGS.CHARACTERS.TVHEADGUY.WIMPYFAIL5}
        local rand = math.random(1, #stringtable)
        for k, v in pairs(stringtable) do
            if k == rand then
                inst.components.talker:Say(v)
            end
        end
    end
end

local function RandomTapeFindString(doer)
    local stringtable = {STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE1, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE2, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE3, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE4, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE5, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE6, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE7, STRINGS.CHARACTERS.TVHEADGUY.FOUNDTAPE8}
    local rand = math.random(1, #stringtable)
    for k, v in pairs(stringtable) do
        if k == rand then
            doer.components.talker:Say(v)
        end
    end
end

local function WimpDamageRecieved(inst) --player
    if inst:HasTag("tv_wimpyimmune") then
        RandomWimpyFailString(inst)
    else
        --inst.components.grogginess:AddGrogginess(TUNING.TVHEADGUY.WIMPDURATION, 2) --about 4 seconds, although it stacks
        RandomWimpyString(inst)

        inst:AddTag("groggy")
        if inst.components.locomotor ~= nil then
            inst.components.locomotor:SetExternalSpeedMultiplier(inst, "grogginess", TUNING.MAX_GROGGY_SPEED_MOD)
        end
        inst:DoTaskInTime(TUNING.TVHEADGUY.WIMPDURATION, function()
            inst:RemoveTag("groggy")
            inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "grogginess")
        end)
    end
end

local function OnTemperatureDamage(inst)
    --inst.components.grogginess:AddGrogginess(TUNING.TVHEADGUY.WIMPDURATION, 2)
    inst:AddTag("groggy")
    if inst.components.locomotor ~= nil then
        inst.components.locomotor:SetExternalSpeedMultiplier(inst, "grogginess", TUNING.MAX_GROGGY_SPEED_MOD)
    end
end

local function StopTemperatureDamage(inst)
    --inst.components.grogginess:AddGrogginess(TUNING.TVHEADGUY.WIMPDURATION, 2)
    inst:RemoveTag("groggy")
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "grogginess")
end

local function TapeAnnounce(doer)
    RandomTapeFindString(doer)
end

local function IsValidVictim(victim)
    return tape_spawn_common.HasTape(victim)
end

local function OnRestoreTape(victim)
    victim.notapetask = nil
end

local function SpawnSpook(doer, victim, faction, x, y, z)
    local amt = math.random(2, 3)

    local theta0 = math.random() * 2 * PI
    local dtheta = 2 * PI / amt
    local thetavar = dtheta / 10
    local theta, radius
    for i = 1, amt do
        theta = GetRandomWithVariance(theta0 + dtheta * i, thetavar)
        radius = 1.6 + math.random() * .4
        if faction == "shadow" then
            local spook = SpawnPrefab("sanity_lower")
            spook.Transform:SetPosition(x + math.cos(theta) * radius, y, z - math.sin(theta) * radius)

            doer.SoundEmitter:PlaySound("tvheadguy/skilltree/shadowfind")
        elseif faction == "lunar" then
            local smallguard = SpawnPrefab("gestalt_alterguardian_projectile")
            smallguard:RemoveComponent("combat") --ensure it can't damage player
            smallguard.Transform:SetPosition(x + math.cos(theta) * radius, y, z - math.sin(theta) * radius)
            if smallguard._attack_task ~= nil then
                smallguard._attack_task:Cancel()
                smallguard._attack_task = nil
            end
            smallguard.AnimState:PlayAnimation("mutate")
            smallguard.Physics:SetMotorVelOverride(0, 0, 0) --math.random(0, 2), 0, math.random(0, 2)

            doer.SoundEmitter:PlaySound("tvheadguy/skilltree/lunarfind")
        end
    end
end

local function SpawnTapeAt(x, y, z, jackpotcount, doer)
    --achievement stuff
    if doer.achievement_tapesfound then
        doer.achievement_tapesfound = doer.achievement_tapesfound + 1

        --print("TAPESFOUND: "..doer.achievement_tapesfound)

            if CLIENT_MOD_RPC["ModdedSkins"] and doer.achievement_tapesfound >= TUNING.TVACHIEVEMENTS.TAPESFOUND then
                SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), doer.userid, "ms_tvheadguy_triumphant")
            end
    end

    if jackpotcount > 0 then
        local gx = SpawnPrefab("fx_tapefind")
        gx.Transform:SetPosition(x, y, z)
        local fx = SpawnPrefab("tapecache")
        fx.Transform:SetPosition(x, y + 1, z)
    else
        local tapetable = {"tape1", "tape2", "tape3", "tape4",}
        local sx = tapetable[math.random(4)]
        local gx = SpawnPrefab("fx_tapefind")
        gx.Transform:SetPosition(x, y, z)
        --ShakeAllCameras(CAMERASHAKE.FULL, .25, .03, .25, victim, 6)
        --victim.SoundEmitter:PlaySound("dontstarve_DLC002/common/loot_reveal")
        --victim ~= nil,
        --victim, 6)))

        local fx = SpawnPrefab(sx)
        fx.Transform:SetPosition(x, y + 1, z) --y+1 so item falls with physics, makes it look a bit more natural
        if doer ~= nil then
            Launch(fx, doer, TUNING.LAUNCH_SPEED_SMALL-2) --yeet that tape so controller players can actually pick it up (because controller UX sucks mega arse)
        end

        --if TheInput:ControllerAttached() then
        --    print("DEBUG: controller attached")
            --Launch
        --end
    end
end

local function SpawnTapesAt(pickable, jackpot, numtapes, victim, x, y, z)
    local doer = FindClosestPlayerInRange(x, y, z, TUNING.TVHEADGUY.TAPEFINDRANGE, true)
    if doer ~= nil then
        local jackpotcount = 0
        if jackpot == true then
            jackpotcount = TUNING.TAPEDROPRATES.JACKPOTRARELOOTCOUNT

            --achievement
            if victim.prefab == "sunkenchest" and doer.achievement_sunkenchest then
                doer.achievement_sunkenchest = doer.achievement_sunkenchest + 1
                --local nearbytvheads = TheSim:FindEntities(x, y, z, 30, "tapemaker") --give this achievement to all nearby tvheads 
                --for k, v in pairs(nearbytvheads) do
                --print("nearbytvheads = "..v)
                if CLIENT_MOD_RPC["ModdedSkins"] and doer.achievement_sunkenchest >= TUNING.TVACHIEVEMENTS.SUNKENCHESTS then
                    SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), nil, "ms_tvheadguy_pirate")
                    --inst.achievement_sunkenchest = true
                end
                --end
            end
        end
        if numtapes > 0 then
            doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapefind")
            if doer:HasTag("tapemaker") then
                TapeAnnounce(doer)
            end
            ShakeAllCameras(CAMERASHAKE.FULL, 0.25 * numtapes, 0.03, (numtapes * 0.1) + 0.5, doer, (2 * numtapes)*0.5 )

            --Skilltree
            local insane = false
            local enlightened = false
            if doer.components.sanity:IsInsane() then
                insane = true
            end
            if doer.components.sanity:IsEnlightened() then
                enlightened = true
            end

            if doer ~= nil and doer:HasTag("tvheadguy_affinity_shadow_find2") then
                if insane == true then
                    --print("DEBUG: shadowfind 2, and doer is insane")
                    if math.random() < TUNING.TVSKILLTREE.SHADOWFIND_2_EXTRATAPECHANCE then
                        numtapes = numtapes + 1
                        SpawnSpook(doer, victim, "shadow", x, y, z)
                    end
                end
            elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_shadow_find1") then
                if insane == true then
                    --print("DEBUG: shadowfind 1, and doer is insane")
                    if math.random() < TUNING.TVSKILLTREE.SHADOWFIND_1_EXTRATAPECHANCE then
                        numtapes = numtapes + 1
                        SpawnSpook(doer, victim, "shadow", x, y, z)
                    end
                end
            elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find2") then
                if enlightened == true then
                    --print("DEBUG: lunarfind 2, and doer is enlightened")
                    if math.random() < TUNING.TVSKILLTREE.LUANRFIND_2_EXTRATAPECHANCE then
                        numtapes = numtapes + 1
                        SpawnSpook(doer, victim, "lunar", x, y, z)
                    end
                end
            elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find1") then
                if enlightened == true then
                    --print("DEBUG: lunarfind 1, and doer is enlightened")
                    if math.random() < TUNING.TVSKILLTREE.LUNARFIND_1_EXTRATAPECHANCE then
                        numtapes = numtapes + 1
                        SpawnSpook(doer, victim, "lunar", x, y, z)
                    end
                end
            end
        else
            if doer ~= nil and doer.components.tapefinder ~= nil then
                if pickable == true then
                    doer.components.tapefinder:IncreasePitySmall(doer)
                else
                    doer.components.tapefinder:IncreasePity(doer)
                end
            end
        end
        if numtapes == 2 then
            local theta = math.random() * 2 * PI
            local radius = .4 + math.random() * .1
            SpawnTapeAt(x + math.cos(theta) * radius, 0, z - math.sin(theta) * radius, jackpotcount, doer)
            jackpotcount = jackpotcount - 1
            theta = GetRandomWithVariance(theta + PI, PI / 15)
            SpawnTapeAt(x + math.cos(theta) * radius, 0, z - math.sin(theta) * radius, jackpotcount, doer)
            jackpotcount = jackpotcount - 1
        elseif numtapes > 1 then
                --numtapes = numtapes - 1
                local theta0 = math.random() * 2 * PI
                local dtheta = 2 * PI / numtapes
                local thetavar = dtheta / 10
                local theta, radius
                for i = 1, numtapes do
                    theta = GetRandomWithVariance(theta0 + dtheta * i, thetavar)
                    radius = 1.6 + math.random() * .4
                    SpawnTapeAt(x + math.cos(theta) * radius, 0, z - math.sin(theta) * radius, jackpotcount, doer)
                    jackpotcount = jackpotcount - 1
                end
        elseif numtapes == 1 then
            SpawnTapeAt(x, y, z, jackpotcount, doer)
            jackpotcount = jackpotcount - 1
        end
    end
end

local function OnEntityDropLoot(inst, data)
    --print("data: "..tostring(data))
    --for k, v in pairs(data) do print("data: key = "..k.." value = "..tostring(data[v])) end

    local victim
    local action
    if data.inst ~= nil then
        victim = data.inst
    elseif data.target ~= nil then
        victim = data.target
    elseif data.object ~= nil then
        victim = data.object
    end
    if data ~= nil then
        if data.action ~= nil then
            action = data.action
        end
    end

    local x, y, z
    local distancecheck = false
    if victim ~= nil then
        x, y, z = victim.Transform:GetWorldPosition()
        if (inst:GetDistanceSqToPoint(x, y, z) < TUNING.TVHEADGUY.TAPEFINDRANGE * TUNING.TVHEADGUY.TAPEFINDRANGE) == true then
            distancecheck = true
        end
    end
    --if distancecheck == true then
    --    SpawnTapesAt(false, false, 1, victim, x, y, z)
    --end

    if victim ~= nil and victim.notapetask == nil and IsValidVictim(victim) and distancecheck == true and tape_spawn_common.DropRateCheck(victim) then
        --TheNet:SystemMessage("DEBUG: WE DID IT REDDIT")
        victim.notapetask = victim:DoTaskInTime(5, function() OnRestoreTape(victim) end)
        local pickable = false
        if victim.components.pickable ~= nil and victim.components.pickable:CanBePicked() then
            pickable = true
        end
        local jackpot = false
        if victim:HasTag("taperarelootdropper") then
            jackpot = true
        end
        if action ~= nil and action == ACTIONS.DIG and pickable == true then --want to prevent repeatedly digging saplings for tapes
            return
        end
        SpawnTapesAt(pickable, jackpot, tape_spawn_common.DropRateCheck(victim), victim, x, y, z)
    end
    --print("DEBUG: victim: "..tostring(victim))
    --if victim ~= nil and
    --    victim.notapetask == nil and
    --    --victim:IsValid() and
    --    (   victim == inst or
    --        (   --not inst.components.health:IsDead() and
    --            IsValidVictim(victim) and
    --            distancecheck == true and
    --            tape_spawn_common.DropRateCheck(victim) --numtapes
    --        )
    --    ) then
    --    TheNet:SystemMessage("DEBUG: TEST 4")
    --    --V2C: prevents multiple Wortoxes in range from spawning multiple tapes per corpse
    --    victim.notapetask = victim:DoTaskInTime(5, function() OnRestoreTape() end)
    --    local pickable = false
    --    if victim.components.pickable ~= nil and victim.components.pickable:CanBePicked() then
    --        pickable = true
    --    end
    --    local jackpot = false
    --    if victim:HasTag("taperarelootdropper") then
    --        jackpot = true
    --    end
    --    if action ~= nil and action == ACTIONS.DIG and pickable == true then --want to prevent repeatedly digging saplings for tapes
    --        return
    --    end
    --    SpawnTapesAt(pickable, jackpot, tape_spawn_common.DropRateCheck(victim), victim, x, y, z)
    --end
end

local function RefreshCorrectFace(inst, data)
    if data ~= nil then
        local sus = data[1]
        if sus ~= nil and sus.prefab == "voidclothhat" then
            inst.AnimState:Hide("HEAD")
			inst.AnimState:Show("HEAD_HAT")
			inst.AnimState:OverrideSkinSymbol("swap_face", inst.prefab, "swap_face_eye_glow_glasses")
			inst.AnimState:OverrideSkinSymbol("face", inst.prefab, "swap_face_eye_glow")
        end
    elseif inst.components.tapefinder:CheckHasTapeInserted() then
        if inst.components.skinner.skin_name ~= "tvheadguy_none" and inst.components.skinner.skin_name ~= nil then
            inst.AnimState:OverrideSymbol("face", "face_tapeplay_"..inst.components.skinner.skin_name, "face")
        else
            --if I wanted to show the correct face on load, I'd have to manually check for every possible buff. CBF
            --TODO: fix this???
            --edit: I did it and it fucking sucks but it works so whatever
            local bufftable = {inst:GetDebuff("buff_tape_invis"), inst:GetDebuff("buff_tape_broadcast"), inst:GetDebuff("buff_tape_scanner"), inst:GetDebuff("buff_tape_slowmo"), inst:GetDebuff("buff_tape_nightvis"), inst:GetDebuff("buff_tape_sysrestore"), inst:GetDebuff("buff_tape_hypercast"), inst:GetDebuff("buff_tape_electric"), inst:GetDebuff("buff_tape_pig"), inst:GetDebuff("buff_tape_lightning"), inst:GetDebuff("buff_tape_portal"), inst:GetDebuff("buff_tape_invis_upgraded"), inst:GetDebuff("buff_tape_lightning_upgraded")}
            for k, v in pairs(bufftable) do
                if k == 1 and v ~= nil then
                    inst.AnimState:ClearOverrideSymbol("face")
                elseif k == 2 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_broadcast", "face")
                elseif k == 3 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_scanner", "face")
                elseif k == 4 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_slowmo", "face")
                elseif k == 5 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_nightvis", "face")
                elseif k == 6 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_sysrestore", "face")
                elseif k == 7 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_hypercast", "face")
                elseif k == 8 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_electric", "face")
                elseif k == 9 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_pig", "face")
                elseif k == 10 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_lightning", "face")
                elseif k == 11 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_portal", "face")
                elseif k == 12 and v ~= nil then
                    inst.AnimState:ClearOverrideSymbol("face")
                elseif k == 13 and v ~= nil then
                    inst.AnimState:OverrideSymbol("face", "face_lightning_upgraded", "face")
                else
                    inst.AnimState:OverrideSymbol("face", "face_loading", "face")
                end
            end
        end
    end
end

local function ItchDrainOverride(inst, data)
    if data.item == "amulet" then
        --print("AMULET EQUIPPED")
        inst:AddTag("tapedegensmall")

        inst:AddTag("tv_amuletdrain")
        if inst:HasTag("tv_amuletdrain") then
            inst.tv_amuletdrain = inst:DoPeriodicTask(TUNING.REDAMULET_CONVERSION_TIME, function()
                if inst.components.itchmeter ~= nil then
                    inst.components.itchmeter:DoDelta(TUNING.TVHEADGUY.AMULETDRAIN)
                end
            end)
        end
    end
end

local function StopItchDrainOverride(inst, data)
    if data.item == "amulet" then
        --print("AMULET UNEQUIPPED")
        inst:RemoveTag("tapedegensmall")

        inst:RemoveTag("tv_amuletdrain")
        inst.tv_amuletdrain:Cancel()
    end
end

--local function OnEntityDeath(inst, data)
--    -- NOTES(JBK): Explosive entities do not drop loot.
--    if data.inst ~= nil and (data.explosive or not data.inst:HasTag("player")) then --data.inst.components.lootdropper == nil
--        OnEntityDropLoot(inst, data)
--    else
--        print("ERROR: data.inst returned nil")
--    end
--end

--this fix to correctly apply skill effects after loading credit:
--zhuyifei1999 on discord
local function onskillrefresh(inst)
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_biggermeter_1") then
        inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_1)
    end
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_biggermeter_2") then
        inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_2)
    end
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_biggermeter_3") then
        inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_3)
    end

    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_efficientcombat_1") then
        inst:AddTag("tvheadguy_efficientcombat_1")
    end
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_efficientcombat_2") then
        inst:RemoveTag("tvheadguy_efficientcombat_1")
        inst:AddTag("tvheadguy_efficientcombat_2")
    end
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_efficientcombat_3") then
        inst:RemoveTag("tvheadguy_efficientcombat_1")
        inst:RemoveTag("tvheadguy_efficientcombat_2")
        inst:AddTag("tvheadguy_efficientcombat_3")
    end
    if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated("tvheadguy_storage_1") then --eject
        inst:AddTag("tvheadguy_storage_1")
    end

    local taggedskills = {"tvheadguy_storage_1", "tvheadguy_storage_3", "tvheadguy_storage_4", "tvheadguy_affinity_shadow_find2", "tvheadguy_affinity_shadow_materials2", "tvheadguy_affinity_shadow_tapeexplode", "tvheadguy_affinity_lunar_find2", "tvheadguy_affinity_lunar_materials2", "tvheadguy_affinity_lunar_tapeexplode",} --intentionally skipping 2 as it doesn't have a tag
    for k, skill in pairs(taggedskills) do
        if inst.components.skilltreeupdater ~= nil and inst.components.skilltreeupdater:IsActivated(skill) then
            inst:AddTag(skill)
        end
    end

    if inst.components.skilltreeupdater ~= nil then
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_research") then
            inst:AddTag("tvheadguy_entertainment_research")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_invis") then
            inst:AddTag("tvheadguy_entertainment_invis")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_scanner") then
            inst:AddTag("tvheadguy_entertainment_scanner")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_electric") then
            inst:AddTag("tvheadguy_entertainment_electric")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_sysrestore") then
            inst:AddTag("tvheadguy_entertainment_sysrestore")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_lightning") then
            inst:AddTag("tvheadguy_entertainment_lightning")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_nightvis") then
            inst:AddTag("tvheadguy_entertainment_nightvis")
        end
        if inst.components.skilltreeupdater:IsActivated("tvheadguy_entertainment_pig") then
            inst:AddTag("tvheadguy_entertainment_pig")
        end
    end
end

-- When the character is revived from human
local function onbecamehuman(inst)
    --inst.components.container:Open(inst) --open container by default
    --tape dropping listeners
	if inst._onentitydroplootfn == nil then
        inst._onentitydroplootfn = function(src, data) OnEntityDropLoot(inst, data) end
        inst:ListenForEvent("entity_droploot", inst._onentitydroplootfn, TheWorld)
    end
    --if inst._onentitydeathfn == nil then
    --    inst._onentitydeathfn = function(src, data) OnEntityDropLoot(inst, data) end
    --    inst:ListenForEvent("entity_death", inst._onentitydeathfn, TheWorld)
    --end
    if inst._onentityfinishedworkprefabfn == nil then
        inst._onentityfinishedworkprefabfn = function(src, data) OnEntityDropLoot(inst, data) end
        inst:ListenForEvent("finishedwork", inst._onentityfinishedworkprefabfn, inst)
    end
    if inst._onentitypicksomethingfn == nil then
        inst._onentitypicksomethingfn = function(src, data) OnEntityDropLoot(inst, data) end
        inst:ListenForEvent("picksomething", inst._onentitypicksomethingfn, inst)
    end
    if inst._onentitypostinittapedropfn == nil then
        inst._onentitypostinittapedropfn = function(src, data) OnEntityDropLoot(inst, data) end
        inst:ListenForEvent("postinittapedrop", inst._onentitypostinittapedropfn, TheWorld)
    end
    --todo: figure out a way for this to work with the scythe
    --other listeners
    if inst._onwardrobefn == nil then
        inst._onwardrobefn = function(src, data) RefreshCorrectFace(inst, data) end
        inst:ListenForEvent("onskinschanged", inst._onwardrobefn, inst) --this has a 1 second delay before the correct face is applied, not much I can do about that
    end
    if inst._onequipfn == nil then
        inst._onequipfn = function(src, data) ItchDrainOverride(inst, data) end
        inst:ListenForEvent("equip", inst._onequipfn, inst)
    end
    if inst._onunequipfn == nil then
        inst._onunequipfn = function(src, data) StopItchDrainOverride(inst, data) end
        inst:ListenForEvent("unequip", inst._onunequipfn, inst)
    end

    inst:DoTaskInTime(1, onskillrefresh)
    inst:ListenForEvent("onactivateskill_server", onskillrefresh, inst)
    inst:ListenForEvent("ondeactivateskill_server", onskillrefresh, inst)
end

local function onrevive(inst)
    if inst.components.itchmeter ~= nil then
        local max = inst.components.itchmeter:GetMax()
        inst.components.itchmeter:SetItch(max * ((TUNING.TVHEADGUY.ITCHMETERDECAY * 480)/100)) --1 day's worth
    end
    onbecamehuman(inst)
end

local function onbecameghost(inst)
	--if inst._onentitydroplootfn ~= nil then
    --    inst:RemoveEventCallback("entity_droploot", inst._onentitydroplootfn, TheWorld)
    --    inst._onentitydroplootfn = nil
    --end
    --if inst._onentitydeathfn ~= nil then
    --    inst:RemoveEventCallback("entity_death", inst._onentitydeathfn, TheWorld)
    --    inst._onentitydeathfn = nil
    --end
    --inst.components.container:Close(inst) --close container on death
end

--local function ondeath(inst)
--    inst.components.tapefinder:RemoveTape()
--end

local function onsave(inst, data)
    data.hastapeinserted = inst.hastapeinserted

    data.achievement_tapesfound = inst.achievement_tapesfound
    data.achievement_abilitiescount = inst.achievement_abilitiescount
    --data.achievement_abilitiespre = inst.achievement_abilitiespre
    data.achievement_sunkenchest = inst.achievement_sunkenchest
    data.achievement_abilitiesused = inst.achievement_abilitiesused
end

local function onpreload(inst, data)
    --if data ~= nil and data.hastapeinserted == true then
    --    inst.hastapeinserted = data.hastapeinserted
    --end
end

-- When loading or spawning the character
local function onload(inst, data)
    --inst.components.container:Open(inst)
    if data ~= nil and data.hastapeinserted == true then
        inst.hastapeinserted = data.hastapeinserted
    end
    if data ~= nil and data.achievement_tapesfound ~= nil then
        inst.achievement_tapesfound = data.achievement_tapesfound
        inst.achievement_abilitiescount = data.achievement_abilitiescount
        --inst.achievement_abilitiespre = data.achievement_abilitiespre
        inst.achievement_abilitiesused = data.achievement_abilitiesused
        inst.achievement_sunkenchest = data.achievement_sunkenchest
    end
    if not inst:HasTag("playerghost") then
        onbecamehuman(inst)
	else
		onbecameghost(inst)
    end
end

local function onnewspawn(inst, data)
    --CONFIRMED, only runs once when character is first generated for the world (or despawned/respawned)
    if inst.components.itchmeter ~= nil then
        --inst.components.itchmeter:SetPercent(100, false)
        inst.components.itchmeter:SetItch(100)
    end
end

local function OnForcedNightVisionDirty(inst)
    if inst.components.playervision ~= nil then
        inst.components.playervision:ForceNightVision(inst._forced_nightvision:value())
    end
end

local MoonLightningOver = require("widgets/moonstormover_lightning")

local function UpdateMoonstormOverDirty(inst)
    print("DEBUG: netvar hook successful")
    TheNet:SystemMessage("FUCK ME!")
    --if inst.tape_moonstorm_over == true then
	--    if inst.HUD.moonlightningover == nil then
	--        inst.HUD.moonlightningover = inst.HUD.overlayroot:AddChild(MoonLightningOver(inst)) --TODO: FIND OUT WHY target.HUD IS NIL!!!!!!!!
	--        inst.HUD.moonlightningover:MoveToBack()
	--        inst.HUD.moonlightningover:Show()
    --    end
    --else
    --    if inst.HUD.moonlightningover ~= nil then
    --        inst.HUD.moonlightningover:Hide()
    --    end
    --end
    if inst.HUD.moonlightningover == nil then
        inst.HUD.moonlightningover = inst.HUD.overlayroot:AddChild(MoonLightningOver(inst)) --TODO: FIND OUT WHY target.HUD IS NIL!!!!!!!!
        inst.HUD.moonlightningover:MoveToBack()
        inst.HUD.moonlightningover:Show()
    end
end

local function AddItch(inst)
	inst["currentitchmeter"] = net_ushortint(inst.GUID, "itchmeter.currentitchmeter","tvheadguy_currentdirty")
	inst["maxitchmeter"] = net_ushortint(inst.GUID, "itchmeter.maxitchmeter","tvheadguy_currentdirty")
end

--local function PityCounter(inst)
--    inst["tapedropperpity"] = net_float(inst.GUID, "tapefinder.pitychance")
--end

--local function redirect_to_itchmeter(inst, delta, overtime, ignore_invincible)
--	return inst.components.itchmeter ~= nil and inst.components.itchmeter:DoDelta(-delta/480, overtime, ignore_invincible)
--end

local STATICVISION_COLOURCUBES =
{
    day = "images/colour_cubes/tape_vision_cc.tex",
    dusk = "images/colour_cubes/tape_vision_cc.tex",
    night = "images/colour_cubes/tape_vision_cc.tex",
    full_moon = "images/colour_cubes/tape_vision_cc.tex",
}

local GRUEIMMUNITY_INVISTAPE = "tvheadguytape_nightvis"
local function SetForcedNightVision(inst, nightvision_on)
    inst._forced_nightvision:set(nightvision_on)
    if inst.components.playervision ~= nil then
        inst.components.playervision:ForceNightVision(nightvision_on)
        --inst.components.playervision:SetCustomCCTable(STATICVISION_COLOURCUBES)
    else
        inst.components.playervision:ForceNightVision(false)
        --inst.components.playervision:SetCustomCCTable(nil)
    end

    -- The nightvision event might get consumed during save/loading,
    -- so push an extra custom immunity into the table.
    if nightvision_on then
        inst.components.grue:AddImmunity(GRUEIMMUNITY_INVISTAPE)
    else
        inst.components.grue:RemoveImmunity(GRUEIMMUNITY_INVISTAPE)
    end
end

local function OnPlayerDeactivated(inst)
    inst:RemoveEventCallback("onremove", OnPlayerDeactivated)
    if not TheNet:IsDedicated() then
        inst:RemoveEventCallback("forced_nightvision_dirty", OnForcedNightVisionDirty)
        --inst:RemoveEventCallback("net_tape_moonstorm_over_dirty", UpdateMoonstormOverDirty)
    end
    if not TheWorld.ismastersim then
        inst:RemoveEventCallback("net_tape_moonstorm_over_dirty", UpdateMoonstormOverDirty)
    end
end

local function OnPlayerActivated(inst)
    inst:ListenForEvent("onremove", OnPlayerDeactivated)
    if not TheNet:IsDedicated() then
        inst:ListenForEvent("forced_nightvision_dirty", OnForcedNightVisionDirty)
        --inst:ListenForEvent("net_tape_moonstorm_over_dirty", UpdateMoonstormOverDirty)
        OnForcedNightVisionDirty(inst)
    end
    if not TheWorld.ismastersim then
        inst:ListenForEvent("net_tape_moonstorm_over_dirty", UpdateMoonstormOverDirty)
    end
end

--local function OpenContainer(inst)
--    inst.components.container:Open(inst)
--end

--TODO: figure out a way of doing this that isn't based on the character's orientation according to server

--local function CurrentFacingUpdate(inst)
--    local facing = inst.AnimState:GetCurrentFacing()
--    print("currentfacing: "..facing)
--    if facing == 0 then
--        inst.AnimState:SetHatOffset(500, 0)
--    elseif facing == 2 then
--        inst.AnimState:SetHatOffset(500, 0)
--    end
--end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst)
    inst._forced_nightvision = net_bool(inst.GUID, "wx78.forced_nightvision", "forced_nightvision_dirty")
    --inst.tape_moonstorm_over = false
    --inst.tape_moonstorm_over = net_bool(inst.GUID, "tape_moonstorm_over", "net_tape_moonstorm_over_dirty")
    inst.tape_moonstorm_over = net_event(inst.GUID, "net_tape_moonstorm_over_dirty")
    AddItch(inst)

    --inst:ListenForEvent("locomote", function() CurrentFacingUpdate(inst) end)

    inst:ListenForEvent("playeractivated", OnPlayerActivated)
    inst:ListenForEvent("playerdeactivated", OnPlayerDeactivated)
	-- Minimap icon
    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("tvheadguy.tex")
	inst:AddTag("tapemaker")
    inst:AddTag("nightvision")
    inst:AddTag("insomniac") --todo: figure out more elegant way to nerf sleeping
    if not TheNet:IsDedicated() then
        inst.CreateHungerBadge = itchbadge
    end
    if not TheWorld.ismastersim then
        --inst.OnEntityReplicated = function(inst) 
        --    inst.replica.container:WidgetSetup("tvheadguy")
        --    inst.replica.container.skipclosesnd = true
        --    inst.replica.container.skipopensnd = true
        --    inst.replica.container.canbeopened = false --works, but keep it true for debugging
        --    inst.replica.container:Open(inst) --open container by default
        --    end --need to set up widget info for client
        return inst
    end
    --inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup(params) end
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)

	-- choose which sounds this character will play
	inst.soundsname = "tvheadguy"

	inst.components.foodaffinity:AddPrefabAffinity("sweettea", TUNING.AFFINITY_15_CALORIES_HUGE)
	--inst.hastapeinserted = false

    inst:AddComponent("tapefinder")
    if not inst.components.itchmeter then
        inst:AddComponent("itchmeter")
    end
    inst:AddComponent("tveject")
    inst.components.itchmeter:SetRate(TUNING.TVHEADGUY.ITCHMETERDECAY)
    inst.components.itchmeter:SetKillRate(TUNING.STARVE_KILL_TIME / TUNING.TVHEADGUY.HEALTH)
    inst.components.itchmeter:SetPercent(100, false)

	inst.components.hunger:SetRate(-100) --hack to ''''remove'''' the hunger meter. this method means there should be pretty much no gameplay scenario where it does anything
    --inst.components.hunger.redirect = redirect_to_itchmeter
    --inst.replica.hunger:DetachClassified()
    --inst.replica.hunger:OnRemoveFromEntity()
    --inst:RemoveComponent("hunger")

    inst.components.health:SetMaxHealth(TUNING.TVHEADGUY.HEALTH)
	inst.components.sanity:SetMax(TUNING.TVHEADGUY.SANITY)

    if inst.components.eater ~= nil then
        inst.components.eater:SetAbsorptionModifiers(TUNING.TVHEADGUY.HEALTHMULT, TUNING.TVHEADGUY.HUNGERMULT, TUNING.TVHEADGUY.SANITYMULT) --health, hunger, sanity
    end

    inst:ListenForEvent("itchmeterdelta",
    function(inst, data)
        if data.newpercent <= TUNING.TVHEADGUY.ITCHMETER_THRESH and data.oldpercent > TUNING.TVHEADGUY.ITCHMETER_THRESH then
            inst.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_ITCHMETERLOW)
        elseif data.newpercent <= 0 and data.oldpercent > 0 then
            inst.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_ITCHMETEREMPTY)
        end
    end)

    --todo: light override on face only
    --inst.AnimState:SetLightOverride(.1)
    --local screen = inst.AnimState:GetSymbol("face")

    --inst:AddComponent("container")
    --inst.components.container:WidgetSetup("tvheadguy") --tapeslots
    --inst.components.container.skipclosesnd = true
    --inst.components.container.skipopensnd = true --don't play sounds
	--inst.components.container.canbeopened = false --no Open prompt on character, container is forced to open on char spawn

	inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    inst.OnLoad = onload
    inst.OnNewSpawn = onnewspawn
	inst:ListenForEvent("ms_respawnedfromghost", onrevive)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
    --inst:ListenForEvent("death", ondeath)
    inst:ListenForEvent("attacked", WimpDamageRecieved)
    --this doesn't work for the alterguardianhat because it can be closed while equipped, but I don't think there's much I can do about that
    --inst:ListenForEvent("unequip", OpenContainer) --makes container reappear if items with their own hand_inv are unequipped
    inst:ListenForEvent("startfreezing", OnTemperatureDamage)
    inst:ListenForEvent("stopfreezing", StopTemperatureDamage)
    inst:ListenForEvent("startoverheating", OnTemperatureDamage)
    inst:ListenForEvent("stopoverheating", StopTemperatureDamage)

    inst.SetForcedNightVision = SetForcedNightVision

    --mod achievements
    inst.achievement_tapesfound = 0

    inst.achievement_abilitiescount = 0
    inst.achievement_abilitiespre = {
    "tape_invis",
    "tape_broadcast",
    "tape_hypercast",
    "tape_scanner",
    "tape_nightvis",
    "tape_sysrestore",
    "tape_electric",
    "tape_pig",
    "tape_lightning",}
    inst.achievement_abilitiesused = {
    }

    inst.achievement_sunkenchest = 0

    onbecamehuman(inst)
end

return MakePlayerCharacter("tvheadguy", prefabs, assets, common_postinit, master_postinit, start_inv)
