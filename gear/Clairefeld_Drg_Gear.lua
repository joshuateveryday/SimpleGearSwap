-------------------------------------------------
-- Globals 
-------------------------------------------------

info.LockstyleSet = 10
info.macroBook = 9

function user_setup()
  state.WeaponMode:options('Trishula', 'Naegling', 'ShiningOne')
end



capes = {
  StrWSD       = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
  StoreTp      = {name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}},
  DoubleAttack = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
  Crit         = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
  MagicAcc     = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

-------------------------------------------------
-- Idle Gear 
-------------------------------------------------

sets.idle = {
  ammo="Staunch Tathlum +1",
  head="Hjarrandi Helm",
  body="Hjarrandi Breast.",
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist="Flume Belt +1",
  left_ear="Eabani Earring",
  right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
  left_ring="Warp Ring",
  right_ring="Dim. Ring (Dem)",
  back=capes.DoubleAttack
}

sets.idle.DT = set_combine(sets.idle, {
  legs={name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
})

sets.idle.WyvernHybrid = set_combine(sets.idle.DT, {
  ammo="Staunch Tathlum +1",
  head="Hjarrandi Helm",
  body="Vishap Mail +2",
  hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
  legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
  feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist="Flume Belt +1",
  left_ear="Eabani Earring",
  right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
  left_ring="Defending Ring",
  right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
})

-------------------------------------------------
-- Engaged Gear 
-------------------------------------------------

-- Default Gear for Merge
sets.engaged = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head="Flam. Zucchetto +2",
  body={ name="Valorous Mail", augments={'Accuracy+26','"Store TP"+7','Attack+2',}},
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
  feet="Flam. Gambieras +2",
  neck={ name="Vim Torque +1", augments={'Path: A',}},
  waist="Ioskeha Belt +1",
  left_ear="Sherida Earring",
  right_ear="Telos Earring",
  left_ring="Petrov Ring",
  right_ring="Niqmaddu Ring",
  back=capes.StoreTp
}
sets.engaged.DT = {
  ammo="Staunch Tathlum +1",
  head="Flam. Zucchetto +2",
  body={ name="Gleti's Cuirass", augments={'Path: A',}},
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist="Ioskeha Belt +1",
  left_ear="Sherida Earring",
  right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
  left_ring="Defending Ring",
  right_ring="Niqmaddu Ring",
  back=capes.StoreTp
}

-- Weapon: Rhongomiant 
sets.engaged.Rhongomiant = {
  ammo="Focal Orb",
  head="Hjarrandi Helm",
  body="Dagon Breast.",
  hands="Sulev. Gauntlets +2",
  legs={ name="Valorous Hose", augments={'Attack+28','"Dbl.Atk."+4','AGI+9','Accuracy+1',}},
  feet="Flam. Gambieras +2",
  neck={ name="Vim Torque +1", augments={'Path: A',}},
  waist="Tempus Fugit +1",
  left_ear="Brutal Earring",
  right_ear="Sherida Earring",
  left_ring="Petrov Ring",
  right_ring="Niqmaddu Ring",
  back=capes.DoubleAttack
}
sets.engaged.Rhongomiant.DT = sets.engaged.Rhongomiant
sets.engaged.Rhongomiant.AM3 = {}
sets.engaged.Rhongomiant.DT.AM3 = {}

-- Weapon: Ryunohige 
sets.engaged.Ryunohige = {}
sets.engaged.Ryunohige.DT = {}
sets.engaged.Ryunohige.AM3 = {}
sets.engaged.Ryunohige.DT.AM3 = {}

-- Weapon: Trishula 
sets.engaged.Trishula = sets.engaged
sets.engaged.Trishula.DT = sets.engaged.DT

-- Weapon: Naegling 
sets.engaged.Naegling = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head="Flam. Zucchetto +2",
  body={ name="Gleti's Cuirass", augments={'Path: A',}},
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Valorous Hose", augments={'Attack+28','"Store TP"+6','Accuracy+14',}},
  feet="Flam. Gambieras +2",
  neck={ name="Vim Torque +1", augments={'Path: A',}},
  waist="Ioskeha Belt +1",
  left_ear="Sherida Earring",
  right_ear="Sroda Earring",
  left_ring="Petrov Ring",
  right_ring="Niqmaddu Ring",
  back=capes.DoubleAttack
}
sets.engaged.Naegling.DT = {
  ammo="Staunch Tathlum +1",
  head="Flam. Zucchetto +2",
  body={ name="Gleti's Cuirass", augments={'Path: A',}},
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
  feet="Flam. Gambieras +2",
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist="Ioskeha Belt +1",
  left_ear="Sherida Earring",
  right_ear="Sroda Earring",
  left_ring="Defending Ring",
  right_ring="Niqmaddu Ring",
  back=capes.DoubleAttack
}

