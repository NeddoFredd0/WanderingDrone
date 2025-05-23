require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS

local tveject = Class(function(self, inst)
    self.inst = inst --player
end)

function tveject:Eject(invobject, doer)
    if doer == nil then
        doer = self.inst
    end

    if doer.components.itchmeter then
        doer.components.itchmeter:DoDelta(TUNING.TVSKILLTREE.EJECT_ITCH_COST)
    end

    doer:PushEvent("tvejectattempt")
    doer.SoundEmitter:KillSound("tapeloop")
    doer.SoundEmitter:PlaySound("tvheadguy/skilltree/eject")

    --if invobject ~= nil and invobject.components.tapeconsume ~= nil then
    --    
    --end

end

return tveject