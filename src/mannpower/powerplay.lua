SMODS.Consumable {
    key = 'powerplay',
    set = 'Spectral',
    atlas = 'RTD',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    hidden = true,
    soul_set = 'Mannpower',
    use = function(self, card, area, copier)
        for i = 1, #G.jokers.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers.cards, true)
                    for i2 = 1, #editionless_jokers do
                        local edition = 'e_negative'
                        editionless_jokers[i]:set_edition(edition, true)
                    end
                    check_for_unlock({ type = 'have_edition' })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
        end
        for i, playing_card in ipairs(G.hand.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local editionless_cards = SMODS.Edition:get_edition_cards(G.hand, true)
                    for i2 = 1, #editionless_cards do
                        local edition = 'e_polychrome'
                        editionless_cards[i]:set_edition(edition, true)
                    end
                    check_for_unlock({ type = 'have_edition' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    --    draw = function(self, card, layer)
    -- This is for the Spectral shader. You don't need this with `set = "Spectral"`
    -- Also look into SMODS.DrawStep if you make multiple cards that need the same shader
    --        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
    --            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
    --        end
    --    end
}
