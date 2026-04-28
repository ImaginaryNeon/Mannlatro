SMODS.Consumable {
    key = 'reflect',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 3,
        y = 0
    },
    select_card = 'consumeables',
    config = { max_highlighted = 1, extra = 0.95 },
    weight = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, card.ability.extra } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                    local _card = G.hand.cards[i]
                      --if G.hand.highlighted[i].ability.perma_x_blind_size == 0 then
                        --G.hand.highlighted[i].ability.perma_x_blind_size = card.ability.extra
                            --else
                    G.hand.highlighted[i].ability.perma_x_blind_size = ((G.hand.highlighted[i].ability.perma_x_blind_size+1)*card.ability.extra)-1
                            --end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
}
