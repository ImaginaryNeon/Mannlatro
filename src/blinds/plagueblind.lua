SMODS.Blind {
    key = 'plague',
    atlas = 'mannpowerblind',
    pos = {
        y = 10
    },
    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 4, 'vremade_wheel')
        return { vars = { numerator, denominator } }
    end,
    boss = { min = 2, max = 10 },
    boss_colour = HEX('ED712B'),
    calculate = function(self, blind, context)
        if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.debuff then
                    enhanced[#enhanced + 1] = scored_card
                    if SMODS.pseudorandom_probability(blind, 'vremade_wheel', 1, 4) then
                        scored_card.ability.perma_p_dollars = (scored_card.ability.perma_p_dollars or 0) - 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    end
                end
            end
        end
        if not blind.disabled then
            if context.cardarea == G.play and context.main_scoring then
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.perma_p_dollars = (scored_card.ability.perma_p_dollars or 0) - 1
                end
            end
        end
    end
}
