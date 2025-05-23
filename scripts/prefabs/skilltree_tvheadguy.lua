local ORDERS =
{
    {"cleanfreak",           { -214+19   , 176 + 20 }}, --was +30
    {"entertainment",         { -62+5       , 176 + 30 }},
    {"rawstats",           { 66+19     , 176 + 30 }},
    {"allegiance",      { 190       , 176 + 30 }},
}

--------------------------------------------------------------------------------------------------

local H_GAP = 38
local W_GAP = 38
local H_GAP_SMALL = 30
local W_GAP_SMALL = 30
local H_GAP_LARGE = 48
local W_GAP_LARGE = 48

local STORAGEORIGIN_W = -214
local STORAGEORIGIN_H = 160 --was 176
local TAPEORIGIN_W = -56
local STATORIGIN_W = 65.5 --was 66
local AFFINITYORIGIN_W = 190

local function BuildSkillsData(SkillTreeFns)

    --LOCK DEFS
    local function MakeCleanFreakLock1(pos, connects, opentag)
        return {
            desc = STRINGS.TVSKILLTREE.LOCK1_DESC,
            pos = pos,
            group = "cleanfreak",
            tags = {"lock"},
            root = true,
            lock_open = function(prefabname, activatedskills, readonly)
                return SkillTreeFns.CountTags(prefabname, "tvskill", activatedskills) >= 8
                    --or SkillTreeFns.CountTags(prefabname, opentag, activatedskills) > 0
            end,
            connects = connects,
        }
    end

    local function MakeCleanFreakLock2(pos, connects, opentag)
        return {
            desc = STRINGS.TVSKILLTREE.LOCK2_DESC,
            pos = pos,
            group = "cleanfreak",
            tags = {"lock"},
            root = true,
            lock_open = function(prefabname, activatedskills, readonly)
                return SkillTreeFns.CountTags(prefabname, "tvtapeskill", activatedskills) >= 4
                    --or SkillTreeFns.CountTags(prefabname, opentag, activatedskills) > 0
            end,
            connects = connects,
        }
    end

    local function MakeAffinityLock1(pos, connects, opentag)
        return {
            desc = STRINGS.TVSKILLTREE.LOCK3_DESC,
            pos = pos,
            group = "allegiance",
            tags = {"lock"},
            root = true,
            lock_open = function(prefabname, activatedskills, readonly)
                local lunar_skills = SkillTreeFns.CountTags(prefabname, "lunar_favor", activatedskills)
                if lunar_skills > 0 then
                    return false
                end

                if readonly then
                    return "question"
                end

                return TheGenericKV:GetKV("fuelweaver_killed") == "1"
            end,
            connects = connects,
        }
    end

    local function MakeAffinityLock2(pos, connects, opentag)
        return {
            desc = STRINGS.TVSKILLTREE.LOCK4_DESC,
            pos = pos,
            group = "allegiance",
            tags = {"lock"},
            root = true,
            lock_open = function(prefabname, activatedskills, readonly)
                local shadow_skills = SkillTreeFns.CountTags(prefabname, "shadow_favor", activatedskills)
                if shadow_skills > 0 then
                    return false
                end

                if readonly then
                    return "question"
                end

                return TheGenericKV:GetKV("celestialchampion_killed") == "1"
            end,
            connects = connects,
        }
    end

