SMODS.Blind {
    key = 'strength',
    atlas = 'mannpowerblind',
    pos = {
        y = 0
    },
    boss = { min = 2, max = 10 },
    boss_colour = HEX('ED712B'),
    calculate = function(self, blind, context)
        if context.before and not context.blueprint and not blind.disabled then
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.debuff then
                    assert(SMODS.modify_rank(scored_card, -1))
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
}
