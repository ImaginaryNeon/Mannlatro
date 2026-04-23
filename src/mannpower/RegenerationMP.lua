SMODS.Consumable {
    key = 'regeneration',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 1,
        y = 1
    },
    select_card = 'consumeables',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag({ key = 'tag_d_six' })
                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                return true
            end)
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