-- Weapon: Shining One 
sets.engaged.ShiningOne = sets.engaged
sets.engaged.ShiningOne.DT = sets.engaged.DT


-------------------------------------------------
-- Casting Gear 
-------------------------------------------------

sets.precast.FC = {}


-------------------------------------------------
-- Ability Gear 
-------------------------------------------------

-- Utility JAs
sets.precast.JA.SpiritSurge = {body="Ptero. Mail +3"}
sets.precast.JA.AncientCircle = {legs="Vishap Brais +3"}
sets.precast.JA.SpiritLink = {
  head="Vishap Armet +2",
  body="Ptero. Mail +3",
  hands="Pel. Vambraces +1",
  feet="Ptero. Greaves +3"
}
sets.precast.JA.Angon = {hands="Ptero. Fin. G. +3"}
sets.precast.JA.DeepBreathing = {head="Ptero. Armet +3"}

-- Jumps 

base_jump_gear = {
  ammo="Aurgelmir Orb",
  head="Hjarrandi Helm",
  body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
  hands="Vis. Fng. Gaunt. +2",
  legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
  feet="Ostro Greaves",
  neck={ name="Vim Torque +1", augments={'Path: A',}},
  waist="Ioskeha Belt +1",
  left_ear="Dedition Earring",
  right_ear="Telos Earring",
  left_ring="Moonlight Ring",
  right_ring="Moonlight Ring",
  back=capes.StoreTp
}
sets.precast.JA.Jump = set_combine(base_jump_gear, {})
sets.precast.JA.HighJump = set_combine(base_jump_gear, {})
sets.precast.JA.SpiritJump = set_combine(base_jump_gear, {feet="Pelt. Schyn. +1"})
sets.precast.JA.SoulJump = set_combine(base_jump_gear, {})


-------------------------------------------------
-- Weaponskill Gear 
-------------------------------------------------

-- Gear for low-damage skillchains
utility_skillchain_ws = {}
-- Gear for macc-based weaponskills
magic_accuracy_ws = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head={ name="Nyame Helm", augments={'Path: B',}},
  body={ name="Nyame Mail", augments={'Path: B',}},
  hands={ name="Nyame Gauntlets", augments={'Path: A',}},
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck="Sanctity Necklace",
  waist="Eschan Stone",
  left_ear="Digni. Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Stikini Ring +1",
  right_ring="Stikini Ring +1",
  back=capes.MagicAcc
}

-- Global WS Set

sets.precast.WS = {
  ammo="Knobkierrie",
  head={ name="Nyame Helm", augments={'Path: B',}},
  body={ name="Nyame Mail", augments={'Path: B',}},
  hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist="Fotia Belt",
  left_ear="Thrud Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Epaminondas's Ring",
  right_ring="Regal Ring",
  back=capes.StrWSD
}

-- Spear 

sets.precast.WS['Stardiver'] = {
  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
  head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
  body={ name="Gleti's Cuirass", augments={'Path: A',}},
  hands="Sulev. Gauntlets +2",
  legs="Sulev. Cuisses +2",
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck="Fotia Gorget",
  waist="Fotia Belt",
  left_ear="Sherida Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Niqmaddu Ring",
  right_ring="Regal Ring",
  back=capes.DoubleAttack
}
sets.precast.WS['Impulse Drive'] = {
  ammo="Knobkierrie",
  head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
  body={ name="Gleti's Cuirass", augments={'Path: A',}},
  hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
  feet={ name="Nyame Sollerets", augments={'Path: B',}},
  neck={ name="Dgn. Collar +2", augments={'Path: A',}},
  waist={ name="Sailfi Belt +1", augments={'Path: A',}},
  left_ear="Sherida Earring",
  right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
  left_ring="Niqmaddu Ring",
  right_ring="Regal Ring",
  back=capes.StrWSD
}
sets.precast.WS['Drakesbane'] = {
  ammo="Knobkierrie",
  head="Blistering Sallet +1",
  body="Hjarrandi Breast.",
  hands="Gleti's Gauntlets",
  legs="Pelt. Cuissots +1",
  feet="Gleti's Boots",
  neck="Fotia Gorget",
  waist="Fotia Belt",
  left_ear="Sherida Earring",
  right_ear="Thrud Earring",
  left_ring="Niqmaddu Ring",
  right_ring="Regal Ring",
  back=capes.Crit

}
sets.precast.WS['Leg Sweep'] = magic_accuracy_ws
sets.precast.WS['Penta Thrust'] = utility_skillchain_ws

-- Sword 

sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Stardiver']
sets.precast.WS['Red Lotus Blade'] = utility_skillchain_ws
sets.precast.WS['Flat Blade'] = utility_skillchain_ws
