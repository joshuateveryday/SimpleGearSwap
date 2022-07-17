function get_sets()
  -- Mote 
  mote_include_version = 2
  include('Mote-Include.lua')
end

-- GearSwap File-specific Configuration
function job_setup()
  -- Messages 
  info.infoColor = 50
  info.errorColor = 028

  -- Standard Mode Options 
  state.IdleMode:options('Normal', 'DT', 'WyvernHybrid')
  state.OffenseMode:options('Normal')
  state.HybridMode:options('Normal', 'DT')
  state.WeaponskillMode:options('Normal')

  -- Custom Modes 
  state.JumpMode = M{['description'] = 'Jump Mode'}
  state.JumpMode:options('Normal', 'Spirit')
  state.WeaponMode = M{['description'] = "Weapon Mode"}
  state.WeaponMode:options('Rhongomiant', 'Naegling', 'Trishula')
  state.Weapons = state.Weapons or {
    ["Naegling"]    = {main="Naegling"   , sub="Dullahan Shield"},
    ["Trishula"]    = {main="Trishula"   , sub="Utu Grip"},
    ["Rhongomiant"] = {main="Rhongomiant", sub="Utu Grip"},
    ["ShiningOne"]  = {main="Shining One", sub="Utu Grip"},
    ["Ryunohige"]   = {main="Ryunohige"  , sub="Utu Grip"},
    ["Gungnir"]     = {main="Gungnir"    , sub="Utu Grip"}
  }

  -- Track Aftermath and Append Melee Group for these weapons 
  state.AftermathWeapons = L{'Rhongomiant', 'Ryunohige'}

  -- Keybinds 
  info.Keybinds = info.Keybinds or {
    ["f9"]  = "gs c cycle OffenseMode",
    ["^f9"] = "gs c cycle HybridMode",
    ["f10"] = "gs c cycle WeaponskillMode",
    ["f11"] = "gs c cycle WeaponMode",
    ["f12"] = "gs c cycle IdleMode",
  }
  for key, cmd in pairs(info.Keybinds) do 
    if key ~= "n" then 
      send_command("bind "..key.." "..cmd)
    end
  end

  -- Macros 
  info.macroBook = info.macroBook or 5
  info.macroPage = info.macroPage or 1
  set_macro_page(info.macroPage, info.macroBook)

  -- Lockstyle 
  info.LockstyleSet = info.LockstyleSet or 5
  windower.chat.input('/lockstyleset '..info.LockstyleSet)

  -- Spell Map 
  info.SpellMapping = {
    ['High Jump'] = 'HighJump',
    ['Spirit Jump'] = 'SpiritJump',
    ['Soul Jump'] = 'SoulJump',
    ['Spirit Surge'] = 'SpiritSurge',
    ['Fly High'] = 'FlyHigh',
    ['Spirit Link'] = 'SpiritLink',
    ['Ancient Circle'] = 'AncientCircle'
  }

  -- Handle Default Groups 
  update_combat_weapon()
  update_melee_groups()
end

function file_unload()
  if info.Keybinds then 
    -- Unbind keys 
    for key, cmd in pairs(info.Keybinds) do 
      if key ~= "n" then 
        send_command("unbind "..key)
      end
    end
  end
end

function init_gear_sets()
  file_variations = {
    player.name..'_'..player.main_job,
    player.name..'_'..player.main_job:lower(),
    player.name:lower()..'_'..player.main_job,
    player.name:lower()..'_'..player.main_job:lower(),
    player.name:capitalize()..'_'..player.main_job:lower():capitalize()
  }

  found = false 
  for i, file in ipairs(file_variations) do 
    full_path = 'gear/'..file..'_Gear.lua'
    if not found and file_exists(full_path) then 
      include(full_path)
      found = true 
    end
  end

  if not found then 
    windower.add_to_chat(msg.errorColor, 'Error: Gear File missing. Please add gear file in GearSwap/data/gear/{PlayerName}_{Job}_Gear.lua')
  end
end

-- Job Functions 

function update_combat_weapon()
  state.CombatWeapon:reset()
  state.CombatWeapon:set(state.WeaponMode.value)
  send_command('gs c update')
end

function update_melee_groups()
  classes.CustomMeleeGroups:clear()
  if buffactive['Aftermath: Lv.3'] and state.AftermathWeapons:contains(player.equipment.main) then 
    classes.CustomMeleeGroups:append('AM3')
    send_command('gs c update')
  end
end


function customize_idle_set(idleSet)
  return set_combine(idleSet, state.Weapons[state.WeaponMode.value])
end

function customize_melee_set(meleeSet)
  return set_combine(meleeSet, state.Weapons[state.WeaponMode.value])
end

function job_state_change(changedState, newValue) 
  if changedState == 'Weapon Mode' then 
    equip(state.Weapons[state.WeaponMode.value])
    state.CombatWeapon:reset()
    state.CombatWeapon:set(newValue)
    classes.CustomMeleeGroups:clear()
  end
end

function job_buff_change(buff, gained)
  if buff == 'Aftermath: Lv.3' then 
    windower.add_to_chat(info.infoColor, 'Job Buff Change: AM3')
    if state.AftermathWeapons:contains(player.equipment.main) then 
      windower.add_to_chat(info.infoColor, 'Has AM Weapon Equipped') 
      if gained then      
        send_command('timers c "Aftermath: Lv.3" 180 down')
      else 
        send_command('timers d "Aftermath: Lv.3"')
      end
      update_melee_groups()
    end
  end
end

function job_get_spell_map(spell, default_map)
  mapped_name = info.SpellMapping[spell.en]
  if mapped_name then 
    return mapped_name 
  end
  return default_map
end

function job_precast(spell, action, spellMap, eventArgs) 
  ranged_ws = {}
  if player.tp >= 1000 and player.target and player.target.type == 'MONSTER' and player.target.distance > (3.2 + player.target.model_size) and spell.type == 'WeaponSkill' and not ranged_ws:contains(spell.en) ~= true then
		cancel_spell()
		add_to_chat(3, spell.name..' Canceled: [Out of Range]')
		send_command('gs c update')
		return
	end
end

-- Utility Functions 

function file_exists(name)
  local f=io.open(windower.addon_path..'data/'..name,"r")
  if f~=nil then io.close(f) return true else return false end
end