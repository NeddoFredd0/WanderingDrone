require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS
--require("prefabs/tapebuffs")

local tapeconsume = Class(function(self, inst)
    -- 480 = total day time
    self.inst = inst
    self.itchvalue = 10
    self.itchrestore = 30/480
    self.tickrate = 2
    self.buff = false
    self._usedtape = nil
end)

local tapelimbo = nil
--local currentbuff = nil
local currentflicker

function tapeconsume:OnSave()
    return
    {
        usedtape = self:GetCurrentTape(),
    }
end

function tapeconsume:OnLoad(data)
    if data ~= nil then
        tapelimbo = data.usedtape or nil
        if data.usedtape ~= nil then
            
        end
    end
end

function tapeconsume:GetCurrentTape()
    if tapelimbo ~= nil then
        return tapelimbo
    end
end

function tapeconsume:GetTempDoer()
    if self.tempdoer ~= nil then
        return self.tempdoer
    end
end

--function tapeconsume:OnTick(invobject, doer, val)
--    if doer.components.itchmeter ~= nil and doer.components.health ~= nil and not doer.components.health:IsDead() and not doer:HasTag("playerghost") then
--        doer.components.itchmeter:DoDelta(val)
--    end
--end

--function tapeconsume:ReapplyFullTape(invobject, doer)
--    if doer:HasTag("tapefull") then
--        return
--    else
--        doer:AddTag("tapefull")
--    end
--end

