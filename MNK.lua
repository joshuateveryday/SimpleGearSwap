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
  state.IdleMode:options('Normal', 'DT')
  state.OffenseMode:options('Normal')
  state.HybridMode:options('Normal', 'DT')
  state.WeaponskillMode:options('Normal')

  -- Custom Modes 
  state.ImpetusHitCount = 0
  state.WeaponMode = M{['description'] = "Weapon Mode"}
  state.WeaponMode:options('Verethragna', 'Godhands')
  state.Weapons = state.Weapons or {
    ["Spharai"]     = {main="Spharai",sub=nil},
    ["Godhands"]    = {main="Godhands",sub=nil},
    ["Verethragna"] = {main="Verethragna",sub=nil},
    ["Glanzfaust"]  = {main="Glanzfaust",sub=nil},
    ["Karambit"]    = {main="Karambit",sub=nil},
    ["KajaStaff"]  = {main="Kaja Staff",sub="Dilet.'s Grip +1"},
  }

  -- Track Aftermath and Append Melee Group for these weapons 
  state.AftermathWeapons = L{'Verethragna', 'Glanzfaust'}

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
  info.macroBook = info.macroBook or 1
  info.macroPage = info.macroPage or 1
  set_macro_page(info.macroPage, info.macroBook)

  -- Lockstyle 
  info.LockstyleSet = info.LockstyleSet or 1
  windower.chat.input('/lockstyleset '..info.LockstyleSet)

  -- Spell Map 
  info.SpellMapping = {
    ['Utsusemi: Ni'] = 'Utsusemi',
    ['Utsusemi: Ichi'] = 'Utsusemi'
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
  weapon_set = set_combine(meleeSet, state.Weapons[state.WeaponMode.value])
  if buffactive['Impetus'] then 
    weapon_set = set_combine(wepaon_set, {body="Bhikku Cyclas +1"})
  end
  return weapon_set
end

function job_state_change(changedState, newValue) 
  if changedState == 'Weapon Mode' then 
    state.CombatWeapon:reset()
    state.CombatWeapon:set(newValue)
    classes.CustomMeleeGroups:clear()
    send_command('gs c update')
  end
end

function job_buff_change(buff, gained)
  if buff == 'Aftermath: Lv.3' then 
    if state.AftermathWeapons:contains(player.equipment.main) then 
      if gained then      
        send_command('timers c "Aftermath: Lv.3" 180 down')
      else 
        send_command('timers d "Aftermath: Lv.3"')
      end
      update_melee_groups()
    end
  elseif buff == 'Impetus' then 
    send_command('gs c update')
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

function job_post_precast(spell, action, spellMap, eventArgs) 
  if spell.type == 'WeaponSkill' and spell.en == 'Victory Smite' and buffactive['Impetus'] then
    equip({body="Bhikku Cyclas +1"})
  end
end

-- Utility Functions 



function impetus_action_tracker(action) 
  if buffactive['Impetus'] then 
    -- Keep track of previous count 
    previous_count = state.ImpetusHitCount 

    if action.actor_id == player.id then -- Actions done by player 
      if action.category == 1 then -- Melee Hit 

        for _, target in pairs(action.targets) do 
          for _, action in pairs(target.actions) do 
            -- Reactions (bitset):
            -- 1 = evade
            -- 2 = parry
            -- 4 = block/guard
            -- 8 = hit
            -- 16 = JA/weaponskill?
            -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.

            if (action.reaction % 4) > 0 then 
              windower.add_to_chat(info.infoMsg, 'Missing an attack, Impetus hit count reset to 0')
              state.ImpetusHitCount = 0
            else 
              state.ImpetusHitCount = state.ImpetusHitCount + 1
            end
          end
        end
      
      elseif action.category == 3 then 
        -- Missed weaponskill hits will reset the counter.  Can we tell?
        -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
        -- Can't tell if any hits were missed, so have to assume all hit.
        -- Increment by the minimum number of weaponskill hits: 2.

        for _, target in pairs(action.targets) do
          for _, action in pairs(target.actions) do 
            if (action.reaction % 4) > 0 then 
              windower.add_to_chat(info.infoMsg, 'Missing an attack, Impetus hit count reset to 0')
              state.ImpetusHitCount = 0
            else 
              state.ImpetusHitCount = state.ImpetusHitCount + 2
            end
          end
        end

      end
    
    elseif action.actor_id ~= player.id and action.category == 1 then 

      for _, target in pairs(action.targets) do 
        if target.id == player.id then 

          for _, action in pairs(target.actions) do 
            -- Spike effect animation:
            -- 63 = counter
            -- ?? = missed counter

            if action.has_spike_effect then 
              -- spike_effect_message of 592 == missed counter
              if action.spike_effect_message == 592 then 
                windower.add_to_chat(info.infoMsg, 'Missing a counter, Impetus hit count reset to 0')
                state.ImpetusHitCount = 0
              elseif action.spike_effect_animation == 63 then 
                state.ImpetusHitCount = state.ImpetusHitCount + 1
              end
            end
          end

        end
      end

    end
    
    if state.ImpetusHitCount > previous_count then 
      windower.add_to_chat(info.infoMsg, 'Current Impetus hit count: ' .. tostring(state.ImpetusHitCount))
    end
  else 
    state.ImpetusHitCount = 0
  end
end

function file_exists(name)
  local f=io.open(windower.addon_path..'data/'..name,"r")
  if f~=nil then io.close(f) return true else return false end
end

windower.raw_register_event('action', impetus_action_tracker)