SMODS.Blind {
    key = 'haste2',
    atlas = 'mannpowerblind',
    pos = {
        y = 4
    },
    config = {
        extra = {
            timer = 0,
            timer_speed = 1 / 6,
            timer_end = 10
        },
    },
    boss = { min = 1, max = 10 },
    boss_colour = HEX('ED712B'),

    loc_vars = function(self)
        local original_update = Game.update
        if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_mannpower_haste2' then
            function Game:update(dt)
                original_update(self, dt)
                if G.SETTINGS.paused then
                    return 0
                else
                    if blind.effect.extra.timer + (0.1 * (blind.effect.extra.timer_speed * math.min(G.SETTINGS.GAMESPEED, 4))) >= blind.effect.extra.timer_end and not G.GAME.blind.disabled then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local any_selected = nil
                                local _cards = {}
                                for _, playing_card in ipairs(G.hand.cards) do
                                    _cards[#_cards + 1] = playing_card
                                end
                                for i = 1, 1 do
                                    if G.hand.cards[i] then
                                        local selected_card, card_index = pseudorandom_element(_cards, 'mannpower_haste2')
                                        G.hand:add_to_highlighted(selected_card, true)
                                        table.remove(_cards, card_index)
                                        any_selected = true
                                        play_sound('card1', 1)
                                    end
                                end
                                if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                                return true
                            end
                        }))
                    else
                        blind.effect.extra.timer = blind.effect.extra.timer +
                            0.1 * ((dt * (blind.effect.extra.timer_speed)) * math.min(G.SETTINGS.GAMESPEED, 4))
                    end
                end
            end
        end
        return { vars = { self.config.extra.timer, self.config.extra.timer_speed, self.config.extra.timer_end } }
    end,
    calculate = function(self, blind, context)

    end
}
