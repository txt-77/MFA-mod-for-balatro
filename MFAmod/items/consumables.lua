--- STEAMODDED HEADER
--- MOD_NAME: MFAmod
--- MOD_ID: MFAmod
--- MOD_AUTHOR: TXT ,Ghonca and Cd
--- PREFIX: MFAmod
--- MOD_DESCRIPTION: just a mod made by a group of friends
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1314c]

----------------------------------------------
------------MOD CODE -------------------------

--fried chicken
SMODS.Consumable {
    set = "Spectral",
    key = "shed",
    discovered = true,
	config = {
        max_highlighted = 1,
        extra = 'seel_shed',
    },
    loc_vars = function(self, info_queue, card)
        
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'shed Chicken',
        text = {
            "Select {C:attention}#1#{} card to",
            "apply {C:attention}shed Seal{}"
        }
    },
    cost = 4,
    atlas = "shed_atlas",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i]:set_seal(card.ability.extra, nil, true)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}

SMODS.Atlas {
    key = "shed_atlas",
    path = "chicken.png",
    px = 71,
    py = 95
}


----------------------------------------------
------------MOD CODE END----------------------