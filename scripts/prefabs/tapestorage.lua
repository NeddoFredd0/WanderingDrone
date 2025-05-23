require "prefabutil"
require "recipe"
require "modutil"

local assets=
{
    Asset("ANIM", "anim/tapestorage.zip"),
    --Asset("ANIM", "anim/ui_bookstation_4x5.zip"),
    Asset("ATLAS", "images/inventoryimages/tapestorage.xml"),
    Asset("MINIMAP_IMAGE", "tapestorage" ),
    Asset("IMAGE", "images/inventoryimages/tapestorage.tex"),
}

local prefabs =
{
    "collapse_small",
}

--------------------------------
--talker stuff

--colours
local TALK_COLOUR = Vector3(200/255, 200/255, 200/255)  --todo: figure out a way for custom colours :(

local colourtable = {
    ["lightgrey"] = Vector3(200/255, 200/255, 200/255),
    ["lightred"] = Vector3(204/255, 99/255, 78/255),
    ["lightblue"] = Vector3(119/255, 149/255, 198/255),
    ["lightyellow"] = Vector3(255/255, 243/255, 204/255),
    ["lightorange"] = Vector3(255/255, 163/255, 124/255),
}

local interferencetable = {
    0.1, 0.36, 0.5, 0.66, 0.9,
}

local TALK_SOUNDNAME = "talk"
local TALK_OFFSET = Vector3(0, -50, 0)
local TALK_DURATION = 2.5

--gonna have to manually update this every time I add a new string set
local NUM_OF_SETS = 20
local NUM_OF_INTROOUTROS = 5

local function BastardiseString(strpre, interference)
    local str = ""

    for idx = 1, #strpre do
        local character = string.byte(strpre, idx)
        if math.random() < interference then
            if character >= 97 and character <= 122 or character >= 65 and character <= 90 or character >= 48 and character <= 57 then --is a letter of the latin alphabet, or a numeral
                --string.gsub(strpre, idx, "-")
                str = str.."-"
            else
                str = str..string.char(character)
            end
        else
            str = str..string.char(character)
        end
    end

    return str
end

local function SayCurrentLine(inst, list, colour, num, interference)
    if list ~= nil then
        --local str = list[math.random(1, #list)]
        local strpre = list[num]
        if interference == nil then
            interference = 0 --assume intro/outro string
        end
        local str = BastardiseString(strpre, interference)

        inst.components.talker:Say(str, nil, nil, nil, nil) --colour)
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/radiochatter")
    end
end

local function SayIntroOutroLine(inst, colour, intro)
    if intro == true then
        SayCurrentLine(inst, STRINGS.TAPESTORAGE_SIGNALS["intro"], colour, math.random(1, NUM_OF_INTROOUTROS))
        inst:AddTag("currentloop")
    else
        SayCurrentLine(inst, STRINGS.TAPESTORAGE_SIGNALS["outro"], colour, math.random(1, NUM_OF_INTROOUTROS))
        inst:RemoveTag("currentloop")
    end
end

local function StartSignalChain(inst)
    local set = "signals"..math.random(1, NUM_OF_SETS)
    local colourpre = STRINGS.TAPESTORAGE_SIGNALS_COLOURDEFS[set]
    local colour = colourtable[colourpre]
    --print("DEBUG: colour: "..tostring(colour))

    inst.components.talker.colour = colour

    local interference = interferencetable[math.random(1, #interferencetable)]

    local list = STRINGS.TAPESTORAGE_SIGNALS[set]

    --say intro line
    if inst:HasTag("signalloop") then
        SayIntroOutroLine(inst, colour, true)
    else
        inst.components.talker:ShutUp()
    end

    --say content lines
    for i=1, #list do
        if inst:HasTag("signalloop") then
            inst:DoTaskInTime(i*TALK_DURATION, function()
                --if inst:HasTag("signalloop") then
                    SayCurrentLine(inst, list, colour, i, interference) --else
                        --inst.components.talker:ShutUp()
                    --end
                end)
            if i == #list then --at the end, say the outro line
            inst:DoTaskInTime((#list+1)*TALK_DURATION, function()
                --if inst:HasTag("signalloop") then
                    SayIntroOutroLine(inst, colour, false) --else
                        --inst.components.talker:ShutUp()
                    --end
                end)
            end
        else
            inst.components.talker:ShutUp()
            break
        end
    end
end

local function StartReceivingSignals(inst)
    if not inst:HasTag("currentloop") then
        inst:AddTag("signalloop")
        if math.random() < 0.40 then
            inst:DoTaskInTime(math.random(1, 3), function() StartSignalChain(inst) end)
        end
        if inst:HasTag("signalloop") then
            inst.signalloop = inst:DoPeriodicTask(math.random(10, 15), function()
                if not inst:HasTag("currentloop") and math.random() < 0.33 then
                    StartSignalChain(inst)
                end
            end)
        end
    end
end

local function StopReceivingSignals(inst)
    inst.components.talker:ShutUp()

    inst:RemoveTag("signalloop")
    inst.signalloop:Cancel()
end

--------------------------------
--storage aesthetics stuff

local THRESH_SMALL = 0.3
local THRESH_LRG = 0.55

local function CountTapes(inst)
    local numitems = 1
    local numslots = 1
    if inst.components.container_proxy then
        local proxymaster = inst.components.container_proxy:GetMaster()
        if proxymaster ~= nil then
            numitems = proxymaster.components.container:NumItems()
            numslots = proxymaster.components.container:GetNumSlots()
        end
    end

    return numitems/numslots
end

--local function UpdateTapeAesthetics(inst, numberoverride)
--    local number
--    if type(numberoverride == "number") then
--        number = numberoverride
--    end
--
--    if type(number) == "table" then
--        number = CountTapes(inst)
--    end
--
--    if number == nil then
--        number = 0 --assume 0 for init
--    end
--
--    --print("DEBUG: number: "..number)
--
--    if number == 0 then
--
--    elseif number < THRESH_SMALL then
--
--    elseif number < THRESH_LRG then
--
--    else
--
--    end
--end

local function PlayStorageStateAnim(inst, anim, numberoverride)
    local num
    if numberoverride ~= nil and type(numberoverride == "number") then
        num = numberoverride
    else
        num = CountTapes(inst) or 0
    end

    if type(num) == "table" then
        num = CountTapes(inst)
    end

    if anim == "idle" then
        if num == 0 then
            inst.AnimState:PlayAnimation("idle", true)
        elseif num < THRESH_SMALL then
            inst.AnimState:PlayAnimation("idle_some", true)
        elseif num < THRESH_LRG then
            inst.AnimState:PlayAnimation("idle_more", true)
        else
            inst.AnimState:PlayAnimation("idle_full", true)
        end
    end

    if anim == "idle_push" then
        if num == 0 then
            inst.AnimState:PushAnimation("idle", true)
        elseif num < THRESH_SMALL then
            inst.AnimState:PushAnimation("idle_some", true)
        elseif num < THRESH_LRG then
            inst.AnimState:PushAnimation("idle_more", true)
        else
            inst.AnimState:PushAnimation("idle_full", true)
        end
    end

    if anim == "opening" then
        if num == 0 then
            inst.AnimState:PlayAnimation("opening")
            inst.AnimState:PushAnimation("open", true)
        elseif num < THRESH_SMALL then
            inst.AnimState:PlayAnimation("opening_some")
            inst.AnimState:PushAnimation("open_some", true)
        elseif num < THRESH_LRG then
            inst.AnimState:PlayAnimation("opening_more")
            inst.AnimState:PushAnimation("open_more", true)
        else
            inst.AnimState:PlayAnimation("opening_full")
            inst.AnimState:PushAnimation("open_full", true)
        end
    end

    if anim == "open" then
        if num == 0 then
            inst.AnimState:PlayAnimation("open", true)
        elseif num < THRESH_SMALL then
            inst.AnimState:PlayAnimation("open_some", true)
        elseif num < THRESH_LRG then
            inst.AnimState:PlayAnimation("open_more", true)
        else
            inst.AnimState:PlayAnimation("open_full", true)
        end
    end

    if anim == "closing" then
        if num == 0 then
            inst.AnimState:PlayAnimation("closing")
            inst.AnimState:PushAnimation("idle", true)
        elseif num < THRESH_SMALL then
            inst.AnimState:PlayAnimation("closing_some")
            inst.AnimState:PushAnimation("idle_some", true)
        elseif num < THRESH_LRG then
            inst.AnimState:PlayAnimation("closing_more")
            inst.AnimState:PushAnimation("idle_more", true)
        else
            inst.AnimState:PlayAnimation("closing_full")
            inst.AnimState:PushAnimation("idle_full", true)
        end
    end
end

----------------------------------

local function onopen(inst)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open")
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_open_LP", "archiveloop")
        PlayStorageStateAnim(inst, "opening")
        StartReceivingSignals(inst)
        --inst.components.talker:Say("TEST!")
	    --inst.AnimState:PlayAnimation("opening")
	    --inst.AnimState:PushAnimation("open", true)
    end
end

local function onclose(inst)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_close")
        inst.SoundEmitter:KillSound("archiveloop")
        PlayStorageStateAnim(inst, "closing")
        StopReceivingSignals(inst)
	    --inst.AnimState:PlayAnimation("closing")
	    --inst.AnimState:PushAnimation("idle", true)
    end
end

----------------------------------

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
        inst.AnimState:PlayAnimation("burnt")
    else
        --PlayStorageStateAnim(inst, "idle_push")
        inst:DoTaskInTime(0, function() PlayStorageStateAnim(inst, "idle_push") end)
    end
end

--------------------------------

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end

    inst.components.lootdropper:DropLoot() --dont drop loot on hammer
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_hit")
        inst.AnimState:PlayAnimation("hit")
        inst:DoTaskInTime(0, function() PlayStorageStateAnim(inst, "idle_push") end) --delay by 1 frame to ensure we have up to date storage data
        if inst.components.container_proxy ~= nil then
            local proxymaster = inst.components.container_proxy:GetMaster()
            --proxymaster.components.container:DropEverything()
            proxymaster.components.container:Close()
        end
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst:DoTaskInTime(4, function() PlayStorageStateAnim(inst, "idle_push") end)
    inst.SoundEmitter:PlaySound("tvheadguy/skilltree/archive_build")
end

local function AttachTapeContainer(inst)
	inst.components.container_proxy:SetMaster(TheWorld:GetPocketDimensionContainer("tape"))
end

----------------------------------
--CREDIT TO .xenomind ON DISCORD FOR THIS OVERLAY STUFF!!!!!
--edit: using the animation method instead but still thank you!

--local function OnEntityReplicated(inst)
--	local parent = inst.entity:GetParent()
--	if parent ~= nil and parent.prefab == "tapestorage" then
--		parent.highlightchildren = parent.highlightchildren or {}
--		table.insert(parent.highlightchildren, inst)
--	end
--end

local SCALE = 1.8
local BLOOM = .5

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
    inst.entity:AddLight()

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetSymbolBloom("tvspark_open")
    inst.AnimState:SetSymbolLightOverride("tvspark_open", BLOOM)

    inst.AnimState:SetSymbolBloom("tvspark_opening")
    inst.AnimState:SetSymbolLightOverride("tvspark_opening", BLOOM)

    inst.AnimState:SetSymbolBloom("tvspark_closing")
    inst.AnimState:SetSymbolLightOverride("tvspark_closing", BLOOM)

    MakeObstaclePhysics(inst, .5)
    inst:SetDeploySmartRadius(1) --recipe min_spacing/2

    inst:AddTag("structure")
    --inst:AddTag("chest") --for monkeys and bearger stealing

    inst.MiniMapEntity:SetIcon("tapestorage.tex")

    inst.AnimState:SetBank("tapestorage")
    inst.AnimState:SetBuild("tapestorage")
    --inst.AnimState:PlayAnimation("idle")
    --if inst.AnimState:IsCurrentAnimation("place") then
    --    pritn("DEBUG: current animation: place")
    --    inst:DoTaskInTime(4, function() PlayStorageStateAnim(inst, "idle") end)
    --else
    --inst:DoTaskInTime(1, function() PlayStorageStateAnim(inst, "idle_push") end) --todo: figure out why always shows as full on init
    --PlayStorageStateAnim(inst, "idle_push")
    --end

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 28
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = TALK_COLOUR
    inst.components.talker.offset = TALK_OFFSET

    inst:AddComponent("container_proxy")

    inst.AnimState:SetScale(SCALE, SCALE)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.voice = SpawnPrefab("tapestorage_voice")
	inst.voice.proxy = inst
	inst.voice.Transform:SetPosition(inst.Transform:GetWorldPosition())

    inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    --inst:AddComponent("container")
    --inst.components.container:WidgetSetup("tapestorage")
    --inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
    --inst.components.container.skipclosesnd = true
    --inst.components.container.skipopensnd = true

    inst.components.container_proxy:SetOnOpenFn(onopen)
	inst.components.container_proxy:SetOnCloseFn(onclose)

    --inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup(params) end

    --MakeSnowCovered(inst) --todo: make snow anims????? hmm
    MakeLargeBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)

    if TheWorld.components.tapestorageregistry == nil then
        --print("DEBUG: no tape storage registry")
		TheWorld:AddComponent("tapestorageregistry")
	end
	TheWorld.components.tapestorageregistry:Register(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = AttachTapeContainer

	if not POPULATING then
		AttachTapeContainer(inst)
	end

	AddHauntableDropItemOrWork(inst) --todo: test is this works

	inst:ListenForEvent("onbuilt", onbuilt)

    inst:ListenForEvent("itemget", function() --TODO: potential problems during loading for burnt thing
        if not inst:HasTag("burnt") then
            PlayStorageStateAnim(inst, "open")
        end
    end)
    inst:ListenForEvent("itemlose", function()
        if not inst:HasTag("burnt") then
            if inst.components.container ~= nil then
                if inst.components.container:IsOpen() then
                    PlayStorageStateAnim(inst, "open")
                end
            end
        end
    end)

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

return Prefab( "common/tapestorage", fn, assets, prefabs),
        --Prefab("tapestorage_tapes_some", tapes_some, assets),
        --Prefab("tapestorage_tapes_more", tapes_more, assets),
        --Prefab("tapestorage_tapes_full", tapes_full, assets),
        Prefab("tapestorage_voice", voicefn),
        MakePlacer( "common/tapestorage_placer", "tapestorage", "tapestorage", "idle", false, false, false, SCALE )

--OLD UPDATEAESTHETICS FN!

    --if number == 0 then
    --    if inst._tapes_some ~= nil then
    --        inst._tapes_some:Remove()
    --    end
    --    if inst._tapes_more ~= nil then
    --        inst._tapes_more:Remove()
    --    end
    --    if inst._tapes_full ~= nil then
    --        inst._tapes_full:Remove()
    --    end
    --    print("DEBUG: Killing all children")
    --elseif number < 0.25 then
    --    if inst._tapes_some == nil then
    --        if inst._tapes_more ~= nil then
    --            inst._tapes_more:Remove()
    --        end
    --        if inst._tapes_full ~= nil then
    --            inst._tapes_full:Remove()
    --        end
    --        print("DEBUG: spawning tapes_some")
--
    --        inst._tapes_some = SpawnPrefab("tapestorage_tapes_some")
    --        inst._tapes_some.AnimState:PlayAnimation("tapes_some")
    --        inst._tapes_some.Transform:SetScale(1, 1, 1)
    --        inst._tapes_some.entity:SetParent(inst.entity)
    --        inst._tapes_some.Transform:SetPosition(0, 0, 0)
    --        --inst._tapes_some.entity:AddFollower() --TODO: put in dotaskintime!!!!!
    --        --inst._tapes_some.Follower:FollowSymbol(inst.GUID, "tapes_anchor", 0, 0, 0)
    --    end
    --elseif number < 0.46 then
    --    if inst._tapes_more == nil then
    --        if inst._tapes_some ~= nil then
    --            inst._tapes_some:Remove()
    --        end
    --        if inst._tapes_full ~= nil then
    --            inst._tapes_full:Remove()
    --        end
    --        print("DEBUG: spawning tapes_more")
--
    --        inst._tapes_more = SpawnPrefab("tapestorage_tapes_more")
    --        inst._tapes_more.AnimState:PlayAnimation("tapes_more")
    --        inst._tapes_more.Transform:SetScale(1, 1, 1)
    --        inst._tapes_more.entity:SetParent(inst.entity)
    --        inst._tapes_more.Transform:SetPosition(0, 0, 0)
    --        --inst._tapes_more.entity:AddFollower()
    --        --inst._tapes_more.Follower:FollowSymbol(inst.GUID, "tapes_anchor", 0, 0, 0)
    --    end
    --else
    --    if inst._tapes_full == nil then
    --        if inst._tapes_some ~= nil then
    --            inst._tapes_some:Remove()
    --        end
    --        if inst._tapes_more ~= nil then
    --            inst._tapes_more:Remove()
    --        end
    --        print("DEBUG: spawning tapes_full")
--
    --        inst._tapes_full = SpawnPrefab("tapestorage_tapes_full")
    --        inst._tapes_full.AnimState:PlayAnimation("tapes_full")
    --        inst._tapes_full.Transform:SetScale(1, 1, 1)
    --        inst._tapes_full.entity:SetParent(inst.entity)
    --        inst._tapes_full.Transform:SetPosition(0, 0, 0)
    --        --inst._tapes_full.entity:AddFollower()
    --        --inst._tapes_full.Follower:FollowSymbol(inst.GUID, "tapes_anchor", 0, 0, 0)
    --    end
    --end

--OLD PREFABS!!!

--local function tapes_some()
--    local inst = CreateEntity()
--
--	inst.entity:AddTransform()
--	inst.entity:AddAnimState()
--	inst.entity:AddNetwork()
--
--	inst:AddTag("NOBLOCK")
--	inst:AddTag("NOCLICK")
--
--	inst.AnimState:SetBuild("tapestorage")
--	inst.AnimState:SetBank("tapestorage")
--	inst.AnimState:PlayAnimation("tapes_some")
--
--	inst.entity:SetPristine()
--
--	if not TheWorld.ismastersim then
--		inst.OnEntityReplicated = OnEntityReplicated
--		return inst
--    end
--
--	inst.persists = false
--
--	return inst
--end
--
--local function tapes_more()
--    local inst = CreateEntity()
--
--	inst.entity:AddTransform()
--	inst.entity:AddAnimState()
--	inst.entity:AddNetwork()
--
--	inst:AddTag("NOBLOCK")
--	inst:AddTag("NOCLICK")
--
--	inst.AnimState:SetBuild("tapestorage")
--	inst.AnimState:SetBank("tapestorage")
--	inst.AnimState:PlayAnimation("tapes_more")
--
--	inst.entity:SetPristine()
--
--	if not TheWorld.ismastersim then
--		inst.OnEntityReplicated = OnEntityReplicated
--		return inst
--    end
--
--	inst.persists = false
--
--	return inst
--end
--
--local function tapes_full()
--    local inst = CreateEntity()
--
--	inst.entity:AddTransform()
--	inst.entity:AddAnimState()
--	inst.entity:AddNetwork()
--
--	inst:AddTag("NOBLOCK")
--	inst:AddTag("NOCLICK")
--
--	inst.AnimState:SetBuild("tapestorage")
--	inst.AnimState:SetBank("tapestorage")
--	inst.AnimState:PlayAnimation("tapes_full")
--
--	inst.entity:SetPristine()
--
--	if not TheWorld.ismastersim then
--		inst.OnEntityReplicated = OnEntityReplicated
--		return inst
--    end
--
--	inst.persists = false
--
--	return inst
--end
