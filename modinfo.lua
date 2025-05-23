-- This information tells other players more about the mod
name = "Wandering Drone (Skilltree Update!)"
description =
[[
Patch Notes: (0.2.0.4 Bugfix)
- Fixed crash when using Cyclical Life with Don't Starve: Alone
(DS:A still causes many other visual and gameplay issues with WD, playing with both mods enabled is still not recommended)

Major skilltree update - focusing on the Affinity tree, and the Media Archive.
- Affinity tree has 4 brand new skills (2 for each side.)
- 2 brand new late game craftable tapes!
- New gameplay effects for taking apart tape junk
- When a Media Archive is built, all tapes have a chance to cost 0 durability
- A bunch of changes to make the Archive and Apportation tape much more useable!
- Rebalances to the combat tapes, hopefully making them more even in terms of power
- And plenty more balances/changes etc, viewable on the Steam Workshop

(NOTE: Enable Modded Skins API for 3 fancy-schmancy custom skins!)
Play as the strange Wandering Drone, an entertainment construct escaped from a far off facility - it's origin as mysterious to itself as those around it.

Dig up a modicum of secrets, regrets, and memories. 
Turn them into powerful abilities you can use to enhance your survival experience.

However, you must maintain a mysterious Itch in order to not self-destruct. Entertainment is your purpose, after all.
]]
author = "NeddoFreddo"
version = "0.2.0.4" -- 0.2.0.4 Bugfix

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false

-- Character mods need this set to true
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
"tv head guy",
"tvheadguy",
"tv_head_guy",
"wandering drone",
"wandering_drone",
"freddo films",
"freddo_films",
}

--credit: Gesture Wheel mod
local KEY_A = 65
local keyslist = {}
local string = ""
for i = 1, 26 do
	local ch = string.char(KEY_A + i - 1)
	keyslist[i] = {description = ch, data = ch}
end

configuration_options =
{
	{
		name = "EJECTKEY",
		label = "Eject Keyboard Bind",
		hover = "Keyboard keybind for the Eject skill.",
		options = keyslist,
		default = "R",
	},
    {
		name = "EJECTCONTROL",
		label = "Eject Controller Button/s",
		hover = "Controller button options for the Eject skill.\nWarning: some options conflict with base game controls.",
		options = {
			{description = "[No Bind]", data = 0}, --no bind option for conflicts
            {description = "\238\128\141", data = 1}, --left dpad
            {description = "\238\128\135 and \238\128\138", data = 2}, --left and right bumpers
            {description = "\238\128\134 and \238\128\137", data = 3}, --left stick and right stick press

        },
		default = 2,
	},

}

--configuration_options = {
--    {
--        name = "TVFLICKEREFFECTS_ON",
--        label = "Flickering Lighting Effects (Experimental)",
--        options =    {
--                        {description = "Off", data = false},
--                        {description = "On", data = true},
--                    },
--        default = false,
--        hover = "(Experimental) Special lighting effects when abilities are active. May cause photosensitivity issues."
--    },
--}