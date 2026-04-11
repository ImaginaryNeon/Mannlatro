SMODS.Blind {
    key = 'plague',
    atlas = 'mannpowerblind',
    pos = {
        y = 10
    },
    boss = { min = 2, max = 10 },
    boss_colour = HEX('ED712B'),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.cardarea == G.play and context.main_scoring then
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.perma_p_dollars = (scored_card.ability.perma_p_dollars or 0) - 1
                end
            end
        end
    end
}
