SMODS.Consumable {
	key = 'supernova',
	set = 'Mannpower',
	atlas = 'mannpowercards',
	pos = {
		x = 3,
		y = 2
	},
	select_card = 'consumeables',
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
				jkr.ability.perishable = nil
				jkr.pinned = nil
				jkr.ability.pinned = nil
				jkr:set_rental(nil)
				jkr:set_eternal(nil)
				if Cryptid then
					jkr.ability.banana = nil
					jkr.ability.cry_possessed = nil
					SMODS.Stickers.cry_flickering:apply(CARD, nil)
				end
				play_sound("card1", percent)
				jkr:juice_up(0.3, 0.3)
				jkr:flip()
				return true
			end,
		}))
	end,
}
