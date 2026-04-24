if Cryptid then
    SMODS.Seal {
        key = 'strange',
        atlas = 'statclock',
        pos = { x = 1, y = 0 },
        config = {
            extra = {
                change = 2,
            }
        },
        badge_colour = HEX('ED712B'),
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                card.ability.perma_mult = card.ability.perma_mult or 0
                card.ability.perma_mult = card.ability.perma_mult + self.config.extra.change
                return {
                    message = localize('k_upgrade_ex'), colour = G.C.MULT
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return { vars = { self.config.extra.mult, self.config.extra.change } }
        end
    }
else
    SMODS.Seal {
        key = 'strange',
        atlas = 'statclock',
        pos = { x = 0, y = 0 },
        config = {
            extra = {
                mult = 0,
                change = 1,
            }
        },
        badge_colour = HEX('ED712B'),
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'change',
                    message_colour = G.C.ATTENTION
                })
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return { vars = { self.config.extra.mult, self.config.extra.change } }
        end
    }
end
