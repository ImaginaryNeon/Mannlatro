SMODS.Consumable {
	key = 'plague',
	set = 'Mannpower',
	atlas = 'mannpowercards',
	pos = { x = 2, y = 2 },
	cost = 4,
	select_card = 'consumeables',
	config = { max_highlighted = 1, odds = 4 },
	-- weight = 7.5, -- Apparently weights are 10 by default, so 0.75 was practically banning it outright.
	loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = { key = 'e_negative', set = 'Edition', config = { extra = 1 } }
		--info_queue[#info_queue + 1] = { key = 'e_negative', set = 'Edition', config = { extra = 1 } }
		info_queue[#info_queue + 1] = { key = 'e_negative', set = 'Edition', config = { extra = 1 } }
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
			'mannpower_plaguecard')
		return { vars = { card.ability.max_highlighted, numerator, denominator } }
	end,
	can_use = function(self, card)
		local cards = SMODS.get_highlighted_cards({ G.jokers }, card, 1, 1, function(card)
			return card.ability.set == "Joker"
		end)
		return #cards == 1
	end,
	use = function(self, card, area, copier)
		if SMODS.pseudorandom_probability(card, 'mannpower_plaguecard', 1, card.ability.extra.odds) then
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
					--jkr.ability.eternal = true
					jkr.ability.rental = true
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
		else
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					attention_text({
						text = localize('k_nope_ex'),
						scale = 1.3,
						hold = 1.4,
						major = card,
						backdrop_colour = G.C.SECONDARY_SET.Mannpower,
						align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
							'tm' or 'cm',
						offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
						silent = true
					})
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound('tarot2', 0.76, 0.4)
							return true
						end
					}))
					play_sound('tarot2', 1, 0.4)
					card:juice_up(0.3, 0.5)
					return true
				end
			}))
		end
	end
}
