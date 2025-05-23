local assets=
{
    Asset("ANIM", "anim/tape1.zip"),

    Asset("ATLAS", "images/inventoryimages/tape1.xml"),
    Asset("IMAGE", "images/inventoryimages/tape1.tex"),
}

local prefabs =
{
	"tapebits_1",
	"tapebits_2",
	"tapebits_3",
	"tapebits_busted",
	"trinket_6",
	"trinket_9",
	"trinket_17",
	"trinket_27",
	"trinket_22",
	"trinket_24",
}

local function onpickup(inst)
    inst.SoundEmitter:PlaySound("tvheadguy/tv_tape/tapepickup")
end

SetSharedLootTable('tape1loot',
{
	{"tapebits_2", 1.00},  --shell
	{"tapebits_3", 0.33},  --mechanical bits
	{"tapebits_1", 0.05},  --magnetic tape
	{"tapebits_busted", 0.5},
	{"tapebits_busted", 0.25},
	{"trinket_6", 0.03}, --frazzled wires
	{"trinket_9", 0.01}, --mismatched buttons
})

local function OnHaunt(inst, haunter)
	if math.random() > TUNING.HAUNT_CHANCE_HALF then
    	inst.components.lootdropper:DropLoot()
		SpawnPrefab("fx_tapebreak").Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst:Remove()
	end
    return true
end

local MUST_TAGS = {"player", "tapemaker"}

local function tape_spookyfx_onground(inst)
	local x, y, z = inst.Transform:GetWorldPosition() --returning 0, 0, 0 fsr
	local players = TheSim:FindEntities(x, y, z, 35, MUST_TAGS)
	local shadow
	local lunar

	for k, tvhead in pairs(players) do
		if tvhead:HasTag("tvheadguy_affinity_shadow_materials2") or tvhead:HasTag("tvheadguy_affinity_shadow_tapeexplode") then
			shadow = true
		elseif tvhead:HasTag("tvheadguy_affinity_lunar_materials2") or tvhead:HasTag("tvheadguy_affinity_lunar_tapeexplode") then
			lunar = true
		else
			return
		end
	end
	if inst.fx == nil and shadow == true then
		inst.fx = SpawnPrefab("tophat_shadow_fx")
	else
		--inst.fx.Follower:StopFollowing()
		--inst.fx.Transform:SetPosition(0, 0, 0)
	end
	if inst.fx == nil and lunar == true then
		--print("DEBUG: lunar fn reached!")
		--inst.fx = SpawnPrefab("moon_altar_link_fx")
		----inst:DoPeriodicTask(0.75, function() inst.fx = SpawnPrefab("moon_altar_link_fx") end)
		--inst.fx:ListenForEvent("animover", function() print("DEBUG: animover reached!") inst.fx = SpawnPrefab("moon_altar_link_fx") end)
		----inst.fx = SpawnPrefab("tophat_shadow_fx")
		----inst.fx.entity:AddAnimState() --TODO: TEST!!!
		----inst.fx.AnimState:SetAddColour(1, 1, 1, 0.75) --try to make it white --can't call animstate on some things?
		inst.fx = SpawnPrefab("tape_lunar_fx")
	else
		--inst.fx.Follower:StopFollowing()
		--inst.fx.Transform:SetPosition(0, 0, 0)
	end
	if inst.fx ~= nil then
		inst.fx.entity:SetParent(inst.entity)
	end

	--inst.components.inspectable:SetNameOverride("tape1_cursed")
	--inst:AddTag("tvheadguy_affinity_cursed")

end

--local function GetStatus(inst)
--	if inst:HasTag("tvheadguy_affinity_cursed") then
--		return "CURSED"
--	end
--end

--local function on_furniture_placed(inst, furnituredecor)
--end

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tape1")
    inst.AnimState:SetBuild("tape1")
    inst.AnimState:PlayAnimation("idle") --anim:PlayAnimation("idle_90s")

	MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

	--inst.pickupsound = "tv_tape"

	inst:AddTag("jacketpocketfit")
	inst:AddTag("bait")
	inst:AddTag("molebait")
	inst:AddTag("cattoy")
	inst:AddTag("cursed") --TEMP FIX! Get rid of this if klei fixes GetGrandOwner() wobot crash! --"irreplaceable" tag also works

	--inst:AddTag("furnituredecor") -- From "furnituredecor", for optimization

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end

	--local furnituredecor = inst:AddComponent("furnituredecor")
    --furnituredecor.onputonfurniture = on_furniture_placed(inst, furnituredecor)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tape1"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tape1.xml"

	inst.components.inventoryitem:SetOnPickupFn(onpickup)

	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

	inst.components.inventoryitem.onputininventoryfn = function(inst, player)
		local owner = inst.components.inventoryitem:GetGrandOwner()
		if owner ~= nil and owner.components.inventory and owner:HasTag("player") and owner.prefab ~= "tvheadguy" then
			inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			if owner.components.talker ~= nil then
				owner:DoTaskInTime(0.2, function()
					if owner.prefab == "wilson" or owner.prefab == "willow" or owner.prefab == "wolfgang" or owner.prefab == "wendy" or owner.prefab == "wx78" or owner.prefab == "wickerbottom" or
					owner.prefab == "woodie" or owner.prefab == "waxwell" or owner.prefab == "wathgrithr" or owner.prefab == "webber" or owner.prefab == "warly" or owner.prefab == "winona" or
					owner.prefab == "walter" or owner.prefab == "wortox" or owner.prefab == "wormwood" or owner.prefab == "wurt" or owner.prefab == "wanda" then
						owner.components.talker:Say(STRINGS.TAPETHIEVERY[string.upper(owner.prefab)])
					else
						owner.components.talker:Say(STRINGS.TAPETHIEVERY.GENERIC)
					end
				end)
			end
			end)
		end
	end

	local owner = inst.components.inventoryitem.owner or nil
	if owner == nil and not inst:IsInLimbo() then
		inst:DoTaskInTime(0, function() tape_spookyfx_onground(inst) end)
	end

--STRINGS.NAMES.TAPE1 = "Memories"

	inst:AddComponent("inspectable")
	--inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable('tape1loot')

	inst:AddComponent("tapejunk_disassemble")
	inst:AddComponent("tape_furnituredecor")

	--MakeHauntableLaunch(inst)
	inst:AddComponent("hauntable")
    --inst.components.hauntable.cooldown_on_successful_haunt = false
    inst.components.hauntable.usefx = false
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_MEDIUM)
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

    return inst
end

return  Prefab("common/inventory/tape1", fn, assets, prefabs)