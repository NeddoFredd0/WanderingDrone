local Itchmeter = Class(function(self, inst)
    self.inst = inst

    if TheWorld.ismastersim then
        self.classified = inst.player_classified
    elseif self.classified == nil and inst.player_classified ~= nil then
        self:AttachClassified(inst.player_classified)
    end
end)

--------------------------------------------------------------------------

function Itchmeter:OnRemoveFromEntity()
    if self.classified ~= nil then
        if TheWorld.ismastersim then
            self.classified = nil
        else
            self.inst:RemoveEventCallback("onremove", self.ondetachclassified, self.classified)
            self:DetachClassified()
        end
    end
end

Itchmeter.OnRemoveEntity = Itchmeter.OnRemoveFromEntity

function Itchmeter:AttachClassified(classified)
    self.classified = classified
    self.ondetachclassified = function() self:DetachClassified() end
    self.inst:ListenForEvent("onremove", self.ondetachclassified, classified)
end

function Itchmeter:DetachClassified()
    self.classified = nil
    self.ondetachclassified = nil
end

--credit to Rosalina mod for classified bypass
local function Set(netvar, value)
	netvar:set(value)
end

function Itchmeter:SetCurrent(current)
    Set(self.inst["currentitchmeter"], current)
    --if self.classified ~= nil then
    --    self.classified:SetValue("currentitchmeter", current)
    --end
end

function Itchmeter:SetMax(max)
    Set(self.inst["maxitchmeter"], max)
    --if self.classified ~= nil then
    --    self.classified:SetValue("maxitchmeter", max)
    --end
end

function Itchmeter:GetMax()
    if self.inst.components.itchmeter ~= nil then
        return self.inst.components.itchmeter:GetMax()
    else-- if self.classified ~= nil then
        return self.inst["maxitchmeter"]:value()
    --else
    --    return 100
    end
end

function Itchmeter:GetPercent()
    if self.inst.components.itchmeter ~= nil then
        return self.inst.components.itchmeter:GetPercent()
    else --if self.classified ~= nil then
        return self.inst["currentitchmeter"]:value() / self.inst["maxitchmeter"]:value()
    --else
    --    return 1
    end
end

function Itchmeter:GetCurrent()
    if self.inst.components.itchmeter ~= nil then
        --TheNet:SystemMessage("Replica Component Attempt: "..tostring(self.inst.components.itchmeter:GetCurrent()), false)
        --print("Replica Component Attempt: "..tostring(self.inst.components.itchmeter:GetCurrent()))
        return self.inst.components.itchmeter:GetCurrent()
    else --if self.classified ~= nil then
        return self.inst["currentitchmeter"]:value()
    --else
    --    return 100
    end
end

function Itchmeter:IsDraining()
    if self.inst.components.itchmeter ~= nil then
        return self.inst.components.itchmeter:IsDraining()
    else
        return self.inst ~= nil and self.inst["currentitchmeter"]:value()
    end
end

function Itchmeter:IsEmpty()
    if self.inst.components.itchmeter ~= nil then
        return self.inst.components.itchmeter:IsEmpty()
    else
        return self.inst ~= nil and self.inst["currentitchmeter"]:value() <= 0
    end
end

return Itchmeter

-------------------------------------------------------------------------- old code

--function Itchmeter:SetCurrent(current)
--    if self.classified ~= nil then
--        self.classified:SetValue("currentitchmeter", current)
--    end
--end
--
--function Itchmeter:SetMax(max)
--    if self.classified ~= nil then
--        self.classified:SetValue("maxitchmeter", max)
--    end
--end
--
--function Itchmeter:Max()
--    if self.inst.components.itchmeter ~= nil then
--        return self.inst.components.itchmeter.max
--    elseif self.classified ~= nil then
--        return self.classified.maxitchmeter:value()
--    else
--        return 100
--    end
--end
--
--function Itchmeter:GetPercent()
--    if self.inst.components.itchmeter ~= nil then
--        return self.inst.components.itchmeter:GetPercent()
--    elseif self.classified ~= nil then
--        return self.classified.currentitchmeter:value() / self.classified.maxitchmeter:value()
--    else
--        return 1
--    end
--end
--
--function Itchmeter:GetCurrent()
--    if self.inst.components.itchmeter ~= nil then
--        return self.inst.components.itchmeter.current
--    elseif self.classified ~= nil then
--        return self.classified.currentitchmeter:value()
--    else
--        return 100
--    end
--end
--
--
--function Itchmeter:IsDraining()
--    if self.inst.components.itchmeter ~= nil then
--        return self.inst.components.itchmeter:IsDraining()
--    else
--        return self.classified ~= nil and self.classified.currentitchmeter:value() <= 0
--    end
--end