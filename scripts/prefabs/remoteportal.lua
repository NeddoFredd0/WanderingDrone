local assets=
{
    Asset("ANIM", "anim/remoteportal.zip"),

    --Asset("ATLAS", "images/inventoryimages/tape1.xml"),
    --Asset("IMAGE", "images/inventoryimages/tape1.tex"),
}

local prefabs =
{

}

local brain = require "brains/remoteportalbrain"

----------------------------------
---talker stuff

local TALK_COLOUR = Vector3(200/255, 200/255, 200/255)

local TALK_SOUNDNAME = "talk"
local TALK_OFFSET = Vector3(0, -50, 0)
local TALK_DURATION = 2.5

local NUM_OF_INTROOUTROS = 5

local function SayChatterLine(inst)
    local num = math.random(1, NUM_OF_INTROOUTROS)
    local list
    if math.random() < 0.5 then
        list = STRINGS.TAPESTORAGE_SIGNALS["intro"]
    else
        list = STRINGS.TAPESTORAGE_SIGNALS["outro"]
    end
    local str = list[num]

    inst.components.talker:Say(str)
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/radiochatter")
end

local function StartReceivingSignals(inst)
    inst:AddTag("signalloop")
    if math.random() < 0.5 then
        SayChatterLine(inst)
    end
    if inst:HasTag("signalloop") then
        inst.signalloop = inst:DoPeriodicTask(math.random(3, 7), function()
            if math.random() < 0.5 then
                SayChatterLine(inst)
            end
        end)
    end
end

----------------------------------
---container stuff

local function onopen(inst)
    if inst.components.container_proxy ~= nil then
        local proxymaster = inst.components.container_proxy:GetMaster()
        local openers = proxymaster.components.container:GetOpeners()
        for k, opener in pairs(openers) do
            if opener:HasTag("tapemaker") then
                --inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open")
                --inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open_LP", "archiveloop")
                return
            else
                inst.components.container_proxy:Close()
                --opener.components.combat:GetAttacked(inst, 0)
                if opener.prefab == "wilson" or opener.prefab == "willow" or opener.prefab == "wolfgang" or opener.prefab == "wendy" or opener.prefab == "wx78" or opener.prefab == "wickerbottom" or
                opener.prefab == "woodie" or opener.prefab == "waxwell" or opener.prefab == "wathgrithr" or opener.prefab == "webber" or opener.prefab == "warly" or opener.prefab == "winona" or
                opener.prefab == "walter" or opener.prefab == "wortox" or opener.prefab == "wormwood" or opener.prefab == "wurt" or opener.prefab == "wanda" then
                    opener.components.talker:Say(STRINGS.PORTALZAP[string.upper(opener.prefab)])
                else
                    opener.components.talker:Say(STRINGS.PORTALZAP.GENERIC)
                end
                opener.sg:GoToState("electrocute")

                --local x, y, z = opener.Transform:GetWorldPosition()
                --local zap = SpawnPrefab("lightning_rod_fx")
                --zap.Transform:SetPosition(x, y, z)
            end
        end
    end
end

local function onclose(inst)
    --inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_close")
    --inst.SoundEmitter:KillSound("archiveloop")
end

local function onspawn(inst)
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open")
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open_LP", "archiveloop")

    StartReceivingSignals(inst)
end

----------------------------------

local function OnTimerDone(inst, data)
    if data.name == "selfdestruct" then
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_close")
        inst.SoundEmitter:KillSound("archiveloop")
        inst.sg:GoToState("despawn")
        inst:ListenForEvent("animover", function()
            inst:Remove()
        end)
    end
end

local function ForceDelete(inst)
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_close")
    inst.SoundEmitter:KillSound("archiveloop")
    inst.sg:GoToState("despawn")
    inst:ListenForEvent("animover", function()
        inst:Remove()
    end)
end

local function OnHaunt(inst, haunter)
	if math.random() > TUNING.HAUNT_CHANCE_HALF then
    	ForceDelete(inst)
	end
    return true
end

local function AttachTapeContainer(inst)
	inst.components.container_proxy:SetMaster(TheWorld:GetPocketDimensionContainer("tape"))
end

local function OnStopFollowing(inst)
    inst:RemoveTag("companion")
end

local function OnStartFollowing(inst)
    inst:AddTag("companion")
end

