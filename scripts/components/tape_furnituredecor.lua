require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS

--credit to On To Table mod for this approach!

local function removetag(inst)
	inst:RemoveTag("furnituredecor")
end
local function addtag(inst)
	inst:RemoveTag("furnituredecor")
	inst:AddTag("furnituredecor")
end

local tape_furnituredecor = Class(function(self, inst)
    self.inst = inst

    self.inst:AddTag("furnituredecor")
	self.inst.entity:AddFollower()
	if self.inst.components.furnituredecor == nil then
		self.inst:AddComponent("furnituredecor")
		if self.inst.components.inventoryitem.owner == nil then
			removetag(self.inst)
		end
		self.inst:ListenForEvent("ondropped",removetag)
		self.inst:ListenForEvent("onpickup",addtag)
		self.inst.components.furnituredecor.onputonfurniture = function(inst, furniture)
            if inst.prefab == "tape3" then --remembrance
                self.inst.Follower:FollowSymbol(furniture.GUID, "swap_object", 0, -10, 0)
            else
                self.inst.Follower:FollowSymbol(furniture.GUID, "swap_object", 0, 20, 0)
            end
			--if self.ondropfn ~= nil then
				--self:OnDropped(0,1)
				--addtag(self.inst) --todo: figure out what this is for
				--self.inst:PushEvent("ondropped")
			--end 
		end
	end
end)

return tape_furnituredecor