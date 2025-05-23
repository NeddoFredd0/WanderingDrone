function c_setitch(count)
	local player = ThePlayer
	if player ~= nil then
		local itchmeter = player.components.itchmeter
		if itchmeter ~= nil then
			--itchmeter.currentitchmeter = count or 50
			itchmeter:SetPercent(math.min(count, 1))
			print("Itch meter set to "..count)
		else
			print("No itch component found!!")
		end
	end
end

function c_setpity(count)
	local player = ThePlayer
	if player ~= nil then
		local tapefinder = player.components.tapefinder
		if tapefinder ~= nil then
			if count then
				tapefinder:SetPity(count)
				print("Set pity to "..count.."!")
			else
				tapefinder:SetPity(999999)
				print("Pity is real high!")
			end
		else
			print("No tapefinder component found!")
		end
	end
end

function c_checkcontrollerstatus()
	if TheInput ~= nil then
		if TheInput:ControllerAttached() then
			c_announce("Controller Detected!")
		else
			c_announce("No controller :(")
		end
	else
		c_announce("TheInput not valid!")
	end
end

function d_alltapes()
	c_give("tape1")
	c_give("tape2")
	c_give("tape3")
	c_give("tape4")
	c_give("tape_broadcast")
	c_give("tape_electric")
	c_give("tape_hypercast")
	c_give("tape_invis")
	c_give("tape_nightvis")
	c_give("tape_scanner")
	--c_give("tape_slowmo")
	c_give("tape_sysrestore")
	c_give("tape_pig")
	c_give("tape_lightning")
	c_give("tape_portal")
end

function c_unlockalltvskins()
	local player = ThePlayer
	if CLIENT_MOD_RPC["ModdedSkins"] and player:HasTag("tapemaker") then
		SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), player.userid, "ms_tvheadguy_rose")
	end
	if CLIENT_MOD_RPC["ModdedSkins"] and player:HasTag("tapemaker") then
		SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), player.userid, "ms_tvheadguy_triumphant")
	end
	if CLIENT_MOD_RPC["ModdedSkins"] and player:HasTag("tapemaker") then
		SendModRPCToClient(GetClientModRPC("ModdedSkins", "UnlockModdedSkin"), player.userid, "ms_tvheadguy_pirate")
	end
end