--SKILLS
--------------------------------------------------------------------------------------------------

    local skills = {
        --STORAGE
        ------------------------------------------------------------------------------------------
        cleanfreak_lock_1 = MakeCleanFreakLock1({STORAGEORIGIN_W,STORAGEORIGIN_H}, {"tvheadguy_storage_1"}, "tvskill"),

        --Eject Functionality
        tvheadguy_storage_1 = {
            title = STRINGS.TVSKILLTREE.STORAGE_1_TITLE,
            desc = STRINGS.TVSKILLTREE.STORAGE_1_DESC,
            icon = "tvheadguy_storage_1",
            pos = {STORAGEORIGIN_W,STORAGEORIGIN_H-H_GAP},
            group = "cleanfreak",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_storage_1")
            end,
        },

        cleanfreak_lock_2 = MakeCleanFreakLock2({STORAGEORIGIN_W+W_GAP,STORAGEORIGIN_H}, {"tvheadguy_storage_2"}, "tvskill"),

        --Storage Structure Unlock
        tvheadguy_storage_2 = {
            title = STRINGS.TVSKILLTREE.STORAGE_2_TITLE,
            desc = STRINGS.TVSKILLTREE.STORAGE_2_DESC,
            icon = "tvheadguy_storage_2",
            pos = {STORAGEORIGIN_W+W_GAP,STORAGEORIGIN_H-H_GAP},
            group = "cleanfreak",
            tags = {"tvskill",},
            --onactivate = function(inst, fromload)
            --    inst:AddTag("tvheadguy_storage_2")
            --end,
            connects = {
                "tvheadguy_storage_3",
            },
            defaultfocus = true,
        },

        --Storage Remote Access Tape
        tvheadguy_storage_3 = {
            title = STRINGS.TVSKILLTREE.STORAGE_3_TITLE,
            desc = STRINGS.TVSKILLTREE.STORAGE_3_DESC,
            icon = "tvheadguy_storage_3",
            pos = {STORAGEORIGIN_W+W_GAP,STORAGEORIGIN_H-H_GAP*2},
            group = "cleanfreak",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_storage_3") --still need this tag to check if we're allowed to use the tape
            end,
            connects = {
                "tvheadguy_storage_4",
            },
        },

        --Tape Bit Disassembly
        tvheadguy_storage_4 = {
            title = STRINGS.TVSKILLTREE.STORAGE_4_TITLE,
            desc = STRINGS.TVSKILLTREE.STORAGE_4_DESC,
            icon = "tvheadguy_storage_4",
            pos = {STORAGEORIGIN_W+W_GAP,STORAGEORIGIN_H-H_GAP*3},
            group = "cleanfreak",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_storage_4")
            end,
        },

        --TAPES/ENTERTAINMENT
        ------------------------------------------------------------------------------------------

        --Research Tapes (Broadcast and Hypercast)
        tvheadguy_entertainment_1 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_1_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_1_DESC,
            icon = "tvheadguy_entertainment_research",
            pos = {TAPEORIGIN_W,176}, --should be in the middle
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_research")
            end,
        },

        --Invis Tape
        tvheadguy_entertainment_2 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_2_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_2_DESC,
            icon = "tvheadguy_entertainment_invis",
            pos = {TAPEORIGIN_W-W_GAP_SMALL*1.5,176-H_GAP_SMALL+(H_GAP_SMALL/2)},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_invis")
            end,
        },

        --Scanner Tape
        tvheadguy_entertainment_3 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_3_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_3_DESC,
            icon = "tvheadguy_entertainment_scanner",
            pos = {TAPEORIGIN_W+W_GAP_SMALL*1.5,176-H_GAP_SMALL+(H_GAP_SMALL/2)},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_scanner")
            end,
        },

        --Electric Tape
        tvheadguy_entertainment_4 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_4_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_4_DESC,
            icon = "tvheadguy_entertainment_electric",
            pos = {TAPEORIGIN_W-W_GAP_SMALL*2,176-H_GAP_SMALL*2},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_electric")
            end,
        },

        --System Restore
        tvheadguy_entertainment_5 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_5_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_5_DESC,
            icon = "tvheadguy_entertainment_sysrestore",
            pos = {TAPEORIGIN_W+W_GAP_SMALL*2,176-H_GAP_SMALL*2},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_sysrestore")
            end,
        },

        --Lightning Tape
        tvheadguy_entertainment_6 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_6_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_6_DESC,
            icon = "tvheadguy_entertainment_lightning",
            pos = {TAPEORIGIN_W-W_GAP_SMALL*1.5,176-H_GAP_SMALL*3.5},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_lightning")
            end,
        },

        --Nightvis
        tvheadguy_entertainment_7 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_7_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_7_DESC,
            icon = "tvheadguy_entertainment_nightvis",
            pos = {TAPEORIGIN_W+W_GAP_SMALL*1.5,176-H_GAP_SMALL*3.5},
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_nightvis")
            end,
        },

        --Pig Tape
        tvheadguy_entertainment_8 = {
            title = STRINGS.TVSKILLTREE.ENTERTAINMENT_8_TITLE,
            desc = STRINGS.TVSKILLTREE.ENTERTAINMENT_8_DESC,
            icon = "tvheadguy_entertainment_pig",
            pos = {TAPEORIGIN_W,176-H_GAP_SMALL*4}, --should be in the middle
            group = "entertainment",
            tags = {"tvskill", "tvtapeskill"},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_entertainment_pig")
            end,
        },

        --STAT UPGRADES
        ------------------------------------------------------------------------------------------

        --Bigger Meter
        tvheadguy_biggermeter_1 = {
            title = STRINGS.TVSKILLTREE.BIGGERMETER_1_TITLE,
            desc = STRINGS.TVSKILLTREE.BIGGERMETER_1_DESC,
            icon = "tvheadguy_biggermeter_1",
            pos = {STATORIGIN_W,170},
            group = "rawstats",
            tags = {"tvskill",},
            root = true,
            onactivate = function(inst, fromload)
                --inst:AddTag("tvheadguy_biggermeter_1")
                --inst.components.itchmeter.upgradelevel = 1
                inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_1)
            end,
            connects = {
                "tvheadguy_biggermeter_2",
            },
        },

        tvheadguy_biggermeter_2 = {
            title = STRINGS.TVSKILLTREE.BIGGERMETER_2_TITLE,
            desc = STRINGS.TVSKILLTREE.BIGGERMETER_2_DESC,
            icon = "tvheadguy_biggermeter_2",
            pos = {STATORIGIN_W,170-H_GAP_LARGE},
            group = "rawstats",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                --inst:AddTag("tvheadguy_biggermeter_2")
                --inst.components.itchmeter.upgradelevel = 2
                inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_2)
            end,
            connects = {
                "tvheadguy_biggermeter_3",
            },
        },

        tvheadguy_biggermeter_3 = {
            title = STRINGS.TVSKILLTREE.BIGGERMETER_3_TITLE,
            desc = STRINGS.TVSKILLTREE.BIGGERMETER_3_DESC,
            icon = "tvheadguy_biggermeter_3",
            pos = {STATORIGIN_W,170-H_GAP_LARGE*2},
            group = "rawstats",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                --inst:AddTag("tvheadguy_biggermeter_3")
                --inst.components.itchmeter.upgradelevel = 3
                inst.components.itchmeter:SetMax(TUNING.TVSKILLTREE.BIGGERMETER_3)
            end,
            --connects = {
            --    "tvheadguy_biggermeter_4",
            --},
        },

        --Efficient Combat Tapes
        tvheadguy_efficientcombat_1 = {
            title = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_1_TITLE,
            desc = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_1_DESC,
            icon = "tvheadguy_efficientcombat_1",
            pos = {STATORIGIN_W+W_GAP,170},
            group = "rawstats",
            tags = {"tvskill",},
            root = true,
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_efficientcombat_1")
            end,
            connects = {
                "tvheadguy_efficientcombat_2",
            },
        },

        tvheadguy_efficientcombat_2 = {
            title = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_2_TITLE,
            desc = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_2_DESC,
            icon = "tvheadguy_efficientcombat_2",
            pos = {STATORIGIN_W+W_GAP,170-H_GAP_LARGE},
            group = "rawstats",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                inst:RemoveTag("tvheadguy_efficientcombat_1")
                inst:AddTag("tvheadguy_efficientcombat_2")
            end,
            connects = {
                "tvheadguy_efficientcombat_3",
            },
        },

        tvheadguy_efficientcombat_3 = {
            title = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_3_TITLE,
            desc = STRINGS.TVSKILLTREE.EFFICIENTCOMBAT_3_DESC,
            icon = "tvheadguy_efficientcombat_3",
            pos = {STATORIGIN_W+W_GAP,170-H_GAP_LARGE*2},
            group = "rawstats",
            tags = {"tvskill",},
            onactivate = function(inst, fromload)
                inst:RemoveTag("tvheadguy_efficientcombat_1")
                inst:RemoveTag("tvheadguy_efficientcombat_2")
                inst:AddTag("tvheadguy_efficientcombat_3")
            end,
            --connects = {
            --    "tvheadguy_efficientcombat_4",
            --},
        },

        --AFFINITY
        ------------------------------------------------------------------------------------------

        --affinity_lock_1 = MakeAffinityLock1({AFFINITYORIGIN_W,186}, {"tvheadguy_affinity_shadow_find1", "tvheadguy_affinity_shadow_materials1"}, "tvskill"),

        --OLD, BEFORE SKILL BALANCE PATCH
        ----Shadow Drop Chance
        --tvheadguy_affinity_shadow_find1 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_1_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_1_DESC,
        --    icon = "tvheadguy_affinity_shadow_find1",
        --    pos = {AFFINITYORIGIN_W-W_GAP*0.75,192-H_GAP},
        --    group = "allegiance",
        --    tags = {"tvskill", "shadow_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_shadow_find1")
        --    end,
        --    connects = {
        --        "tvheadguy_affinity_shadow_find2",
        --    },
        --},
