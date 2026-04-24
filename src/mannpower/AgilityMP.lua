SMODS.Consumable {
    key = 'agility',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 3,
        y = 1
    },
    select_card = 'consumeables',
    config = { extra = { money = 5, money_base = 5, money_bonus = 15 } },
    loc_vars = function(self, info_queue, card)
        -- supposed to increase the money one time when a hand scores more than the blind requirements, but currently increases it each time you hover over it, as long as the last hand was a oneshot.
        if SMODS.last_hand_oneshot then
            card.ability.extra.money = card.ability.extra.money_base + card.ability.extra.money_bonus
        else
            card.ability.extra.money = card.ability.extra.money_base
        end
        return { vars = { card.ability.extra.money, card.ability.extra.money_base, card.ability.extra.money_bonus } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.money, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
