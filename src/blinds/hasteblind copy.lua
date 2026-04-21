local original_update = Game.update
function Game.update(self, dt)
    original_update(self, dt)
    local blind = G.GAME.blind
    if not G.SETTINGS.paused and blind and blind.config.blind.key == 'bl_mannpower_haste2' then
        blind.effect.extra.timer = blind.effect.extra.timer + dt

        -- trigger after 10 seconds
        if blind.effect.extra.timer >= 10 then
            -- reset timer to 0
            blind.effect.extra.timer = 0

            -- do your effect that happens every 10 seconds here (thanks to srockw for helping with this)
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
        end
    end
end

SMODS.Blind {
    key = 'haste2',
    atlas = 'mannpowerblind',
    pos = {
        y = 4
    },
    config = {
        extra = {
            timer = 0,
            timer_speed = 1,
            timer_end = 10
        },
    },
    boss = { min = 1, max = 10 },
    boss_colour = HEX('ED712B'),
    loc_vars = function(self)
        return { vars = { self.config.extra.timer, self.config.extra.timer_speed, self.config.extra.timer_end } }
    end,
}
