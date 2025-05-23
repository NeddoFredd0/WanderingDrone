require "class"
--require "bufferedaction"
--require "debugtools"
require 'util'
require 'vecutil'
--require ("components/embarker")
--local ACTIONS = GLOBAL.ACTIONS

local tapebits_smash = Class(function(self, inst)
    self.inst = inst
end)

function tapebits_smash:Smash(invobject, doer)
    --doer.sg:GoToState("tapebits_smash")

    local owner = invobject.components.inventoryitem:GetGrandOwner()
    local receiver = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local stacksize = invobject.components.stackable ~= nil and invobject.components.stackable:StackSize() or 1

    --for i = 1, stacksize do
        --local loots = invobject.components.lootdropper:GenerateLoot()
        local loots = {}
        table.insert(loots, "tapebits_busted")
        if 0.25 > math.random() then
            table.insert(loots, "tapebits_busted")
        end

        if stacksize == 1 then
            invobject:Remove()
        else
            invobject.components.stackable:SetStackSize(stacksize-1) --we only want to remove 1, not the entire stack
        end

	    for k, v in pairs(loots) do
	    	    local loot = SpawnPrefab(v)
	    	    if loot ~= nil and receiver ~= nil then
	    	    	receiver:GiveItem(loot, nil, doer:GetPosition())
	    	    end
	    end

	    --SpawnPrefab("fx_tapebreak").Transform:SetPosition(doer.Transform:GetWorldPosition()) --eh?
    --end
end


--AddComponentAction(actiontype, component, fn, modname)

return tapebits_smash