local BLOOM = 0.5

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("remoteportal")
    inst.AnimState:SetBuild("remoteportal")
    --inst.AnimState:PlayAnimation("spawn")
    --inst.AnimState:PushAnimation("idle")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst:AddTag("remoteportal")
    inst:AddTag("flying")
    inst:AddTag("noauradamage")
    inst:AddTag("notraptrigger")
    inst:AddTag("NOBLOCK")
    --MakeGhostPhysics(inst, 1, .5)
    --MakeCharacterPhysics(inst, 10, .5) --todo: tweak mass

    inst.DynamicShadow:SetSize(2, 1.5)

    MakeGhostPhysics(inst, 1, .5)
    --MakeCharacterPhysics(inst, 75, .5)
    --inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    --inst.Physics:ClearCollisionMask()
    --inst.Physics:CollidesWith(COLLISION.WORLD)
    --inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    --inst.Physics:CollidesWith(COLLISION.CHARACTERS)

    inst.Light:SetIntensity(.2)
    inst.Light:SetRadius(.2) --.2
    inst.Light:SetFalloff(.6)
    inst.Light:Enable(true)
    inst.Light:SetColour(180 / 255, 195 / 255, 225 / 255)

    inst.AnimState:SetSymbolLightOverride("remoteportal_closing", BLOOM)
	inst.AnimState:SetSymbolBloom("remoteportal_closing")
    inst.AnimState:SetSymbolLightOverride("remoteportal_open", BLOOM)
	inst.AnimState:SetSymbolBloom("remoteportal_open")
    inst.AnimState:SetSymbolLightOverride("remoteportal_opening", BLOOM)
	inst.AnimState:SetSymbolBloom("remoteportal_opening")

    inst.AnimState:SetScale(1.8, 1.8)

    inst:AddComponent("container_proxy")

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 28
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = TALK_COLOUR
    inst.components.talker.offset = TALK_OFFSET

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

    inst.voice = SpawnPrefab("tapestorage_voice")
	inst.voice.proxy = inst
	inst.voice.Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst:AddChild(inst.voice)

    --inst:AddComponent("container")
    --inst.components.container:WidgetSetup("tapestorage")
    --inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
    --inst.components.container.skipclosesnd = true
    --inst.components.container.skipopensnd = true

    inst.components.container_proxy:SetOnOpenFn(onopen)
	inst.components.container_proxy:SetOnCloseFn(onclose)

    inst.OnLoadPostPass = AttachTapeContainer

	if not POPULATING then
		AttachTapeContainer(inst)
	end

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = TUNING.WILSON_WALK_SPEED
    inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED
    --inst.components.locomotor:SetAllowPlatformHopping(true)
--
	--inst:AddComponent("embarker")
    --inst.components.embarker.embark_speed = inst.components.locomotor.runspeed

    inst:AddComponent("follower")
    --inst.components.follower.keepleaderduringminigame = true
    --inst.components.follower:SetLeader(dude)
    inst:ListenForEvent("stopfollowing", OnStopFollowing)
    inst:ListenForEvent("startfollowing", OnStartFollowing)

    inst:AddComponent("knownlocations")

--STRINGS.NAMES.remoteportal = "Remote Portal"

	inst:AddComponent("inspectable")

	inst:AddComponent("hauntable")
    --inst.components.hauntable.cooldown_on_successful_haunt = false
    inst.components.hauntable.usefx = false
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_MEDIUM)
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

    inst:SetBrain(brain)

    inst:SetStateGraph("SGremoteportal")
	inst.sg:GoToState("spawn")

    if inst.components.timer == nil then
        inst:AddComponent("timer")
    end
    inst.components.timer:StartTimer("selfdestruct", TUNING.TAPE_PORTAL.DURATION)
    inst:ListenForEvent("timerdone", OnTimerDone)
    inst:ListenForEvent("ejectdeleteportal", function() ForceDelete(inst) end)


    onspawn(inst)
    return inst
end

local function voicefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("")
    inst.AnimState:SetBuild("")

    inst:AddTag("NOCLICK")
    inst:AddTag("fx")

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 28
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = TALK_COLOUR
    inst.components.talker.offset = TALK_OFFSET

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:ListenForEvent("donetalking", function()
        if inst.proxy then
            inst.proxy:PushEvent("donetalking")
        end
    end)
    inst:ListenForEvent("ontalk", function()
        if inst.proxy then
            inst.proxy:PushEvent("ontalk")
        end
    end)

    return inst
end

return  Prefab("common/remoteportal", fn, assets, prefabs),
    Prefab("remoteportal_voice", voicefn)