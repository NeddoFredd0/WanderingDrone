local env = env
GLOBAL.setfenv(1, GLOBAL)

env.AddStategraphPostInit("wilson", function(inst)

local states = {

    State{
        name = "tapebits_smash",
        tags = { "doing", "busy", "canrotate" },

        onenter = function(inst)
            if inst.components.rider:IsRiding() then
                inst.sg:AddStateTag("dismounting")
                inst.components.rider:ActualDismount()
                inst.SoundEmitter:PlaySound("dontstarve/beefalo/saddle/dismount")
            end

            --local item = inst.components.playercontroller:GetCursorInventoryObject()
            --print("DEBUG: item: ")
            --dumptable(item)

            inst.AnimState:PlayAnimation("useitem_pre")
            inst.AnimState:PushAnimation("pocketwatch_portal", false)

            inst.components.locomotor:Stop()

            --local bit = inst.bufferedaction ~= nil and inst.bufferedaction.invobject
            --if bit ~= nil and bit.build ~= nil then --todo: find out way to get invobject here
            --    inst.AnimState:OverrideSymbol("watchprop", bit.build, "watchprop")
            --end

            --if item ~= nil and item.build ~= nil then
            --    inst.AnimState:OverrideSymbol("watchprop", item.build, "watchprop")
            --end

            --inst.AnimState:OverrideSymbol("watchprop", "anim/tapebits_1.zip", "watchprop")

            local buffaction = inst:GetBufferedAction()
			if buffaction ~= nil then
                --print("DEBUG: prefab: "..buffaction.invobject.prefab)
                local build = "smash"..buffaction.invobject.prefab
		        inst.AnimState:OverrideSymbol("watchprop", build, "watchprop")
                --buffaction.invobject.AnimState:GetBuild()
			end
        end,

        timeline =
        {
            TimeEvent(8 * FRAMES, function(inst)
                --inst.AnimState:Show("ARM_normal") --todo: resolve weird issues with third arm
            end),
            --TimeEvent(18 * FRAMES, function(inst)
			--	local gemtype = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
--
			--	if gemtype ~= nil and gemtype.spell ~= nil and gemtype.spell == "lunarrift_portal" and
			--		(not TheWorld.components.riftspawner or TheWorld.components.riftspawner.rifts_count ~= 0) then
			--			if not TheWorld.components.riftspawner then
			--				inst.components.talker:Say(GetString(inst, "ANNOUNCE_SMASH_WHIMSYGEM_CANT_SPAWN_RIFT"))
			--			elseif TheWorld.components.riftspawner.rifts_count ~= 0 then
			--				inst.components.talker:Say(GetString(inst, "ANNOUNCE_SMASH_WHIMSYGEM_ALREADY_RIFT"))
			--			end
--
			--			inst.sg.statemem.action_failed = true
			--			inst.AnimState:Hide("gemshard")
			--			inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
			--	elseif not inst:PerformBufferedAction() or gemtype.spell == nil then
			--		inst.components.talker:Say(GetString(inst, "ANNOUNCE_SMASH_WHIMSYGEM_FAIL"))
--
			--		inst.sg.statemem.action_failed = true
			--		inst.AnimState:Hide("gemshard")
			--		inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
			--	else
	        --        inst.SoundEmitter:PlaySound("turnoftides/common/together/moon_glass/mine")
			--		inst.components.talker:Say(GetString(inst, "ANNOUNCE_SMASH_WHIMSYGEM"))
            --    end
            --end),

            TimeEvent(18 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
                inst.SoundEmitter:PlaySound("tvheadguy/skilltree/breakdown") --we want to play both

				inst.sg:RemoveStateTag("busy")
                inst:PerformBufferedAction()
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.AnimState:PlayAnimation("useitem_pst", false)
                    inst.sg:GoToState("idle", true)
                end
            end),
        },

        onexit = function(inst)
            if inst.sg.statemem.action_failed then
                --inst.AnimState:Show("gemshard")
            end
        end,
    },
}

for k, v in pairs(states) do
    assert(v:is_a(State), "Non-state added in mod state table!")
    inst.states[v.name] = v
end

end)