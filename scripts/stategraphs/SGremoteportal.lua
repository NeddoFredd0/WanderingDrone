require("stategraphs/commonstates")

local events = --do not delete
{
    CommonHandlers.OnLocomote(true, true), --can-run, can-walk
}

local states =

{
    State{
        name = "idle",
        tags = { "idle", },
        onenter = function(inst)
            --inst.AnimState:PlayAnimation("spawn")
            inst.AnimState:PlayAnimation("idle")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),

            EventHandler("ejectdeleteportal", function(inst, data)
                inst.sg:GoToState("despawn")
            end),
        },
    },

    State{
        name = "spawn",
        --tags = { "idle", },
        onenter = function(inst)
            inst.AnimState:PlayAnimation("spawn")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle", true)
            end ),
        },
    },

    State{
        name = "despawn",
        onenter = function(inst)
            inst.AnimState:PlayAnimation("despawn")
        end,

        events =
        {
            EventHandler("animover", function(inst, data)
                inst:Remove()
            end),
        },
    },
}

CommonStates.AddSimpleWalkStates(states, "idle")
CommonStates.AddSimpleRunStates(states, "idle")

return StateGraph("remoteportal", states, events, "idle")
