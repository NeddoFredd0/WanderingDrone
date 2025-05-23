require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/panic"
require "behaviours/follow"
require "behaviours/runaway"
require "behaviours/doaction"
require "behaviours/chaseandattack"

local CloneDroneBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local MIN_FOLLOW_DIST = 0.00001
local TARGET_FOLLOW_DIST = 4
local MAX_FOLLOW_DIST = 5

local START_FACE_DIST = 6
local KEEP_FACE_DIST = 8

--local KEEP_LEADER_NEAR_DIST = 50
local KEEP_LEADER_NEAR_DIST = 30

local function HasStateTags(inst, tags)
    for k,v in pairs(tags) do
        if inst.sg:HasStateTag(v) then
            return true
        end
    end
end

local function PlayerClose(inst)
	local player = GetClosestInstWithTag("player",inst,6)
	if player then
		return true
	else
		return false
	end
end

local function isPlayerNear(inst)
    return inst.components.follower.leader and inst.components.follower.leader:GetDistanceSqToInst(inst) <= KEEP_LEADER_NEAR_DIST*KEEP_LEADER_NEAR_DIST
end

local function KeepLookingAction(inst)
--    return inst.components.follower.leader and inst.components.follower.leader:GetDistanceSqToInst(inst) <= KEEP_CHOPPING_DIST*KEEP_CHOPPING_DIST
    return isPlayerNear(inst)
end

----------------------------------------------
local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function GetLeader(inst)
    return inst.components.follower and inst.components.follower.leader
end
---------------------------------------

function CloneDroneBrain:OnStart()
    local root = PriorityNode(
    {
		WhileNode( function() return self.inst.components.combat.target == nil or not self.inst.components.combat:InCooldown() end, "AttackMomentarily",
			ChaseAndAttack(self.inst, 12, 20)),
            --trying what they feel like without kiting AI
		--WhileNode( function() return self.inst.components.combat.target and self.inst.components.combat:InCooldown() end, "Dodge",
		--	RunAway(self.inst, function() return self.inst.components.combat.target end, 6, 9)),
----------------------------------------------
        IfNode(function()
            if self.inst.components.follower.leader ~= nil then
                return true
            end
        end, "has leader",
            Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST)),
		IfNode(function() return self.inst.components.follower.leader ~= nil end, "has leader",
			FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn )),
----------------------------------------------
    }, 1)
    self.bt = BT(self.inst, root)
end

return CloneDroneBrain