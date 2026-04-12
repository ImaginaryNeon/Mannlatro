SMODS.Blind {
    key = 'haste',
    atlas = 'mannpowerblind',
    pos = {
        y = 4
    },
    config = {
        extra = {
            timer = 0,
            timer_speed = 0.5,
            timer_end = 12
        },
    },
    boss = { min = 2, max = 10 },
    boss_colour = HEX('ED712B'),
    loc_vars = function(self)
        return { vars = { self.config.extra.timer, self.config.extra.timer_end } }
    end,
    calculate = function(self, blind, context)
        if G.SETTINGS.paused then
            return 0
        else
            if blind.effect.extra.timer + (0.1 * (blind.effect.extra.timer_speed * math.min(G.SETTINGS.GAMESPEED, 4) / 4) / 3) >= blind.effect.extra.timer_end and not G.GAME.blind.disabled then
                local card_to_destroy = pseudorandom_element(G.hand.cards, 'mannpower_haste')
                do
                    return {
                        message = 'Time\'s Up!',
                        colour = G.C.FILTER
                    }
                end
                SMODS.destroy_cards(card_to_destroy)
                blind.effect.extra.timer = 0
            else
                blind.effect.extra.timer = blind.effect.extra.timer +
                    0.1 * (blind.effect.extra.timer_speed * math.min(G.SETTINGS.GAMESPEED, 4) / 4) / 3
            end
        end
    end
}
