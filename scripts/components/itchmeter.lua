
local SourceModifierList = require("util/sourcemodifierlist")
require "math"

local function SetReplicaMaxItch(self, maxitchmeter)
    self.inst.replica.itchmeter:SetMax(maxitchmeter)
end

local function SetReplicaCurrentItch(self, currentitchmeter)
    self.inst.replica.itchmeter:SetCurrent(currentitchmeter)
end

local function OnTaskTick(inst, self, period)
    self:DoDec(period)
end

local Itchmeter = Class(function(self, inst)
    self.inst = inst
    self.ouchy = false
    self.maxitchmeter = TUNING.TVHEADGUY.ITCHMETERMAX
    self.currentitchmeter = 100
    self.initialspawn = true

    self.itchmeterrate = TUNING.TVHEADGUY.ITCHMETERDECAY
    self.hurtrate = TUNING.TVHEADGUY.ITCHMETERKILLRATE
    self.overridedrainfn = nil

    --self.upgradelevel = 0

    self.burning = true
    --100% burn rate. Currently used only by belt of hunger, will have to change unequip if use in something else
    self.burnrate = 1 -- DEPRECATED, please use burnratemodifiers instead
    self.burnratemodifiers = SourceModifierList(self.inst)

    --self.regen = {}
    self.regendata = nil

    local period = 1
    self.inst:DoPeriodicTask(period, OnTaskTick, nil, self, period)
end,
nil,
{
    maxitchmeter = SetReplicaMaxItch,
    currentitchmeter = SetReplicaCurrentItch,
})

--function Itchmeter:OnSave()
--    return self.currentitchmeter ~= self.maxitchmeter and { itchmeter = self.currentitchmeter } or nil
--end

function Itchmeter:OnSave()
    return
    {
        --self.currentitchmeter ~= self.maxitchmeter and {itchmeter = self.currentitchmeter} or nil,
        _currentitchmeter = self.currentitchmeter,
        _regen = self.regendata,
        --_upgradelevel = self.upgradelevel,
    }
end

function Itchmeter:OnLoad(data)
    --if data.itchmeter ~= nil and self.currentitchmeter ~= data.itchmeter then

    --if data._upgradelevel ~= nil then
    --    print("DEBUG: loading upgrade level")
    --    if data._upgradelevel == 1 then
    --        self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_1)
    --        print("DEBUG: upgrade level set to 1")
    --    elseif data._upgradelevel == 2 then
    --        self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_2)
    --        print("DEBUG: upgrade level set to 2")
    --    elseif data._upgradelevel == 3 then
    --        self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_3)
    --        print("DEBUG: upgrade level set to 3")
    --    end
    --    --if self.inst:HasTag("tvheadguy_biggermeter_1") then
    --    --    self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_1)
    --    --elseif self.inst:HasTag("tvheadguy_biggermeter_2") then
    --    --    self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_2)
    --    --elseif self.inst:HasTag("tvheadguy_biggermeter_3") then
    --    --    self:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_3)
    --    --end
    --    self.upgradelevel = data._upgradelevel
    --end
    if data._currentitchmeter ~= nil then
        --self:SetItch(data._currentitchmeter)
        ----self:DoDelta(0)
        --SetReplicaCurrentItch(self, data._currentitchmeter)
        self.inst:DoTaskInTime(1, function() --possible race condition with skilltree
            self:SetItch(data._currentitchmeter)
            ----self:DoDelta(0)
            SetReplicaCurrentItch(self, data._currentitchmeter)
        end)
    end
    if data._regen ~= nil then
        self:StartRegen(data._regen[1], data._regen[2], data._regen[3])
        --print("DEBUG: "..data._regen[1])
        --print("DEBUG: "..data._regen[2])
        if data._regen[1] > 99/480 then --total_day_time 
            self.inst:AddTag("taperegenbig")
        elseif data._regen[1] > 0 then
            self.inst:AddTag("taperegensmall")
        elseif data._regen[1] == 0 then
            self.inst:RemoveTag("taperegensmall")
        elseif data._regen[1] < 0 then
            self.inst:AddTag("tapedegensmall")
        end
    end
end

function Itchmeter:SetOverrideDrainFn(fn)
    self.overridedrainfn = fn
end

function Itchmeter:LongUpdate(dt)
    self:DoDec(dt, true)
end

function Itchmeter:Pause()
    self.burning = false
end

function Itchmeter:Resume()
    self.burning = true
end

function Itchmeter:IsPaused()
    return self.burning
end

function Itchmeter:GetDebugString()
    return string.format("%2.2f / %2.2f, rate: (%2.2f * %2.2f)", self.currentitchmeter, self.maxitchmeter, self.itchmeterrate, self.burnrate*self.burnratemodifiers:Get())
end

function Itchmeter:SetMax(amount)
    SetReplicaMaxItch(self, amount)
    self.maxitchmeter = amount
    --self.currentitchmeter = amount
end

function Itchmeter:IsDraining()
    return self.currentitchmeter <= 0
end

function Itchmeter:IsEmpty()
    return self.current <= 0
