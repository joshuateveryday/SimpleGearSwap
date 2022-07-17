# Simple GearSwap Files

Just simple GearSwap files. Easy to use, easy to debug.

## Config Options

Each gear file has a couple options/overrides that can be provided for things like lockstyle, macros, weapon cycles, etc.

```lua
-------------------------------------------------
-- Globals
-------------------------------------------------

info.LockstyleSet = 9
info.macroBook = 10

function user_setup()
  state.WeaponMode:options('Godhands', 'Karambit', 'KajaStaff')
end
```

## Directory Structure

The main job file (MNK.lua, DRG.lua, etc) goes in `addons/GearSwap/data` while the gear file (Clairefeld_Drg_Gear.lua) goes in `addons/GearSwap/data/gear`.
