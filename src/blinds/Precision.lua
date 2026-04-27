SMODS.Blind {
    key = 'precision',
    atlas = 'mannpowerblind',
    pos = {
        y = 6
    },
    mult = 0.5,
    boss = { min = 2, max = 10 },
    boss_colour = HEX('ED712B'),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
                ease_hands_played(-G.GAME.blind.hands_sub)
                blind.discards_sub = G.GAME.current_round.discards_left - 1
                ease_discard(-blind.discards_sub)
            end
        end
    end,
    disable = function(self)
        ease_hands_played(G.GAME.blind.hands_sub)
        ease_discard(G.GAME.blind.discards_sub)
    end
}
