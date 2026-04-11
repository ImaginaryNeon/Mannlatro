SMODS.Blind {
    key = 'supernova',
    atlas = 'mannpowerblind',
    pos = {
        y = 11
    },
    boss = { min = 3, max = 10 },
    boss_colour = HEX('ED712B'),
    calculate = function(self, blind, context)
        if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired and not scored_card.supernovaed then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.supernovaed = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.supernovaed = nil
                            return true
                        end
                    }))
                end
            end
        end
    end
}
