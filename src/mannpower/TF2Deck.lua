SMODS.Back {
	key = 'manndeck',
	atlas = 'deck',
	pos = { x = 0, y = 0 },
	unlocked = false,

	calculate = function(self, back, context)
		if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
			G.E_MANAGER:add_event(Event({
				func = function()
					local booster = SMODS.create_card { key = 'p_mannpower_powerpack_' .. math.random(1, 2), area = G.play }
					booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
					booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
					booster.T.w = G.CARD_W * 1.27
					booster.T.h = G.CARD_H * 1.27
					booster.cost = 0
					booster.from_tag = true
					G.FUNCS.use_card({ config = { ref_table = booster } })
					booster:start_materialize()
					return true
				end
			}))
		end
	end,
	locked_loc_vars = function(self, info_queue, back)
		return {
			vars = {
				colours = { SMODS.ConsumableTypes['Mannpower'].secondary_colour }
			}
		}
	end,
	check_for_unlock = function(self, args)
		return args.type == "strange_threshold1" and (G.P_CENTER_POOLS.Stake[G.GAME.stake].key == "red" or
			G.P_CENTER_POOLS.Stake[G.GAME.stake].key == "blue") and true -- and get_deck_win_stake('b_green') > 0
	end
}
