SMODS.Consumable {
    key = 'precision',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 2,
        y = 1
    },
    select_card = 'consumeables',
    config = { extra = { money_base = 20, money_per = 4, money = 20 } },
    loc_vars = function(self, info_queue, card)
        local money = card.ability.extra.money_base
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    money = money - card.ability.extra.money_per
                end
            end
        end
        card.ability.extra.money = math.max(money, 0)
        return { vars = { card.ability.extra.money_base, card.ability.extra.money_per, card.ability.extra.money } }
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
