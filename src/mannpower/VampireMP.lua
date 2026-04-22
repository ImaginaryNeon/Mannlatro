SMODS.Consumable {
    key = 'vampire',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 2,
        y = 0
    },
    select_card = 'consumeables',
    config = { extra = { max_highlighted = 3, money = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max_highlighted, card.ability.extra.money } }
    end,
    use = function(self, card, area, copier)
		local used_consumable = copier or card
		local earnings = 0
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
	    		local CARD = G.hand.highlighted.cards[i]
		    	if CARD.config.center ~= G.P_CENTERS.c_base then
			    	earnings = earnings + 1
	    		end
		    	if CARD.edition then
		    		earnings = earnings + 1
	    		end
	    		if CARD.seal then
		    		earnings = earnings + 1
	    		end
		    	local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted.cards - 0.998) * 0.3
		    	G.E_MANAGER:add_event(Event({
		    		trigger = "after",
			    	delay = 0.15,
		    		func = function()
			    		CARD:flip()
		    			CARD:set_ability(G.P_CENTERS.c_base, true, nil)
				    	CARD:set_edition(nil, true)
		    			CARD:set_seal(nil, true)
		    			play_sound("tarot2", percent)
		    			CARD:juice_up(0.3, 0.3)
		    			return true
		    		end,
		    	}))
		    end
		ease_dollars(earnings * card.ability.extra.money)
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
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
    end
}
