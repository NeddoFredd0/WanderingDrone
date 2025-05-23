require("stategraphs/commonstates")

local actionhandlers =
{
}

local events =
{
    CommonHandlers.OnAttacked(),
    CommonHandlers.OnDeath(),
    CommonHandlers.OnAttack(),
	CommonHandlers.OnFreeze(),
	EventHandler("locomote", function(inst)
        if not inst.sg:HasStateTag("busy") then
            local is_moving = inst.sg:HasStateTag("moving")
            local wants_to_move = inst.components.locomotor:WantsToMoveForward()
            if not inst.sg:HasStateTag("attack") and is_moving ~= wants_to_move then
                if wants_to_move then
                    inst.sg:GoToState("run_start")
                else
                    inst.sg:GoToState("idle")
                end
            end
        end
    end),
	EventHandler("doattack", function(inst, data)
		if inst.components.health and not inst.components.health:IsDead() and (inst.sg:HasStateTag("hit") or not inst.sg:HasStateTag("busy")) then
			inst.sg:GoToState("attack")
		end
	end),
}

local states =
{
    State{
        name = "idle",
        tags = {"idle", "canrotate"},
        onenter = function(inst, pushanim)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("idle_loop", true)
        end,

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "run_start",
        tags = {"moving", "running", "canrotate"},

        onenter = function(inst)
			inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_pre")
            inst.sg.mem.foosteps = 0
        end,

        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("run") end ),
        },

        timeline=
        {
            TimeEvent(4*FRAMES, function(inst)
            end),
        },

    },

    --State{
--
    --    name = "funnyidle",
    --    tags = {"idle", "canrotate"},
    --    onenter = function(inst)
--
--
	--		if inst.components.temperature:GetCurrent() < 5 then
	--			inst.AnimState:PlayAnimation("idle_shiver_pre")
	--			inst.AnimState:PushAnimation("idle_shiver_loop")
	--			inst.AnimState:PushAnimation("idle_shiver_pst", false)
	--		elseif inst.components.hunger:GetPercent() < TUNING.HUNGRY_THRESH then
    --            inst.AnimState:PlayAnimation("hungry")
    --            inst.SoundEmitter:PlaySound("dontstarve/rabbit/beardscream")
    --        else
    --            inst.AnimState:PlayAnimation("idle_inaction")
    --        end
    --    end,
--
    --    events=
    --    {
    --        EventHandler("animqueueover", function(inst) inst.sg:GoToState("idle") end ),
    --    },
--
    --},


    State{
        name = "run",
        tags = {"moving", "running", "canrotate"},

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_loop")

        end,

        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("run") end ),
        },
    },

    State{

        name = "run_stop",
        tags = {"canrotate", "idle"},

        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("run_pst")
        end,

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },

    },


	State{

        name = "attack",
        tags = {"attack", "busy"},

        onenter = function(inst)
			--inst.equipfn(inst, inst.items["SWORD"])
			--if inst.fire then
			--	inst.fire:Remove()
			--	inst.fire = nil
			--end
			--local comboend math.random(1,2)
			--if comboend == 1 then
				inst.components.combat:StartAttack()
			--end
            inst.Physics:Stop()
			inst.AnimState:PlayAnimation("atk")
			inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
        end,

        timeline=
        {
            TimeEvent(7*FRAMES, function(inst) inst.components.combat:DoAttack() end),
        },

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

	State{

        name = "death",
        tags = {"busy"},
        onenter = function(inst)
            --inst.SoundEmitter:PlaySound("dontstarve/wilson/death") --TODO: add custom sound
            --inst.AnimState:PlayAnimation("death") --TODO: test without death animation, want them to just instantly explode
            inst.Physics:Stop()
            RemovePhysicsColliders(inst)
        end,
    },

    State{
        name = "hit",
        tags = {"busy"},

        onenter = function(inst)
            inst:InterruptBufferedAction()
            --inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
            inst.AnimState:PlayAnimation("hit")
            inst.Physics:Stop()
        end,

        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },

        timeline =
        {
            TimeEvent(3*FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },

    },

    --State{
    --    name = "stunned",
    --    tags = {"busy", "canrotate"},
--
    --    onenter = function(inst)
    --        inst:InterruptBufferedAction()
    --        inst:ClearBufferedAction()
    --        inst.Physics:Stop()
    --        inst.AnimState:PlayAnimation("idle_sanity_pre")
    --        inst.AnimState:PushAnimation("idle_sanity_loop", true)
    --        inst.sg:SetTimeout(5)
    --    end,
--
    --    ontimeout = function(inst)
    --        inst.sg:GoToState("idle")
    --    end,
    --},

    State{
        name = "frozen",
        tags = {"busy", "frozen"},

        onenter = function(inst)
            if inst.components.locomotor then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("idle_shiver_loop")
            inst.SoundEmitter:PlaySound("dontstarve/common/freezecreature")
            inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
        end,

        onexit = function(inst)
            inst.AnimState:ClearOverrideSymbol("swap_frozen")
        end,

        events=
        {
            EventHandler("onthaw", function(inst) inst.sg:GoToState("thaw") end ),
        },
    },

    State{
        name = "thaw",
        tags = {"busy", "thawing"},

        onenter = function(inst)
            if inst.components.locomotor then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("idle_inaction_sanity", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/freezethaw", "thawing")
            inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
        end,

        onexit = function(inst)
            inst.SoundEmitter:KillSound("thawing")
            inst.AnimState:ClearOverrideSymbol("swap_frozen")
        end,

        events =
        {
            EventHandler("unfreeze", function(inst)
                if inst.sg.sg.states.hit then
                    inst.sg:GoToState("hit")
                else
                    inst.sg:GoToState("idle")
                end
            end ),
        },
    },

	State{

		name = "frozen",
		tags = {"busy"},

        onenter = function(inst)
            inst.AnimState:PlayAnimation("frozen")
            inst.Physics:Stop()
        end,
    },
}

CommonStates.AddWalkStates(states,
{
	walktimeline = {
		TimeEvent(0*FRAMES, PlayFootstep ),
		TimeEvent(12*FRAMES, PlayFootstep ),
	},
})
CommonStates.AddRunStates(states,
{
	runtimeline = {
		TimeEvent(0*FRAMES, PlayFootstep ),
		TimeEvent(10*FRAMES, PlayFootstep ),
	},
})


CommonStates.AddFrozenStates(states)

return StateGraph("clonedrone", states, events, "idle", actionhandlers)