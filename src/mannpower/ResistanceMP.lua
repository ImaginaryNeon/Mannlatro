SMODS.Consumable {
    key = 'resistance',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 1,
        y = 0
    },
    select_card = 'consumeables',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                message = 'Boss Disabled!'
                G.GAME.blind:disable()
                return true
            end
        }))
    end,
    can_use = function(self, card)
        if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
            return true
        end
    end
}
