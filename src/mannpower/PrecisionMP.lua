SMODS.Consumable {
    key = 'precision',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 2,
        y = 1
    },
    select_card = 'consumeables',
    config = { extra = { money = 5, money_gain = 3 } },
    loc_vars = function(self, info_queue, card)
        if SMODS.last_hand_oneshot and test ~= true then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_gain
        end
        return { vars = { card.ability.extra.money, card.ability.extra.money_gain } }
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
}
