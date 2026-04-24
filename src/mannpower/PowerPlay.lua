SMODS.Consumable {
    key = 'powerplay',
    set = 'Spectral',
    atlas = 'RTD',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    hidden = true,
    soul_set = 'Mannpower',
    no_doe = true,
    use = function(self, card, area, copier)
        for i = 1, #G.jokers.cards do
            if not G.jokers.cards[i].edition then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        G.jokers.cards[i]:set_edition('e_negative', true)
                        check_for_unlock({ type = 'have_edition' })
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                delay(0.6)
            end
        end
        for i, playing_card in ipairs(G.hand.cards) do
            if not playing_card.edition then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        playing_card:set_edition('e_polychrome', true)
                        check_for_unlock({ type = 'have_edition' })
                        card:juice_up(0.3, 0.5)
                        return true
                    end,
                }))
            end
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
}
