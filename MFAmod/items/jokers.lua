--- STEAMODDED HEADER
--- MOD_NAME: MFAmod
--- MOD_ID: MFAmod
--- MOD_AUTHOR: TXT ,Ghonca and Cd
--- PREFIX: MFAmod
--- MOD_DESCRIPTION: just a mod made by a group of friends
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1314c]

----------------------------------------------
------------MOD CODE -------------------------

-- brigtheyes
SMODS.Atlas{
    key = 'brigtheyes',
    path = 'jackblack.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'brigtheyes',
    loc_txt= {
        name = 'brigtheyes',
        text = {
             "Played cards with a Shed Seal ",
             "give {X:mult,C:white}X#1#{} Mult",
        }
    },
    atlas = 'brigtheyes',
    rarity = 2,
    cost = 8,
    pools = {["MFAmodaddition"] = true},
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x=0, y= 0},
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.other_card.seal == "MFAmod_shed_Seal" then 
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = "X" .. card.ability.extra.Xmult
                }
            end
        end
    end
}
--1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x
SMODS.Atlas{
    key = '1x',
    path = '1x1x1x1.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = '1x',
    loc_txt= {
        name = '1x1x1x1',
        text = {
            "If played card has",
            "a Shed Seal remove it and",
            "gain {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)"
        }
    },
    atlas = '1x',
    rarity = 3,
    cost = 10,
    pools = {["MFAmodaddition"] = true},
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x=0, y=0},
    config = {
        extra = {
            Xmult = 1,
            Xmultgain = 3
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.Xmultgain,
                center.ability.extra.Xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult
            }
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == "MFAmod_shed_Seal" then 
                card:set_seal(nil)
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultgain
                return {
                    message = 'Im gonna kill that shedletsky!',
                    colour = G.C.XMult
                }
            end
        end
    end
}


--kitsune
SMODS.Atlas{
    key = 'kit',
    path = 'kitsune.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'kit',
    loc_txt= {
        name = 'kitsune',
        text = {
            "At the end of a round",
            "gain {C:money}+#1#{} of sell value",
            "{C:inactive,S:0.6}A better egg i guess?{}",
            "{C:inactive,S:0.6}and a reference of a meme{}"
        }
    },
    atlas = 'kit',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    pools = {["MFAmodaddition"] = true},
    rarity = 1,
    cost = 100,
    pos = { x = 0, y = 10 },
    config = { extra = { price = 15 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.price } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.price
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

--guest
SMODS.Atlas{
    key = 'guest',
    path = 'guest.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'guest',
    loc_txt= {
        name = 'guest 1337',
        text = {
            "{C:green}1 in 4{}chance to",
            "cut the blind by 1/3 of the ",
            "requeried score in the start of a round",
        }
    },
    atlas = 'gue',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    pools = {["MFAmodaddition"] = true},
    rarity = 2,
    cost = 13,
    pos = { x = 0, y = 10 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
    calculate = function(self, card, context)
        if context.setting_blind  then
            if pseudorandom('guest') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.GAME.blind.chips = G.GAME.blind.chips - G.GAME.blind.chips/3
                return {
                    message = "PUNCH!",
                }
        end
    end
}

--fatass teto
SMODS.Atlas{
    key = 'teto',
    path = 'teto.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'teto',
    loc_txt= {
        name = 'Kasane "fatass" Teto',
        text = {
            "If played hand is a ",
            "hearths straight flush",
            "gain {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)"
        }
    },
    atlas = 'teto',
    rarity = 2,
    cost = 8,
    pools = {["MFAmodaddition"] = true},
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x=0, y=0},
    config = {
        extra = {
            Xmult = 1,
            Xmultgain = 15,
            type = 'Straight flush',
            suit = 'Hearts'
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {  center.ability.extra.Xmultgain,center.ability.extra.Xmult,card.ability.extra.suit } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult
            }
        end
        if context.end_of_round and context.game_over == false and next(context.poker_hands[card.ability.extra.type])and context.cardarea == G.play and
        context.other_card:is_suit(card.ability.extra.suit) then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultgain
                return {
                    message = 'fat ass',
                    colour = G.C.XMult
                }
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------