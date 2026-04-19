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
        if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
            return {
                message = 'Boss Disabled!',
                func = function() -- This is for timing purposes, it runs after the message
                    G.GAME.blind:disable()
                end
            }
        end
    end,
    can_use = function(self, card)
        if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
            return true
        end
    end
}
