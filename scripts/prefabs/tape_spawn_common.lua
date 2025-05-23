--this whole page is super fucking messy but I cna't really be bothered to rewrite it

local function HasTape(victim)
    return not (victim:HasTag("veggie") or
                victim:HasTag("butterfly") or --butterflies have workable component, lmao
                victim:HasTag("player") or
                victim:HasTag("flower") or
                victim:HasTag("stump") or
                victim:HasTag("tvblacklistsapling") or
                victim:HasTag("tvblacklistmisc") or
                victim:HasTag("burnt") or
                victim:HasTag("tapemaker"))
        and ( victim.components.health == nil) --targets that can be worked, can drop loot, and do not have health
        --victim.components.lootdropper ~= nil --blocks tumbleweeds
end

local function ResetPity(tvdoer)
    if tvdoer ~= nil and tvdoer.components.tapefinder then
        tvdoer.components.tapefinder:ResetPity()
    end
end

local function DropRateCheck(victim) --victim, numtapes
    --print("DEBUG: DropRateCheck reached")
    --print("victim:"..tostring(victim))

    local numtapes = 0

    if victim.entity:GetPrefabName() == "tvheadguy" then
        return 0
    end
    local tvdoer
    local doer = FindClosestPlayerToInst(victim, TUNING.TVHEADGUY.TAPEFINDRANGE, true)
    if doer ~= nil and doer:HasTag("tapemaker") == nil then
        tvdoer = nil
    else
        tvdoer = doer
    end
    if doer ~= nil then
        local pity
        if tvdoer ~= nil and tvdoer.components.tapefinder then
            pity = tvdoer.components.tapefinder:GetPity()
        else
            pity = 0 --if the doer is not a tvheadguy, don't use pity chance
        end
        if victim:HasTag("tree") then
            local check = false
                if TUNING.TAPEDROPRATES.TREE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("boulder") then
            local check = false
                if TUNING.TAPEDROPRATES.BOULDER + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapehouselootdropper") then --pighouse, bunnyhouse, mermhouse
            local check = false
                if TUNING.TAPEDROPRATES.HOUSE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapeholelootdropper") then
            local check = false
                if TUNING.TAPEDROPRATES.HOLE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("grave") then
            local check = false
                if TUNING.TAPEDROPRATES.GRAVE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                if math.random() <= .5 then
                    numtapes = 2
                else
                    numtapes = 1
                end
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapemiscrarelootdropper") then
            local check = false
                if TUNING.TAPEDROPRATES.MISCRARE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                local r = math.random()
                if r <= 0.2 then
                    numtapes = 2
                elseif r <= 0.05 then
                    numtapes = 3
                else
                    numtapes = 1
                end
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapetumbleweedlootdropper") then
            local check = false
                if TUNING.TAPEDROPRATES.TUMBLE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapeunwrappablelootdropper") then
            local check = false
                if TUNING.TAPEDROPRATES.PACKAGE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapeactivateablelootdropper") then --for now just catcoon dens and wagstaff junk, may need to update this in the future
            local check = false
                if TUNING.TAPEDROPRATES.RUMMAGE + pity > math.random() then --RUMMAGE
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("tapesearchablelootdropper") then --for now just otter dens
            local check = false
                if TUNING.TAPEDROPRATES.RUMMAGE + pity > math.random() then --RUMMAGE
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim.components.pickable ~= nil then --victim:HasTag("silviculture") then 
            local check = false
                if TUNING.TAPEDROPRATES.FORAGE + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        elseif victim:HasTag("taperarelootdropper") then
            local check = false
                if TUNING.TAPEDROPRATES.JACKPOT > math.random() then --jackpot doesn't use pity system since it is a guaranteed drop
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                numtapes = 3
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 2
                return numtapes
            end
        elseif victim:HasTag("player") then
            return 0
        elseif victim ~= nil then
            local check = false
                if TUNING.TAPEDROPRATES.OTHER + pity > math.random() then
                    check = true
                end
            if check == true then
                --TheNet:SystemMessage("true return", false)
                ResetPity(tvdoer)
                numtapes = 1
                return numtapes
            else
                --TheNet:SystemMessage("false return", false)
                numtapes = 0
                return numtapes
            end
        end
    end
end

--local function GetNumSouls(victim)
--    --V2C: assume HasSoul is checked separately
--    return (victim:HasTag("dualsoul") and 2)
--        or (victim:HasTag("epic") and math.random(7, 8))
--        or 1
--end

return {
    --DoHeal = DoHeal,
    HasTape = HasTape,
    DropRateCheck = DropRateCheck,
}
