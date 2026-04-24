local original_update = Game.update
function Game.update(self, dt)
    original_update(self, dt)
    local blind = G.GAME.blind
    if not G.SETTINGS.paused and blind and blind.config.blind.key == 'bl_mannpower_haste' then
        blind.effect.extra.timer = blind.effect.extra.timer + dt

        -- trigger after 10 seconds
        if blind.effect.extra.timer >= 6 then
            -- reset timer to 0
            blind.effect.extra.timer = 0

            -- do your effect that happens every 10 seconds here (thanks to srockw for helping with this)
            G.E_MANAGER:add_event(Event({
                func = function()
                    local hand_card_count = 0
                    local highlight_card_count = 0
                    for _, playing_card in ipairs(G.hand.cards) do
                        hand_card_count = hand_card_count + 1
                        if playing_card.highlighted == true then
                            highlight_card_count = highlight_card_count + 1
                        end
                    end
                    --                    local any_selected = nil
                    if hand_card_count - highlight_card_count == nil or hand_card_count - highlight_card_count < 1 then
                        message = "Missed!"
                    else
                        local _cards = {}
                        for _, playing_card in ipairs(G.hand.cards) do
                            if playing_card.highlighted == false then
                                _cards[#_cards + 1] = playing_card
                            end
                        end
                        for i = 1, 1 do
                            if G.hand.cards[i] then
                                local selected_card, card_index = pseudorandom_element(_cards, 'mannpower_haste')
                                SMODS.destroy_cards(selected_card)
                                --                            table.remove(_cards, card_index)
                                --                            any_selected = true
                                play_sound('card1', 1)
                            end
                        end
                    end
                    --                    if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                    return true
                end
            }))
        end
    end
end

SMODS.Blind {
    key = 'haste',
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