--
        --tvheadguy_affinity_shadow_find2 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_2_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_2_DESC,
        --    icon = "tvheadguy_affinity_shadow_find2",
        --    pos = {AFFINITYORIGIN_W-W_GAP*0.75,192-H_GAP*2},
        --    group = "allegiance",
        --    tags = {"tvskill", "shadow_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_shadow_find2")
        --    end,
        --},
--
        ----Shadow Rare Materials
        --tvheadguy_affinity_shadow_materials1 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_1_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_1_DESC,
        --    icon = "tvheadguy_affinity_shadow_materials1",
        --    pos = {AFFINITYORIGIN_W+W_GAP*0.75,192-H_GAP},
        --    group = "allegiance",
        --    tags = {"tvskill", "shadow_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_shadow_materials1")
        --    end,
        --    connects = {
        --        "tvheadguy_affinity_shadow_materials2",
        --    },
        --},
--
        --tvheadguy_affinity_shadow_materials2 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_2_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_2_DESC,
        --    icon = "tvheadguy_affinity_shadow_materials2",
        --    pos = {AFFINITYORIGIN_W+W_GAP*0.75,192-H_GAP*2},
        --    group = "allegiance",
        --    tags = {"tvskill", "shadow_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_shadow_materials2")
        --    end,
        --},
