local Widget = require "widgets/widget"
local UIAnim = require "widgets/uianim"


-- Based on Speedometer

--local function TrySpeedometer(self)
--    if  self.owner ~= nil and
--        self.owner.player_classified ~= nil and
--        self.owner.player_classified.railcart_ison ~= nil and
--        self.owner.player_classified.railcart_ison:value() then
--        self:OpenSpeedometer()
--        return true
--    end
--    --self:OnEquipSpeedometer(nil)
--    self:CloseSpeedometer()
--    return false
--end

--base class for imagebuttons and animbuttons. 
--local HudTapeSlots = Class(Widget, function(self, owner)
--    Widget._ctor(self, "Hud Tape SLots")
--
--    self.font = NEWFONT
--    self.fontdisabled = NEWFONT
--
--	self.textcolour = {0,0,0,1}
--	self.textfocuscolour = {0,0,0,1}
--	self.textdisabledcolour = {0,0,0,1}
--    self.textselectedcolour = {0,0,0,1}
--
--    self.text = self:AddChild(Text(self.font, 40))
--	self.text:SetVAlign(ANCHOR_MIDDLE)
--    self.text:SetColour(self.textcolour)
--    self.text:Hide()
--
--    self.ShowPosition=Vector3(800,200,0)
--    self.HidePosition=Vector3(700,-250,0)
--
--	self.clickoffset = Vector3(0,-3,0)
--
--	self.selected = false
--
--	self.control = CONTROL_ACCEPT
--	self.help_message = STRINGS.UI.HELP.SELECT
--    --self.owner = owner
    --Widget._ctor(self, "Hud Tape Slots")
    --self:SetClickable(true)
--
--
    --self.bg = self:AddChild(UIAnim())
--
    --self.needle = self:AddChild(UIAnim())
    --self.needle:GetAnimState():SetBank("railcart_hud")
    --self.needle:GetAnimState():SetBuild("railcart_hud")
    --self.needle:GetAnimState():PlayAnimation("speedometer_needle", true)
    --
    --self.bg:GetAnimState():SetBank("railcart_hud")
    --self.bg:GetAnimState():SetBuild("railcart_hud")
    --self.bg:GetAnimState():PlayAnimation("speedometer_bg", true)
--
    ----self.needle:SetPosition(0, 70, 0)
    ----self.needle:Hide()
--
    --self:Hide()
    --
    --self.ShowPosition=Vector3(800,200,0)
    --self.HidePosition=Vector3(700,-250,0)
    --self.DeltaPosition=self.ShowPosition-self.HidePosition
    --
    --self:SetPosition(self.HidePosition)
    --
    --self.move_ratio=1/20.
    --self.threshold=self.DeltaPosition:Length()*1.5*self.move_ratio
    --
    --    
    --self.current_rotation=40
    --self.rotation_speed=0
    --self.update_ratio=0.1
    --self.force_ratio=0.1
    --self.damping_ratio=0.93
    --self.random_ratio=0.02
--
    --self.inst:ListenForEvent("railcart_inout", function(inst)
    --    TrySpeedometer(self)
    --end, self.owner)
--
    --self.isopen = false
    --self.wantstoclose = false
--
    --TrySpeedometer(self)
--end)
--
----------------------------------------------------------------------------
--
--function HudSpeedometer:GetSpeed()
--    if  self.owner ~= nil and
--        self.owner.player_classified ~= nil and
--        self.owner.player_classified.railcart_speed ~= nil then
--        
--        self.speed=self.owner.player_classified.railcart_speed:value()
--    else
--        self.speed=0
--    end
--    return self.speed
--end
--
--function HudSpeedometer:GetRotation()
--    self.rotation=self:GetSpeed()/36*280+40
--    return self.rotation
--end
--
--function HudSpeedometer:OpenSpeedometer()
--    self.isopen = true
--    self.inpos  = false
--    self.current_rotation=40
--    self.needle:SetRotation(self.current_rotation)
--    self:SetPosition(self.HidePosition)
--    self:Show()
--    self:StartUpdating()
--end
--
--function HudSpeedometer:CloseSpeedometer()
--    self.isopen = false
--    self.inpos  = false
----    self:StopUpdating()
--end
--
--function HudSpeedometer:OnUpdate(dt)
--    if not self.inpos then
--        local pos=self:GetPosition()
--        if self.isopen then
--            local newpos=Vector3(
--                pos.x+self.move_ratio*self.DeltaPosition.x,
--                pos.y+self.move_ratio*self.DeltaPosition.y,
--                pos.z+self.move_ratio*self.DeltaPosition.z
--                )
--            self:SetPosition(newpos)
--            if (self:GetPosition()-self.ShowPosition):Length() < self.threshold then
--                self:SetPosition(self.ShowPosition)
--                self.inpos=true
--            end
--        else
--            local newpos=Vector3(
--                pos.x-self.move_ratio*self.DeltaPosition.x,
--                pos.y-self.move_ratio*self.DeltaPosition.y,
--                pos.z-self.move_ratio*self.DeltaPosition.z
--                )
--            self:SetPosition(newpos)
--            if (self:GetPosition()-self.HidePosition):Length() < self.threshold then
--                self:SetPosition(self.HidePosition)
--                self.inpos=true
--                self:Hide()
--                self:StopUpdating()
--                return
--            end
--        end
--    end
--
--    local rotation=self:GetRotation()
--    local delta=(rotation-self.current_rotation)
--    self.rotation_speed=self.damping_ratio*self.rotation_speed
--        +self.force_ratio*delta
--        +self.random_ratio*(math.random()-0.5)*(rotation)
--    
--    if self.current_rotation > 320 then
--        self.rotation_speed=-1.5*math.abs(self.rotation_speed)
--    end
--    
--    
--    self.current_rotation=self.current_rotation+self.rotation_speed*self.update_ratio
--    
--    if self.current_rotation < 40 then
--        self.current_rotation=40
--    end
--    
--    self.needle:SetRotation(self.current_rotation)
--    
--end
--
--return HudSpeedometer
--