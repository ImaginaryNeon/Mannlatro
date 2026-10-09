SMODS.Joker {
    key = "fatejkr",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    atlas = "ghostfort",
    pos = { x = 1, y = 3 },
    --[[
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fatejkr_killcheck')
        return { vars = { numerator, denominator } }
    end,--]]
    calculate = function(self, card, context)
        if context.joker_type_destroyed and context.card.ability.set == 'WheelofFate' and not context.retrigger_joker then
            return {
                no_destroy = true,
            }
        end
    end
}
