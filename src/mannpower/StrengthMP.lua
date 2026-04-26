SMODS.Consumable {
    key = 'strength',
    atlas = 'mannpowercards',
    set = 'Mannpower',
    pos = { x = 0, y = 0 },
    config = {
        -- This will add a tooltip.
        mod_conv = "mannpower_strange_seal",
        -- Tooltip args
        seal = { extra = { change = 2 } },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        -- Handle creating a tooltip with set args.
        info_queue[#info_queue + 1] =
        { set = "Other", key = "mannpower_strange_seal", specific_vars = { self.config.seal.extra.change } }
        return { vars = { center.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal("mannpower_strange", nil, true)
                check_for_unlock({ type = 'strange_made' })
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}
