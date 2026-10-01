SMODS.Blind {
	key = 'king',
	atlas = 'mannpowerblind',
	pos = {
		y = 9
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				""
			},
		}
	end,
	collection_loc_vars = function(self)
		return {
			vars = {
				"(Cannot appear on Abandoned Deck)",
			},
		}
	end,
	mult = 1.5,
	boss = { min = 3 },
	boss_colour = HEX('ED712B'),
	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card then
				local rank = context.debuff_card:get_id()                                                                      -- context.debuff_card is itself a card object being checked to see if it should be debuffed
				if rank == 2 or rank == 3 or rank == 4 or rank == 5 or rank == 6 or rank == 8 or rank == 7 or rank == 9 or rank == 10 then -- i'm sure there's a more efficient way to do this but i don't feel like figuring it out lol
					return { debuff = true }
				end
			end
		end
	end,
	in_pool = function(self, args)
		if G.GAME.starting_params.no_faces == true or G.GAME.round_resets.ante <= 3 then
			return false
		else
			return true
		end
	end
}

--[[local function reset_mannpower_vaccinator()
	G.GAME.current_round.neonmod_cheatcode_cards = G.GAME.current_round.neonmod_cheatcode_cards or
		{ 'Hearts', 'Diamonds', 'Spades', 'Clubs', 'Hearts', 'Diamonds', 'Spades', 'Clubs', 'Hearts', 'Spades' }
	for i = 1, 10 do
		local ancient_card = pseudorandom_element(SMODS.Suits, 'neonmod_konamicode' .. G.GAME.round_resets.ante)
		G.GAME.current_round.neonmod_cheatcode_cards[i] = ancient_card.key
	end
end

function SMODS.current_mod.reset_game_globals(run_start)
	reset_mannpower_vaccinator()
end]]