local function AddTvFlicker(doer)
    doer.entity:AddLight()
    doer.Light:Enable(true)

    local function flicker1() --generic blue light
        doer.Light:SetRadius(1)
        doer.Light:SetFalloff(1)
        doer.Light:SetIntensity(0.9)
        doer.Light:SetColour(156/255,240/255,240/255) --very light blue
    end

    local function flicker2() --white flicker
        if currentflicker ~= nil then
            currentflicker:Cancel()
        end
        currentflicker = doer:DoPeriodicTask(0.2, function()
            doer.Light:SetRadius(0.7)
            doer.Light:SetFalloff(0.9)
            doer.Light:SetIntensity(0.9)
            doer.Light:SetColour(238/255,249/255,249/255) --bluish white
            doer:DoTaskInTime(0.1, function()
                doer.Light:SetRadius(0.1)
                doer.Light:SetFalloff(0.1)
                doer.Light:SetIntensity(0.9)
                doer.Light:SetColour(238/255,249/255,249/255)
            end)
        end)
    end

    local function flicker3() --slow warm flicker
        if currentflicker ~= nil then
            currentflicker:Cancel()
        end
        currentflicker = doer:DoPeriodicTask(1, function()
            doer.Light:SetRadius(0.6)
            doer.Light:SetFalloff(0.9)
            doer.Light:SetIntensity(0.9)
            doer.Light:SetColour(255/255,204/255,51/255) --orange
            doer:DoTaskInTime(0.3, function()
                doer.Light:SetRadius(0.45)
                doer.Light:SetFalloff(0.9)
                doer.Light:SetIntensity(0.9)
                doer.Light:SetColour(246/255,214/255,108/255) --yellowey orange
            end)
            doer:DoTaskInTime(0.6, function()
                doer.Light:SetRadius(0.1)
                doer.Light:SetFalloff(0.1)
                doer.Light:SetIntensity(0.9)
                doer.Light:SetColour(246/255,225/255,90/255) --yellow
            end)
        end)
    end

    local function flicker4()
        doer.Light:SetRadius(0.3)
        doer.Light:SetFalloff(1.1)
        doer.Light:SetIntensity(0.9)
        doer.Light:SetColour(250/255,180/255,50/255)
    end

    local function flicker5()
        doer.Light:SetRadius(0.7)
        doer.Light:SetFalloff(1.5)
        doer.Light:SetIntensity(0.9)
        doer.Light:SetColour(250/255,180/255,50/255)
    end

    local t = {flicker1, flicker2, flicker3, flicker4, flicker5}

    flicker1()
    doer:DoPeriodicTask(4, function()
    local rand = math.random(1, #t)
    t[rand]()
    end)

    doer.Light:SetRadius(2)
    doer.Light:SetFalloff(1.5)
    doer.Light:SetIntensity(.5)
    doer.Light:SetColour(250/255,180/255,50/255)
end

local function RemoveTvFlicker(doer)
    doer.Light:Enable(false)
end

local function AddTvBloomAndGlow(doer)
    doer.AnimState:SetSymbolLightOverride("face", 0.5)
	doer.AnimState:SetSymbolBloom("face")
end

local function RemoveTvBloomAndGlow(doer)
    doer.AnimState:SetSymbolLightOverride("face", 0)
    doer.AnimState:ClearSymbolBloom("face")
end

local function ItchHeal(doer)
    --credit to rosalina mod for this method of the badge events (normally hidden in game engine)
    if doer.components.itchmeter ~= nil then
        doer:AddTag("itch_heal")
        doer:DoTaskInTime(0.1, function(eater) eater:RemoveTag("itch_heal") end)
    end
end

local function ItchDamage(doer)
    --credit to rosalina mod for this method of the badge events (normally hidden in game engine)
    if doer.components.itchmeter ~= nil then
        doer:AddTag("itch_hurt")
        doer:DoTaskInTime(0.1, function(eater) eater:RemoveTag("itch_hurt") end)
    end
end

local function ReturnTapeAction(invobject, doer, eject)
    if eject ~= nil and eject == true then
        doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapefinished")
    else
        doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapefinished")
    end

    doer.SoundEmitter:KillSound("tapeloop")
    doer:DoTaskInTime(0, function() doer.SoundEmitter:KillSound("tapeloop") end)
    doer:DoTaskInTime(1, function() doer.SoundEmitter:KillSound("tapeloop") end)
    doer.SoundEmitter:KillSound("tapewindup")

    local usedtape
    if tapelimbo ~= nil then
        usedtape = SpawnSaveRecord(tapelimbo) --TODO: figure out why this is returning nil --because storing tables in a class is funky apparently
    end
    if tapelimbo ~= nil then
        if eject ~= nil and eject == true then
            usedtape.Transform:SetPosition(doer.Transform:GetWorldPosition())
            Launch(usedtape, doer, TUNING.LAUNCH_SPEED_SMALL-2)
        else
            doer.components.inventory:GiveItem(usedtape, nil, doer:GetPosition())
        end
        tapelimbo = nil
    end
    if usedtape ~= nil then
        if doer.components.skilltreeupdater ~= nil and doer.components.skilltreeupdater:IsActivated("tvheadguy_storage_2") and TheWorld.components.tapestorageregistry ~= nil then
            if TheWorld.components.tapestorageregistry == nil then
                print("DEBUG: no tape storage registry")
            end
            local num = TheWorld.components.tapestorageregistry:GetNumOfTapeStorages()
            if num >= 1 and math.random() < TUNING.TVSKILLTREE.ARCHIVE_FREEUSE_CHANCE then

                --local x, y, z = doer.Transform:GetWorldPosition()
                doer.fx = SpawnPrefab("fx_freetapeuse") --.Transform:SetPosition(x, y, z)
                --doer.SoundEmitter:PlaySound("wilson_rework/ui/unlock_gatedskill") --TODO: custom sound?
                doer.SoundEmitter:PlaySound("tvheadguy/skilltree/freetape")
                doer.fx.entity:AddFollower()
                doer.fx.Follower:FollowSymbol(doer.GUID, "", 0, -500, 0)

                --target.fx = SpawnPrefab("fx_sysrestoregear")
                --target.SoundEmitter:PlaySound("tvheadguy/tv_tape/tape_sysrestore_repair")
                --target.fx.entity:AddFollower()
                --target.fx.Follower:FollowSymbol(target.GUID, "headbase", 0, 25, 0)

                if eject ~= nil and eject == true then --eject stuff, if applicable
                    ItchDamage(doer)
                    doer:RemoveDebuff("buff_"..usedtape.prefab)
                end
                return
            end
        end
        if eject ~= true then --normal tape finish
            if usedtape.components.finiteuses:GetUses() == 1 then
                TapeFinished(usedtape, doer)
            else
                usedtape.components.finiteuses:Use()
            end
        elseif eject ~= nil and eject == true then --tape finish when ejecting
            if usedtape.components.finiteuses:GetUses() <= 2 then
                TapeFinished(usedtape, doer)
            else
                usedtape.components.finiteuses:Use()
                usedtape.components.finiteuses:Use()
            end
            ItchDamage(doer)
            doer:RemoveDebuff("buff_"..usedtape.prefab)
        end
    end
end

function tapeconsume:ReturnTape(invobject, doer, eject)
    --this is split into 2 fns because of event listener shenanigans (removing event callback requires function input, can't call a function inside itself)
    --print("DEBUG: invobject: "..invobject.prefab)
    --print("DEBUG: doer: "..doer.prefab)

    doer:RemoveTag("taperegenbig")
    doer:RemoveTag("taperegensmall")
    doer:RemoveTag("tapedegensmall")
    self.buff = false
    doer.components.itchmeter:StopRegen() --stop restoration

    ReturnTapeAction(invobject, doer, eject)

    RemoveTvFlicker(doer)
    RemoveTvBloomAndGlow(doer)

    doer:RemoveEventCallback("tvejectattempt", ReturnTapeAction)

    doer.components.tapefinder:RemoveTape(doer)
end

function tapeconsume:Consume(invobject, doer)
    doer.SoundEmitter:KillSound("eating")

    if doer.components.tapefinder:CheckHasTapeInserted() == false then --or doer:HasTag("tapefull")
        if not doer:HasTag("tvheadguy_storage_3") and invobject.prefab == "tape_portal" or
            not doer.components.skilltreeupdater:IsActivated("tvheadguy_affinity_shadow_tapeupgrade") and invobject.prefab == "tape_invis_upgraded" or
            not doer.components.skilltreeupdater:IsActivated("tvheadguy_affinity_lunar_tapeupgrade") and invobject.prefab == "tape_lightning_upgraded" then
            --ensure players without tape craft skills cannot use the respective tape
            doer.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_NOTAPESKILL)
            doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapefinished")
            return
        end

        if doer.components.tapefinder ~= nil then
            doer.components.tapefinder:SetTapeData(invobject)
        end

        --THE ISSUE IS THAT ON LOAD ITS NOT LISTENING FOR THIS EVENT!
        doer:ListenForEvent("tvejectattempt", function() self:ReturnTape(invobject, doer, true) end)
        if invobject:IsValid() then
            tapelimbo = invobject:GetSaveRecord()
            invobject:Remove()
        end
        doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapeinsert")
        AddTvBloomAndGlow(doer)
        if TUNING.TVFLICKERCONFIG == true then
            AddTvFlicker(doer)
        end
        local skinname = doer.components.skinner.skin_name
        if skinname == "tvheadguy_none" or skinname == nil then
            doer.AnimState:OverrideSymbol("face", "face_loading", "face")
        else
            doer.AnimState:OverrideSymbol("face", "face_loading_"..skinname, "face")
        end
        doer:DoTaskInTime(2, function()
            doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapeloop_pre", "tapewindup")
            doer:DoTaskInTime(3, function() doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapeloop_LP", "tapeloop") end)
            self.buff = true
            --self:EnableItchRegen(true, invobject, doer)

            --skilltree override
            local temprestore
            if self.itchrestore < 0 then --only tapes that *cost* itch over time
                if doer:HasTag("tvheadguy_efficientcombat_1") then
                    temprestore = self.itchrestore * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_1_MULT
                    doer.components.itchmeter:StartRegen(temprestore, self.tickrate, true) --amount, period, interruptcurrentregen
                elseif doer:HasTag("tvheadguy_efficientcombat_2") then
                    temprestore = self.itchrestore * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_2_MULT
                    doer.components.itchmeter:StartRegen(temprestore, self.tickrate, true)
                elseif doer:HasTag("tvheadguy_efficientcombat_3") then
                    temprestore = self.itchrestore * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_3_MULT
                    doer.components.itchmeter:StartRegen(temprestore, self.tickrate, true)
                else
                    temprestore = self.itchrestore * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_DEFAULT_MULT
                    doer.components.itchmeter:StartRegen(temprestore, self.tickrate, true)
                end
            else
                doer.components.itchmeter:StartRegen(self.itchrestore, self.tickrate, true)
            end

            local tempvalue
            if self.itchvalue < 0 then --only tapes that *cost* itch
                if doer:HasTag("tvheadguy_efficientcombat_1") then
                    tempvalue = self.itchvalue * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_1_MULT
                    doer.components.itchmeter:DoDelta(tempvalue)
                elseif doer:HasTag("tvheadguy_efficientcombat_2") then
                    tempvalue = self.itchvalue * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_2_MULT
                    doer.components.itchmeter:DoDelta(tempvalue)
                elseif doer:HasTag("tvheadguy_efficientcombat_3") then
                    tempvalue = self.itchvalue * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_3_MULT
                    doer.components.itchmeter:DoDelta(tempvalue)
                else
                    tempvalue = self.itchvalue * TUNING.TVSKILLTREE.EFFICIENTCOMBAT_DEFAULT_MULT
                    doer.components.itchmeter:DoDelta(tempvalue)
                end
            else
                doer.components.itchmeter:DoDelta(self.itchvalue)
            end
            --doer.components.itchmeter:StartRegen(self.itchrestore, self.tickrate, true)
            --doer.components.itchmeter:DoDelta(self.itchvalue)


            if doer ~= nil then
                doer:AddDebuff("buff_"..invobject.prefab, "buff_"..invobject.prefab)
            end
            --tagging for regen arrows on meter
            if invobject.prefab == "tape_broadcast" or invobject.prefab == "tape_hypercast" then
                doer:AddTag("taperegenbig")
                ItchHeal(doer)
            elseif invobject.prefab == "tape_invis" or invobject.prefab == "tape_invis_upgraded" or invobject.prefab == "tape_lightning_upgraded" then
                doer:AddTag("tapedegensmall")
                ItchDamage(doer)
            elseif invobject.prefab == "tape_electric" or invobject.prefab == "tape_lightning" or invobject.prefab == "tape_slowmo" or invobject.prefab == "tape_pig" then
                doer:RemoveTag("taperegensmall")
                ItchDamage(doer)
            else
                doer:AddTag("taperegensmall")
                ItchHeal(doer)
            end
            doer.components.tapefinder:InsertTape(doer)

            --achievement stuff
            if doer.achievement_abilitiescount ~= nil then
                for k, v in pairs(doer.achievement_abilitiespre) do
                    if v == tostring(invobject.prefab) and v ~= doer.achievement_abilitiesused[k] then
                        doer.achievement_abilitiescount = doer.achievement_abilitiescount + 1
                        --print("test "..doer.achievement_abilitiescount)
                        doer.achievement_abilitiesused[k] = v
                    end
                end
                for k, v in pairs(doer.achievement_abilitiesused) do
                    --print("#"..k.." = "..v)
                end
                if CLIENT_MOD_RPC["ModdedSkins"] and doer.achievement_abilitiescount >= TUNING.TVACHIEVEMENTS.ABILITIESUSED then
                    SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), doer.userid, "ms_tvheadguy_rose")
                end
            end
        end)
    else
        doer.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_TAPEFULL)
        doer.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapefinished")
        return
    end
