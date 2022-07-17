-------------------------------------------------
-- Globals 
-------------------------------------------------

info.LockstyleSet = 9
info.macroBook = 10

function user_setup()
  state.WeaponMode:options('Godhands', 'Karambit', 'KajaStaff')
end

Capes = {
  VitWSD       = {name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}},
  StoreTp      = {name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%'}},
  Crit         = {name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10'}},
}

-------------------------------------------------
-- Idle Gear 
-------------------------------------------------

sets.idle = {
  ammo="Staunch Tathlum +1",
  head="Malignance Chapeau",
  body="Malignance Tabard",
  hands="Malignance Gloves",
  legs="Malignance Tights",
  feet="Malignance Boots",
  neck="Mnk. Nodowa +2",
  waist="Engraved Belt",
  left_ear="Tuisto Earring",
  right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
  left_ring="Warp Ring",
  right_ring="Dim. Ring (Dem)",
  back=Capes.StoreTp
}

sets.idle.DT = sets.idle

-------------------------------------------------
-- Engaged Gear 
-------------------------------------------------

-- Default Gear for Merge
sets.engaged = {
  ammo="Coiste Bodhar",
  head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
  body="Ken. Samue +1",
  hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
  legs="Ken. Hakama +1",
  feet="Ken. Sune-Ate +1",
  neck="Mnk. Nodowa +2",
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear="Telos Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Chirich Ring +1",
  back=Capes.StoreTp
}

sets.engaged.DT = set_combine(sets.engaged, {
  head="Malignance Chapeau",
  body="Malignance Tabard",
  hands="Malignance Gloves",
  legs="Malignance Tights",
  feet="Malignance Boots",
})

-- Weapon: Godhands 
sets.engaged.Godhands = sets.engaged
sets.engaged.Godhands.DT = sets.engaged.DT

-- Weapon: Glanzfaust
sets.engaged.Glanzfaust = {}
sets.engaged.Glanzfaust.DT = {}
sets.engaged.Glanzfaust.AM3 = {}
sets.engaged.Glanzfaust.DT.AM3 = {}

-- Weapon: Karambit
sets.engaged.Karambit = sets.engaged
sets.engaged.Karambit.DT = sets.engaged.DT

-- Weapon: Verethragna
sets.engaged.Verethragna = sets.engaged
sets.engaged.Verethragna.AM3 = set_combine(sets.engaged.Verethragna, {})
sets.engaged.Verethragna.DT = sets.engaged.DT
sets.engaged.Verethragna.DT.AM3 = set_combine(sets.engaged.Verethragna.DT, {})

-- Weapon: Kaja Staff
sets.engaged.KajaStaff = sets.engaged
sets.engaged.KajaStaff.DT = sets.engaged.DT


-------------------------------------------------
-- Casting Gear 
-------------------------------------------------

sets.precast.FC = {}


-------------------------------------------------
-- Ability Gear 
-------------------------------------------------

-- Does monk even have abilities...
sets.precast.JA.Chakra = {}

-------------------------------------------------
-- Weaponskill Gear 
-------------------------------------------------

-- Gear for low-damage skillchains
utility_skillchain_ws = {}
-- Gear for macc-based weaponskills
magic_accuracy_ws = {
  ammo="Pemphredo Tathlum",
  head="Malignance Chapeau",
  body="Malignance Tabard",
  hands="Malignance Gloves",
  legs="Malignance Tights",
  feet="Malignance Boots",
  neck="Moonlight Necklace",
  waist="Eschan Stone",
  left_ear="Digni. Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Stikini Ring +1",
  right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
  back="Sacro Mantle",
}

-- Global WS Set

sets.precast.WS = {
  ammo="Knobkierrie",
  head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
  body="Ken. Samue +1",
  hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
  legs="Ken. Hakama +1",
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck="Mnk. Nodowa +2",
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear="Odr Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}

-- Hand-to-Hand
sets.precast.WS['Victory Smite'] = {
  ammo="Knobkierrie",
  head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
  body="Ken. Samue +1",
  hands="Ryuo Tekko +1",
  legs="Ken. Hakama +1",
  feet="Ken. Sune-Ate +1",
  neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear="Odr Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.Crit
}
sets.precast.WS['Howling Fist'] = {
  ammo="Knobkierrie",
  head={ name="Mpaca's Cap", augments={'Path: A',}},
  body={ name="Nyame Mail", augments={'Path: B',}},
  hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
  legs={ name="Mpaca's Hose", augments={'Path: A',}},
  feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Accuracy+9',}},
  neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
  waist="Moonbow Belt +1",
  left_ear="Odr Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}
sets.precast.WS['Shijin Spiral'] = {
  ammo="Knobkierrie",
  head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
  body="Ken. Samue +1",
  hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
  legs="Ken. Hakama +1",
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck="Mnk. Nodowa +2",
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear="Odr Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}
sets.precast.WS['Raging Fists'] = {
  ammo="Knobkierrie",
  head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
  body="Ken. Samue +1",
  hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
  legs="Ken. Hakama +1",
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck="Mnk. Nodowa +2",
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear="Odr Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}

sets.precast.WS['Tornado Kick'] = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head={ name="Mpaca's Cap", augments={'Path: A',}},
  body={ name="Nyame Mail", augments={'Path: B',}},
  hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
  legs={ name="Mpaca's Hose", augments={'Path: A',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}
sets.precast.WS['Dragon Kick'] = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head={ name="Mpaca's Cap", augments={'Path: A',}},
  body={ name="Nyame Mail", augments={'Path: B',}},
  hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
  legs={ name="Mpaca's Hose", augments={'Path: A',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
  waist="Moonbow Belt +1",
  left_ear="Sherida Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Niqmaddu Ring",
  right_ring="Gere Ring",
  back=Capes.VitWSD
}

-- Staff 
sets.precast.WS['Shell Crusher'] = magic_accuracy_ws
