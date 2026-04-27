-- Based off of Cryptid's "The Greed" Boss Blind
SMODS.Blind {
    key = "resistance",
    atlas = 'mannpowerblind',
    pos = {
        y = 1
    },
    boss = { min = 3 },
  	config = {
  		blind_mod = 0.25,
  	},
    loc_vars = function(self, info_queue, card)
	  	return {
		  	vars = {
			  	number_format(lenient_bignum((get_blind_amount(G.GAME.round_resets.ante) * 0.25))),
			  },
	  	}
	end,
  	collection_loc_vars = function(self)
	  	return {
		  	vars = {
			  	"(" .. number_format(0.25) .. "X base)",
  			},
	  	}
	  end,
  	mult = 1,
    boss_colour = HEX("ed712b"),
	set_blind = function(self, reset, silent)
    local joker_count = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    joker_count = joker_count + 1
                end
            end
        end
		if to_big(joker_count) > to_big(0) then
			G.GAME.blind.chips = -- go my equations
				((get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling) + (math.floor(joker_count) * (get_blind_amount(G.GAME.round_resets.ante) * 0.25)))
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	disable = function(self, silent)
		G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
}
