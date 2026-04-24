SMODS.Consumable {
    key = 'haste',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 0,
        y = 1
    },
    select_card = 'consumeables',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.3)
                ease_hands_played(G.GAME.current_round.hands_left)
                ease_discard(G.GAME.current_round.discards_left)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        local hands_used = G.GAME.current_round.hands_used or 0
        if hands_used == 0 and G.GAME.current_round.hands_left > 0 then
            return true
        end
    end
}