--
        --affinity_lock_2 = MakeAffinityLock2({AFFINITYORIGIN_W,198-H_GAP*3}, {"tvheadguy_affinity_lunar_find1", "tvheadguy_affinity_lunar_materials1"}, "tvskill"),
--
        ----Lunar Drop Chance
        --tvheadguy_affinity_lunar_find1 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_1_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_1_DESC,
        --    icon = "tvheadguy_affinity_lunar_find1",
        --    pos = {AFFINITYORIGIN_W-W_GAP*0.75,206-H_GAP*4},
        --    group = "allegiance",
        --    tags = {"tvskill", "lunar_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_lunar_find1")
        --    end,
        --    connects = {
        --        "tvheadguy_affinity_lunar_find2",
        --    },
        --},
--
        --tvheadguy_affinity_lunar_find2 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_2_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_2_DESC,
        --    icon = "tvheadguy_affinity_lunar_find2",
        --    pos = {AFFINITYORIGIN_W-W_GAP*0.75,206-H_GAP*5},
        --    group = "allegiance",
        --    tags = {"tvskill", "lunar_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_lunar_find2")
        --    end,
        --},
--
        ----Lunar Rare Materials
        --tvheadguy_affinity_lunar_materials1 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_1_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_1_DESC,
        --    icon = "tvheadguy_affinity_lunar_materials1",
        --    pos = {AFFINITYORIGIN_W+W_GAP*0.75,206-H_GAP*4},
        --    group = "allegiance",
        --    tags = {"tvskill", "lunar_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_lunar_materials1")
        --    end,
        --    connects = {
        --        "tvheadguy_affinity_lunar_materials2",
        --    },
        --},
