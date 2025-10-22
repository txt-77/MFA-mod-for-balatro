--- STEAMODDED HEADER
--- MOD_NAME: MFAmod
--- MOD_ID: MFAmod
--- MOD_AUTHOR: TXT ,Ghonca and Cd
--- PREFIX: MFAmod
--- MOD_DESCRIPTION: just a mod made by a group of friends
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1314c]

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Back({
    key = "teste deck",
    loc_txt = {
        name = "test deck",
        text={
        "start with the new",
        "jokers for test reasons",
        },
    },
	
	config = { hands = 0, discards = 0},
	pos = { x = 1, y = 0 },
	order = 1,
	atlas = "Decks",
    unlocked = true,

	apply = function(self)
        G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "J_mfamod_brigtheyes", "mfamod_deck")
                    card:add_to_deck()
                    --card:start_materialize()
                    G.jokers:emplace(card)
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "J_mfamod_1x", "mfamod_deck")
                    card:add_to_deck()
                    --card:start_materialize()
                    G.jokers:emplace(card)

                        for i = 1, 2 do
                        local card = create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_mfamod_shed", "mfamod_deck")
                        card:add_to_deck()
                        --card:start_materialize()
                        G.consumeables:emplace(card)
                        end

                    return true
                  end
			end,
		}))
	end,
})

----------------------------------------------
------------MOD CODE END----------------------