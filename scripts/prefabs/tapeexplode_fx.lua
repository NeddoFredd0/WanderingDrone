--------------------------------------------------------------------------
---ALL THIS CODE IS YOINKED FROM VARIOUS FX FILES IN THE BASE GAME AND THEN CHANGED SLIGHTLY

local ANIM_SMOKE_TEXTURE = "fx/animsmoke.tex"

local REVEAL_SHADER = "shaders/vfx_particle_reveal.ksh"

local COLOUR_ENVELOPE_NAME_SMOKE = "lunar_goop_cloud_colourenvelope_smoke"
local SCALE_ENVELOPE_NAME_SMOKE = "lunar_goop_cloud_scaleenvelope_smoke"

local cloudassets =
{
	Asset("IMAGE", ANIM_SMOKE_TEXTURE),
	Asset("SHADER", REVEAL_SHADER),
}

local prefabs_spell =
{
	--"shadow_pillar",
	--"shadow_pillar_target",
	"shadow_glob_fx",
}

local prefabs_lune =
{
	--"shadow_pillar",
	--"shadow_pillar_target",
	"moon_altar_link_fx",
}

--------------------------------------------------------------------------
---LUNARFX

local LUNARTRAIL_TAGS = { "lunartrail" }
local function TryLunarFX(inst, offsets, map)
	local offs1, offs2, offs3 = unpack(offsets)
	while true do --should we limit number of tries?
		local offset = table.remove(offs1, math.random(#offs1))
		local x, y, z = inst.entity:LocalToWorldSpaceIncParent(offset:Get())
		table.insert(offs3, offset)
		if map:IsPassableAtPoint(x, 0, z, true) and not map:IsGroundTargetBlocked(Vector3(x, 0, z)) then
			if #TheSim:FindEntities(x, 0, z, .7, LUNARTRAIL_TAGS) <= 0 then
				local fx = SpawnPrefab("moon_altar_link_fx")
				fx:AddTag("lunartrail")
				if fx.AnimState ~= nil then --todo: verify if animstate is valid
					fx.AnimState:SetMultColour(1.1, 1.1, 1.1, 0.75)
				end
				if map:IsOceanAtPoint(x, 0, z, true) then
					local platform = map:GetPlatformAtPoint(x, z)
					if platform ~= nil then
						fx.entity:SetParent(platform.entity)
						x, y, z = platform.entity:WorldToLocalSpace(x, 0, z)
					else
						--fx:EnableRipples(true)
					end
				end
				fx.Transform:SetPosition(x, 0, z)
			end
			break
		elseif #offs1 <= 0 then
			if #offs2 > 0 then
				--Swap in page 2 offsets
				offsets[1] = offs2
				offsets[2] = offs1
				offs1 = offs2
				offs2 = offsets[2]
			else
				--Tried all offsets, none valid
				offsets[1] = offs3
				offsets[3] = offs1
				return
			end
		end
	end

	for i = 1, #offs3 do
		table.insert(offs2, offs3[i])
		offs3[i] = nil
	end
	if #offs1 <= 0 then
		offsets[1] = offs2
		offsets[2] = offs1
	end
end

local function StartLunarFX(inst)
	local angle = math.random() * PI2
	local offsets = {}
	for i = 1, 3 do
		local radius = (i - 1) * 1.6
		local count = i > 1 and i * i - 1 or 1
		local delta = PI2 / count
		for j = 1, count do
			angle = angle + delta
			table.insert(offsets, Vector3(math.cos(angle) * radius, 0, -math.sin(angle) * radius))
		end
		angle = angle + delta * .5
	end
	inst:DoPeriodicTask(2 * FRAMES, TryLunarFX, 0, { offsets, {}, {} }, TheWorld.Map)
end

local function StopTask(inst, task)
	task:Cancel()
	inst.SoundEmitter:KillSound("loop")
end

local function lunar_fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst:AddTag("CLASSIFIED")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.SoundEmitter:PlaySound("maxwell_rework/shadow_magic/shadow_goop_ground", "loop")
	StartLunarFX(inst)
	inst:DoTaskInTime(1.25, function() inst.SoundEmitter:KillSound("loop") end)
	inst:DoTaskInTime(1.5, inst.Remove)

	inst.persists = false

	return inst
end

--------------------------------------------------------------------------
---SHADOWFX

local TRAIL_TAGS = { "shadowtrail" }
local function TryFX(inst, offsets, map)
	local offs1, offs2, offs3 = unpack(offsets)
	while true do --should we limit number of tries?
		local offset = table.remove(offs1, math.random(#offs1))
		local x, y, z = inst.entity:LocalToWorldSpaceIncParent(offset:Get())
		table.insert(offs3, offset)
		if map:IsPassableAtPoint(x, 0, z, true) and not map:IsGroundTargetBlocked(Vector3(x, 0, z)) then
			if #TheSim:FindEntities(x, 0, z, .7, TRAIL_TAGS) <= 0 then
				local fx = SpawnPrefab("shadow_glob_fx")
				if map:IsOceanAtPoint(x, 0, z, true) then
					local platform = map:GetPlatformAtPoint(x, z)
					if platform ~= nil then
						fx.entity:SetParent(platform.entity)
						x, y, z = platform.entity:WorldToLocalSpace(x, 0, z)
					else
						fx:EnableRipples(true)
					end
				end
				fx.Transform:SetPosition(x, 0, z)
			end
			break
		elseif #offs1 <= 0 then
			if #offs2 > 0 then
				--Swap in page 2 offsets
				offsets[1] = offs2
				offsets[2] = offs1
				offs1 = offs2
				offs2 = offsets[2]
			else
				--Tried all offsets, none valid
				offsets[1] = offs3
				offsets[3] = offs1
				return
			end
		end
	end

	for i = 1, #offs3 do
		table.insert(offs2, offs3[i])
		offs3[i] = nil
	end
	if #offs1 <= 0 then
		offsets[1] = offs2
		offsets[2] = offs1
	end
end

local function StartFX(inst)
	local angle = math.random() * PI2
	local offsets = {}
	for i = 1, 3 do
		local radius = (i - 1) * 1.6
		local count = i > 1 and i * i - 1 or 1
		local delta = PI2 / count
		for j = 1, count do
			angle = angle + delta
			table.insert(offsets, Vector3(math.cos(angle) * radius, 0, -math.sin(angle) * radius))
		end
		angle = angle + delta * .5
	end
	inst:DoPeriodicTask(2 * FRAMES, TryFX, 0, { offsets, {}, {} }, TheWorld.Map)
end

local function spell_fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst:AddTag("CLASSIFIED")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.SoundEmitter:PlaySound("maxwell_rework/shadow_magic/shadow_goop_ground", "loop")
	StartFX(inst)
	inst:DoTaskInTime(1.25, function() inst.SoundEmitter:KillSound("loop") end)
	inst:DoTaskInTime(1.5, inst.Remove)

	inst.persists = false

	return inst
end

local function IntColour(r, g, b, a)
	return { r / 255, g / 255, b / 255, a / 255 }
end

local function InitEnvelope()
	-- SMOKE
	EnvelopeManager:AddColourEnvelope(
		COLOUR_ENVELOPE_NAME_SMOKE,
		{
			{ 0,	IntColour(255, 255, 255, 0) },
			{ .1,	IntColour(255, 255, 255, 6) },
			{ .3,	IntColour(255, 255, 255, 12) },
		}
	)

	local smoke_max_scale = .8
	EnvelopeManager:AddVector2Envelope(
		SCALE_ENVELOPE_NAME_SMOKE,
		{
			{ 0,	{ smoke_max_scale * .6, smoke_max_scale * .6 } },
			{ 1,	{ smoke_max_scale, smoke_max_scale } },
		}
	)

	InitEnvelope = nil
	IntColour = nil
end

--------------------------------------------------------------------------
---GOOP CLOUD

local SMOKE_MAX_LIFETIME = 1.5

local function emit_smoke_fn(effect, sphere_emitter)
	local vx, vy, vz = .02 * UnitRand(), -.01 + .02 * UnitRand(), .02 * UnitRand()
	local lifetime = SMOKE_MAX_LIFETIME * (.9 + math.random() * .1)
	local px, py, pz = sphere_emitter()

	effect:AddRotatingParticle(
		0,
		lifetime,           -- lifetime
		px, py + 1, pz,     -- position
		vx, vy, vz,         -- velocity
		math.random() * 360,-- angle
		UnitRand()          -- angle velocity
	)
end

local function goop_fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()

	inst:AddTag("FX")

	inst.entity:SetPristine()

	inst.persists = false

	--Dedicated server does not need to spawn local particle fx
	if TheNet:IsDedicated() then
		inst:DoTaskInTime(3, inst.Remove)
		return inst
	elseif InitEnvelope ~= nil then
		InitEnvelope()
	end

	inst:DoTaskInTime(5, inst.Remove)

	local effect = inst.entity:AddVFXEffect()
	effect:InitEmitters(1)

	-- SMOKE
	effect:SetRenderResources(0, ANIM_SMOKE_TEXTURE, REVEAL_SHADER)
	effect:SetMaxNumParticles(0, 50)
	effect:SetRotationStatus(0, true)
	effect:SetMaxLifetime(0, SMOKE_MAX_LIFETIME)
	effect:SetColourEnvelope(0, COLOUR_ENVELOPE_NAME_SMOKE)
	effect:SetScaleEnvelope(0, SCALE_ENVELOPE_NAME_SMOKE)
	effect:SetBlendMode(0, BLENDMODE.AlphaBlended)
	effect:SetSortOrder(0, 3)
	effect:SetSortOffset(0, 0)
	effect:SetRadius(0, 3) --only needed on a single emitter
	effect:SetDragCoefficient(0, .1)

	-----------------------------------------------------

	local smoke_sphere_emitter = CreateSphereEmitter(2.5)

	local tick = GetTick()
	EmitterManager:AddEmitter(inst, nil, function()
		local t = GetTick()
		local dt = math.floor(t - tick)
		tick = t

		local parent = inst.entity:GetParent()
		if not (parent ~= nil and parent.IsCloudEnabled ~= nil and not parent:IsCloudEnabled()) then
			for i = 1, dt do
				emit_smoke_fn(effect, smoke_sphere_emitter)
			end
		end
	end)

	return inst
end

return Prefab("tapeexplode_shadow_fx", spell_fn, nil, prefabs_spell),
		Prefab("tapeexplode_lunar_fx", lunar_fn, nil, prefabs_lune),
		Prefab("tapeexplode_goopcloud_fx", goop_fn, cloudassets)