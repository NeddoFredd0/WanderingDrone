return Class(function(self, inst)

assert(TheWorld.ismastersim, "tapestorageregistry should not exist on client")

--Public
self.inst = inst

--Private
local _tapestorages = {}
local _is_active = false

local function UpdateTapeStorageState()
	if POPULATING then
		if self.init_task == nil then
			self.init_task = self.inst:DoTaskInTime(0, function() UpdateTapeStorageState() self.init_task = nil end)
		end
		return
	end

	local is_active = false

	for _, v in pairs(_tapestorages) do
		if v then
			is_active = true
			break
		end
	end

	if is_active ~= _is_active then
		_is_active = is_active
		TheWorld:PushEvent("ontapestoragestatechanged", {is_active = is_active}) -- TODO: Listen for this?????
	end
end

local function OnRemoveTapeStorage(tapestorage)
	if _tapestorages[tapestorage] ~= nil then
		_tapestorages[tapestorage] = nil
		inst:RemoveEventCallback("onremove", OnRemoveTapeStorage, tapestorage)
		inst:RemoveEventCallback("onburnt", OnRemoveTapeStorage, tapestorage)
    end

    UpdateTapeStorageState()
end

local function OnUpdateTapeStorageState(world, data)
	_tapestorages[data.inst] = data.is_active == true
    UpdateTapeStorageState()
end

inst:ListenForEvent("ms_updatetapestoragestate", OnUpdateTapeStorageState)


function self:Register(tapestorage)
	if tapestorage ~= nil and _tapestorages[tapestorage] ~= nil then
		return
	end

	_tapestorages[tapestorage] = true --todo: check this

    inst:ListenForEvent("onremove", OnRemoveTapeStorage, tapestorage)
    inst:ListenForEvent("onburnt", OnRemoveTapeStorage, tapestorage)
end

function self:IsActive()
	return _is_active
end

function self:GetDebugString()
    return "Number of registered tapestorages: "..tostring(GetTableSize(_tapestorages))
end

function self:GetNumOfTapeStorages()
    --return #_tapestorages
    return (GetTableSize(_tapestorages))
end


end)