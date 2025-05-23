require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/panic"
require "behaviours/follow"
require "behaviours/runaway"
require "behaviours/doaction"
require "behaviours/chaseandattack"
local BrainCommon = require("brains/braincommon")

local RemotePortalBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local MIN_FOLLOW_DIST = 0
local TARGET_FOLLOW_DIST = 4
local MAX_FOLLOW_DIST = 7

local MAX_WANDER_DIST = 3

local START_FACE_DIST = 6
local KEEP_FACE_DIST = 8

----------------------------------------------
local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function GetLeader(inst)
    if inst.components.follower ~= nil then
        return inst.components.follower:GetLeader() or inst.components.follower.leader --inst.components.follower and inst.components.follower.leader
    end
end

--------------------------------------

function RemotePortalBrain:OnStart()
    local root = PriorityNode(
    {
        Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
        BrainCommon.PanicTrigger(self.inst),
        --FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
    }, 0.25)

    self.bt = BT(self.inst, root)
end

return RemotePortalBrain