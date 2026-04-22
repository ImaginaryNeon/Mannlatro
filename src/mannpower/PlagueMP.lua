SMODS.Consumable {
    key = 'plague',
    set = 'Mannpower',
    atlas = 'mannpowercards',
    pos = {
        x = 2,
        y = 2
    },
    select_card = 'consumeables',
    config = { max_highlighted = 1 },
    weight = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
	can_use = function(self, card)
		local cards = SMODS.get_highlighted_cards({ G.jokers }, card, 1, 1, function(card)
			return card.ability.set == "Joker"
		end)
		return #cards == 1
	end,
	use = function(self, card, area, copier)
		local cards = SMODS.get_highlighted_cards({ G.jokers }, card, 1, 1, function(card)
			return card.ability.set == "Joker"
		end)
		local jkr = cards[1]
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				jkr:flip()
        jkr:set_edition('e_negative', true)
				jkr.ability.eternal = true
				jkr.ability.perishable = true
				play_sound("card1", percent)
				jkr:juice_up(0.3, 0.3)
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				play_sound("card1", 0.9)
				jkr:flip()
				return true
			end,
		}))
	end
}