end

function Itchmeter:SetItch(amount)
    if amount <= self:GetMax() then
        self.currentitchmeter = amount
        local val = self.currentitchmeter
        SetReplicaCurrentItch(self, val)
    else
        self.currentitchmeter = self.maxitchmeter
        SetReplicaCurrentItch(self, self.maxitchmeter)
    end
end

function Itchmeter:DoDelta(delta, overtime, ignore_invincible)
    if self.redirect ~= nil then
        self.redirect(self.inst, delta, overtime)
        return
    end

    if not ignore_invincible and self.inst.components.health.invincible == true or self.inst.is_teleporting == true then
        return
    end

    delta = tonumber(delta) --for some fucking reason delta is a table???????? huh????????????
    local old = self.currentitchmeter
    self.currentitchmeter = math.clamp(self.currentitchmeter + delta, 0, self.maxitchmeter)

    self.inst:PushEvent("itchmeterdelta", { oldpercent = old / self.maxitchmeter, newpercent = self.currentitchmeter / self.maxitchmeter, overtime = overtime, delta = self.currentitchmeter-old })

    --might as well reuse starving events, since it's not like the character can starve
    if old > 0 then
        if self.currentitchmeter <= 0 then
            self.inst:PushEvent("startstarving")
            ProfileStatsSet("started_starving", true)
            self.inst.components.tapefinder:StartPunishing(self.inst)
        end
    elseif self.currentitchmeter > 0 then
        self.inst.components.tapefinder:StopPunishing(self.inst)
        self.inst:PushEvent("stopstarving")
        ProfileStatsSet("stopped_starving", true)
    end

    local val = self.currentitchmeter
    SetReplicaCurrentItch(self, val)
end

function Itchmeter:GetPercent()
    return self.currentitchmeter / self.maxitchmeter
end

function Itchmeter:GetMax()
    return self.maxitchmeter
end

function Itchmeter:GetCurrent()
    --TheNet:SystemMessage("Component Attempt: "..tostring(self.currentitchmeter), false)
    --print("Component Attempt: "..tostring(self.currentitchmeter))
    return self.currentitchmeter
end

function Itchmeter:SetPercent(p, overtime)
    local old = self.currentitchmeter
    self.currentitchmeter  = p * self.maxitchmeter
    self.inst:PushEvent("itchmeterdelta", { oldpercent = old / self.maxitchmeter, newpercent = p, overtime = overtime })

    --push starving event if beaverness value isn't currently starving
    if old > 0 then
        if self.currentitchmeter <= 0 then
            self.inst:PushEvent("startstarving")
            ProfileStatsSet("started_starving", true)
        end
    elseif self.currentitchmeter > 0 then
        self.inst:PushEvent("stopstarving")
        ProfileStatsSet("stopped_starving", true)
    end
end

--local function DoRegen(inst, self)
--    if not self.components.health:IsDead() then
--        self:DoDelta(self.regen.amount, true)
--    end
--end

function Itchmeter:StopRegen(amulet)
    if self.regen ~= nil then
        if self.regen.task ~= nil then
            self.regen.task:Cancel()
            self.regen.task = nil
        end
        self.regen = nil
        self.regendata = nil
    end
end

function Itchmeter:StartRegen(amount, period, interruptcurrentregen, amulet)
    if interruptcurrentregen ~= false then
        self:StopRegen()
    end

    self.regendata = {amount, period, interruptcurrentregen}

    if self.regen == nil then
        self.regen = {}
    end
    self.regen.amount = amount
    self.regen.period = period

    if self.regen.task == nil then
        self.regen.task = self.inst:DoPeriodicTask(self.regen.period, (function() self:DoDelta(self.regen.amount, true) end), nil, self)
    end
end

function Itchmeter:DoDec(dt, ignore_damage)
    --local old = self.currentitchmeter

    if self.burning then
        if self.currentitchmeter > 0 then
            self.inst.components.tapefinder:StopPunishing(self.inst)
            self:DoDelta(-self.itchmeterrate * dt)
            --local xd = self.currentitchmeter - 
            --SetReplicaCurrentItch(self, xd)
        elseif not ignore_damage then
            if self.overridedrainfn ~= nil then
                self.overridedrainfn(self.inst, dt)
            else
                --self.inst.components.health:DoDelta(-self.hurtrate, true, "itchmeter")
                    --self.inst:PushEvent("attacked", {attacker = self.inst, damage = TUNING.TVHEADGUY.PUNISHMENTAMT})
                    --print("test: low itch reached")
                --if self.inst.components.tapefinder:CheckIfPunishing() ~= nil then
                --    self.inst.components.tapefinder:StartPunishing(self.inst)
                --end
                --self.inst.components.grogginess:AddGrogginess(10/480, 2) --TUNING.TVHEADGUY.WIMPDURATION
            end
        end
    end
end

function Itchmeter:SetKillRate(rate)
    self.hurtrate = rate
end

function Itchmeter:SetRate(rate)
    self.itchmeterrate = rate
end

return Itchmeter
