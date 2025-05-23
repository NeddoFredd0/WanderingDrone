require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS

--class attached to players, in order to keep track of player-related stuff
local TapeFinder = Class(function(self, inst)
    self.inst = inst
    self.pitychance = 0
    self.tapeinserted = false
    self.punishstatus = false
    self.punishtask = nil
    self.invobject = nil
end)

function TapeFinder:InsertTape(target)
    self.tapeinserted = true
    target:AddTag("tapefinder_tapeinserted")
end

function TapeFinder:RemoveTape(target)
    self.tapeinserted = false
    target:RemoveTag("tapefinder_tapeinserted")
end

function TapeFinder:CheckHasTapeInserted()
    if self.tapeinserted ~= nil then
        return self.tapeinserted
    end
end

local function DoPunish(target)
    --target:PushEvent("attacked", {attacker = target, damage = TUNING.TVHEADGUY.PUNISHMENTAMT})
    target.components.talker:Say(STRINGS.CHARACTERS.TVHEADGUY.ANNOUNCE_ITCHMETEREMPTY)
    target.components.combat:GetAttacked(nil, 30) --TODO: Find a way to not make this say 'darkness' as the source
end

function TapeFinder:AttachPunishTask(target)
    self.punishtask = target:DoPeriodicTask(TUNING.TVHEADGUY.PUNISHMENTINTERVAL, function()
        DoPunish(target)
    end)
end

function TapeFinder:GetPunishingData(target)
    if self.punishtask ~= nil then
        return true
    else
        return false
    end
end

function TapeFinder:CheckIfPunishing(target)
    if self.punishtask ~= nil then
        return true
    end
end

function TapeFinder:StartPunishing(target)
    if target == nil then
        target = self.inst
    end
    target:DoTaskInTime(1, function() DoPunish(target) end) --punish once immediately, but wait until 'meter empty' dialogue has finished
    self:AttachPunishTask(target)
end

function TapeFinder:StopPunishing(target)
    if target == nil then
        target = self.inst
    end
    if self.punishtask ~= nil then
        self.punishtask:Cancel()
    end
end

function TapeFinder:IncreasePity(doer)
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
            --print("DEBUG: shadowfind 2, and doer is enlightened")
            self.pitychance = self.pitychance + (0.01 + TUNING.TVSKILLTREE.SHADOWFIND_2_PITY)
        else
            self.pitychance = self.pitychance + 0.01
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_shadow_find1") then
        if insane == true then
            --print("DEBUG: shadowfind 1, and doer is enlightened")
            self.pitychance = self.pitychance + (0.01 + TUNING.TVSKILLTREE.SHADOWFIND_1_PITY)
        else
            self.pitychance = self.pitychance + 0.01
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find2") then
        if enlightened == true then
            --print("DEBUG: lunarfind 2, and doer is enlightened")
            self.pitychance = self.pitychance + (0.01 + TUNING.TVSKILLTREE.LUNARFIND_2_PITY)
        else
            self.pitychance = self.pitychance + 0.01
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find1") then
        if enlightened == true then
            --print("DEBUG: lunarfind 1, and doer is enlightened")
            self.pitychance = self.pitychance + (0.01 + TUNING.TVSKILLTREE.LUNARFIND_1_PITY)
        else
            self.pitychance = self.pitychance + 0.01
        end
    else
        self.pitychance = self.pitychance + 0.01
    end

    --TheNet:SystemMessage("pity chance = "..self.pitychance, false)
end

function TapeFinder:IncreasePitySmall(doer)
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
            self.pitychance = self.pitychance + (0.0012 + TUNING.TVSKILLTREE.SHADOWFIND_2_PITYSMALL)
        else
            self.pitychance = self.pitychance + 0.0012
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_shadow_find1") then
        if insane == true then
            self.pitychance = self.pitychance + (0.0012 + TUNING.TVSKILLTREE.SHADOWFIND_1_PITYSMALL)
        else
            self.pitychance = self.pitychance + 0.0012
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find2") then
        if enlightened == true then
            self.pitychance = self.pitychance + (0.0012 + TUNING.TVSKILLTREE.LUNARFIND_2_PITYSMALL)
        else
            self.pitychance = self.pitychance + 0.0012
        end
    elseif doer ~= nil and doer:HasTag("tvheadguy_affinity_lunar_find1") then
        if enlightened == true then
            self.pitychance = self.pitychance + (0.0012 + TUNING.TVSKILLTREE.LUNARFIND_1_PITYSMALL)
        else
            self.pitychance = self.pitychance + 0.0012
        end
    else
        self.pitychance = self.pitychance + 0.0012
    end

    --TheNet:SystemMessage("pity chance = "..self.pitychance, false)
end


function TapeFinder:ResetPity(doer)
    self.pitychance = 0
end

function TapeFinder:GetPity(pity)
    return self.pitychance
end

function TapeFinder:SetPity(val)
    self.pitychance = val
end

function TapeFinder:SetTapeData(invobject)
    self.invobject = invobject
end

function TapeFinder:GetTapeData()
    return self.invobject
end

--function TapeFinder:RestoreEventListeners(invobject)
--    if invobject.components.tapeconsume ~= nil then
--        print("DEBUG: tapeconsume component valid. attempting to reapply Eject listener")
--        self.inst:ListenForEvent("tvejectattempt", function() invobject.components.tapeconsume:ReturnTape(invobject, self.inst, true) end)
--    end
--end

function TapeFinder:OnSave()
    return
    {
        _pity = self:GetPity(),
        _tapeinserted = self:CheckHasTapeInserted(),
        _punishstatus = self:GetPunishingData(),
        --_invobject = self:GetTapeData(),
    }
end

function TapeFinder:OnLoad(data)
    if data ~= nil then
        self.pitychance = data._pity or 0
        self.tapeinserted = data._tapeinserted or false
        self.invobject = data._invobject or nil
        --if data._tapeinserted == true then --TODO: uncomment this when I figure out how to actually fix this stupid bug!
        --    self:InsertTape(self.inst) --for now we don't want to have the eject prompt appear on save/load when it doesn't work so we leave this commented
        --end
        if data._punishstatus == true then
            self:AttachPunishTask(self.inst)
        end
        --if data._invobject ~= nil then
        --    print("DEBUG: invobject prefab: "..data._invobject.prefab)
        --    self:RestoreEventListeners(data._invobject)
        --end
    end
end

return TapeFinder