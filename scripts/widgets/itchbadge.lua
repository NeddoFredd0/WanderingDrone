local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"

Assets = {
    Asset("ANIM", "anim/itchmeter.zip"),
}

local ItchBadge = Class(Badge, function(self, owner, bank, build, background_build)
	Badge._ctor(self, "itchmeter", owner, { 70 / 255, 130 / 255, 180 / 255, 1 }, "itchmeter") --nil, nil, true

	self.anim:GetAnimState():SetBuild("itchmeter")

	self.sanityarrow = self.underNumber:AddChild(UIAnim())
	self.sanityarrow:GetAnimState():SetBank("sanity_arrow")
	self.sanityarrow:GetAnimState():SetBuild("sanity_arrow")
	self.sanityarrow:SetClickable(false)
	self.arrowdir = nil

	self.itchpulse = self:AddChild(UIAnim())
    self.itchpulse:GetAnimState():SetBank("pulse")
    self.itchpulse:GetAnimState():SetBuild("hunger_health_pulse")
	self.itchpulse:MoveToBack()

	self.arrowdir = nil

	self:StartUpdating()
end)

function ItchBadge:ItchPulseGreen()
    self.itchpulse:GetAnimState():SetMultColour(0, 1, 0, 1)
    self.itchpulse:GetAnimState():PlayAnimation("pulse")
end

function ItchBadge:ItchPulseRed()
    self.itchpulse:GetAnimState():SetMultColour(1, 0, 0, 1)
    self.itchpulse:GetAnimState():PlayAnimation("pulse")
end

function ItchBadge:SetPercent(val, max, currentitchmeter, maxitch)
    val = val or self.percent or 100
    max = max or 100
	currentitchmeter = currentitchmeter or 10
	maxitch = maxitch or 100

	Badge.SetPercent(self, val, max)
    self.num:SetString(math.ceil(currentitchmeter))

    if KnownModIndex:IsModEnabled("workshop-376333686") then
    	self.maxnum:SetString(tostring(math.ceil(maxitch)))
    end

	if self.owner:HasTag("itch_heal") then
		self:ItchPulseGreen()
        TheFrontEnd:GetSound():PlaySound("tvheadguy/skilltree/itchmeter_up")
	end

	if self.owner:HasTag("itch_hurt") then
		self:ItchPulseRed()
        TheFrontEnd:GetSound():PlaySound("tvheadguy/skilltree/itchmeter_down")
	end

    self.percent = val
end

function ItchBadge:OnUpdate(dt)
	if TheNet:IsServerPaused() then return end

	if self.owner.replica.itchmeter ~= nil then
        self:SetPercent( self.owner.replica.itchmeter:GetPercent(),
                    self.owner.replica.itchmeter:GetMax(),
                    self.owner.replica.itchmeter:GetCurrent(),
                    self.owner.replica.itchmeter:GetMax() )
		--self:SetPercent( 100, 100, 100, 100 )
    end

	local anim = "neutral"
	--no reason to have the down arrow anim as of now
	--if self.owner ~= nil and
	--	--local down = self.owner ~= nil and
    --    self.owner:HasTag("sleeping") and
    --    self.owner.replica.itchmeter ~= nil and
    --    self.owner.replica.itchmeter:GetPercent() > 0 then
	--		
	--	anim = "arrow_loop_decrease"
	--end

	--this sucks lol
	if self.owner:HasTag("taperegensmall") then
		--print("Successfully recieved buff details")
		anim = "arrow_loop_increase"
	elseif self.owner:HasTag("taperegenbig") then
		anim = "arrow_loop_increase_most"
	elseif self.owner:HasTag("tapedegensmall") then
		anim = "arrow_loop_decrease"
	else
		anim = "neutral"
	end

	if self.arrowdir ~= anim then
		self.arrowdir = anim
		self.sanityarrow:GetAnimState():PlayAnimation(anim, true)
	end
end

--Status Announcements (credit to Island Adventures for this approach)

function ItchBadge:OnMouseButton(button, down)
    local StatusAnnouncer = self.owner and self.owner.HUD._StatusAnnouncer
    if StatusAnnouncer then
        if down and button == MOUSEBUTTON_LEFT and TheInput:IsControlPressed(CONTROL_FORCE_INSPECT) then
			local ANNOUNCEMENT
            local cur = self.owner.replica.itchmeter:GetCurrent()
			local max = self.owner.replica.itchmeter:GetMax()
			--TheNet:SystemMessage(cur, false)
			--print("DEBUG: current : "..cur)
			--if cur == nil and max == nil then
			--	cur = self.owner.components.itchmeter:GetCurrent()
			--	max = self.owner.components.itchmeter:GetMax()
			--end
			if cur and cur < 100 and max and max > 0 then
				local percent = cur/max
				--print("PERCENT% = "..percent)
				if percent <= 0.10 then
					ANNOUNCEMENT = "EMPTY"
				elseif percent > 0.10 and percent < 0.38 then
					ANNOUNCEMENT = "LOW"
				elseif percent > 0.38 and percent < 0.73 then
					ANNOUNCEMENT = "MID"
				elseif percent > 0.73 and percent < 0.9 then
					ANNOUNCEMENT = "HIGH"
				elseif percent > 0.9 then
					ANNOUNCEMENT = "FULL"
				end

				local quote = STRINGS._STATUS_ANNOUNCEMENTS.TVHEADGUY.ITCHMETER[ANNOUNCEMENT]
				local message
				if cur ~= nil and max ~= nil then
					message = string.format("(Itch: %d/%d) %s", cur, max, quote or "ERROR: Missing Quote!")
				else
					print("DEBUG: cur, or max is nil!")
				end

				if message ~= nil then --failsafe in case values are not present
            		StatusAnnouncer:Announce(message)
				else
					return
				end
            	return true
			else
				return
			end
        end
    end
    return self._base.OnMouseButton(self, button, down)
end

return ItchBadge