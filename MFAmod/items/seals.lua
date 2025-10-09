--- STEAMODDED HEADER
--- MOD_NAME: MFAmod
--- MOD_ID: MFAmod
--- MOD_AUTHOR: TXT ,Ghonca and Cd
--- PREFIX: MFAmod
--- MOD_DESCRIPTION: just a mod made by a group of friends
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1314c]

----------------------------------------------
------------MOD CODE -------------------------

--shedletsky seal
SMODS.Seal {
    name = "shed_Seal",
    key = "Shed",
    badge_colour = HEX("1d4fd7"),
    discovered = true,
	config = {money = 1, x_mult = 1.420  },
    loc_txt = {

        label = 'Shed Seal',
        
        name = 'Shed Seal',
        text = {
            '{C:money}$#1#{}',
            '{X:mult,C:white}X#2#{} Mult',
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.money, self.config.x_mult, } }
    end,
    atlas = "seal_atlas",
    pos = {x=0, y=0},

    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then
            return {
                dollars = self.config.money,
                x_mult = self.config.x_mult
            }
        end
    end,
}

SMODS.Atlas {
    key = "seal_atlas",
    path = "shed_seal.png",
    px = 71,
    py = 95
}



----------------------------------------------
------------MOD CODE END----------------------