--
        --tvheadguy_affinity_lunar_materials2 = {
        --    title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_2_TITLE,
        --    desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_2_DESC,
        --    icon = "tvheadguy_affinity_lunar_materials2",
        --    pos = {AFFINITYORIGIN_W+W_GAP*0.75,206-H_GAP*5},
        --    group = "allegiance",
        --    tags = {"tvskill", "lunar_favor",},
        --    onactivate = function(inst, fromload)
        --        inst:AddTag("tvheadguy_affinity_lunar_materials2")
        --    end,
        --},

        affinity_lock_1 = MakeAffinityLock1({AFFINITYORIGIN_W,186}, {"tvheadguy_affinity_shadow_find2", "tvheadguy_affinity_shadow_tapeexplode"}, "tvskill"),
        affinity_lock_2 = MakeAffinityLock2({AFFINITYORIGIN_W,198-H_GAP*3}, {"tvheadguy_affinity_lunar_find2", "tvheadguy_affinity_lunar_tapeexplode"}, "tvskill"),

        --NEW SHADOW LEFT COLUMN

        tvheadguy_affinity_shadow_find2 = {
            title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_2_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_FIND_2_DESC,
            icon = "tvheadguy_affinity_shadow_find1",
            pos = {AFFINITYORIGIN_W-W_GAP*0.75,192-H_GAP},
            group = "allegiance",
            tags = {"tvskill", "shadow_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_shadow_find2")
            end,
            connects = {
                "tvheadguy_affinity_shadow_materials2",
            },
        },

        tvheadguy_affinity_shadow_materials2 = {
            title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_2_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_MATERIALS_2_DESC,
            icon = "tvheadguy_affinity_shadow_materials1", --prefer this icon
            pos = {AFFINITYORIGIN_W-W_GAP*0.75,192-H_GAP*2},
            group = "allegiance",
            tags = {"tvskill", "shadow_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_shadow_materials2")
            end,
        },

        --NEW SHADOW RIGHT COLUMN

        tvheadguy_affinity_shadow_tapeexplode = {
            title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_TAPEEXPLODE_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_TAPEEXPLODE_DESC,
            icon = "tvheadguy_affinity_shadow_find2",
            pos = {AFFINITYORIGIN_W+W_GAP*0.75,192-H_GAP},
            group = "allegiance",
            tags = {"tvskill", "shadow_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_shadow_tapeexplode")
            end,
            connects = {
                "tvheadguy_affinity_shadow_tapeupgrade",
            },
        },

        tvheadguy_affinity_shadow_tapeupgrade = {
            title = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_TAPEUPGRADE_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_SHADOW_TAPEUPGRADE_DESC,
            icon = "tvheadguy_affinity_shadow_materials2",
            pos = {AFFINITYORIGIN_W+W_GAP*0.75,192-H_GAP*2},
            group = "allegiance",
            tags = {"tvskill", "shadow_favor",},
            onactivate = function(inst, fromload)
                --no tag, as it is a recipe skill
            end,
        },

        --NEW LUNAR LEFT COLUMN

        tvheadguy_affinity_lunar_find2 = {
            title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_2_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_FIND_2_DESC,
            icon = "tvheadguy_affinity_lunar_find1",
            pos = {AFFINITYORIGIN_W-W_GAP*0.75,206-H_GAP*4},
            group = "allegiance",
            tags = {"tvskill", "lunar_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_lunar_find2")
            end,
            connects = {
                "tvheadguy_affinity_lunar_materials2",
            },
        },

        tvheadguy_affinity_lunar_materials2 = {
            title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_2_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_MATERIALS_2_DESC,
            icon = "tvheadguy_affinity_lunar_materials1",
            pos = {AFFINITYORIGIN_W-W_GAP*0.75,206-H_GAP*5},
            group = "allegiance",
            tags = {"tvskill", "lunar_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_lunar_materials2")
            end,
        },

        --NEW LUNAR RIGHT COLUMN

        tvheadguy_affinity_lunar_tapeexplode = {
            title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_TAPEEXPLODE_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_TAPEEXPLODE_DESC,
            icon = "tvheadguy_affinity_lunar_find2",
            pos = {AFFINITYORIGIN_W+W_GAP*0.75,206-H_GAP*4},
            group = "allegiance",
            tags = {"tvskill", "lunar_favor",},
            onactivate = function(inst, fromload)
                inst:AddTag("tvheadguy_affinity_lunar_tapeexplode")
            end,
            connects = {
                "tvheadguy_affinity_lunar_tapeupgrade",
            },
        },

        tvheadguy_affinity_lunar_tapeupgrade = {
            title = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_TAPEUPGRADE_TITLE,
            desc = STRINGS.TVSKILLTREE.AFFINITY_LUNAR_TAPEUPGRADE_DESC,
            icon = "tvheadguy_affinity_lunar_materials2",
            pos = {AFFINITYORIGIN_W+W_GAP*0.75,206-H_GAP*5},
            group = "allegiance",
            tags = {"tvskill", "lunar_favor",},
            onactivate = function(inst, fromload)
                --no tag, as it is a recipe skill
            end,
        },
    }

    return {
        SKILLS = skills,
        ORDERS = ORDERS,
    }
end

return BuildSkillsData