end

function TapeFinished(invobject, doer)
    local owner = invobject.components.inventoryitem:GetGrandOwner()
    local receiver = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local stacksize = invobject.components.stackable ~= nil and invobject.components.stackable:StackSize() or 1
    for i = 1, stacksize do
        --local loots = invobject.components.lootdropper:GenerateLoot() --GenerateLoot also adds recipe loot, doesn't seem there's a way to avoid this aside from making this shitty loot function
        local loots = {}
        --if 0.5 < math.random() then
        --    table.insert(loots, "tapebits_busted")
        --end
        if 0.33 < math.random() then
            table.insert(loots, "tapebits_busted")
        end
        --if 0.01 < math.random() then
        --    table.insert(loots, "trinket_06") --frazzled wires
        --end
        invobject:Remove() --remove before generating loot to ensure there's space
	    for k, v in pairs(loots) do
            --TheNet:SystemMessage("for loop reached!", false)
	    	    local loot = SpawnPrefab(v)
	    	    if loot ~= nil and receiver ~= nil then
                    --TheNet:SystemMessage(tostring(loot), false)
	    	    	receiver:GiveItem(loot, nil, doer:GetPosition())
	    	    end
	    end
	    SpawnPrefab("fx_tapebreak").Transform:SetPosition(doer.Transform:GetWorldPosition())
    end
end

return tapeconsume