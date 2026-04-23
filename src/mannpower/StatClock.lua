SMODS.Seal {
    key = 'strange',
    atlas = 'statclock',
    if Cryptid then
    pos = { x = 1, y = 0 },
    else
    pos = { x = 0, y = 0 },
    end,
    config = {
        extra = {
            mult = 0,
            change = 1,
        }
    },
    badge_colour = SMODS.ConsumableTypes['Mannpower'].primary_colour,
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
