if CardSleeves then
    CardSleeves.Sleeve {
        key = "mannsleve",
        name = "Mannpower Sleve",
        atlas = "sleeve_atlas",
        pos = { x = 0, y = 0 },
        unlocked = false,
        unlock_condition = { deck = "b_mannpower_manndeck", stake = "stake_blue" },
        loc_vars = function(self)
            local key, vars
            if self.get_current_deck_key() == "b_mannpower_manndeck" then
                if Cryptid then
                    key = self.key .. "_cry_alt"
                    self.config = { vouchers = { 'v_mannpower_tour_of_duty', 'v_mannpower_squad_surplus', 'v_mannpower_developer_console' }
                else
                    key = self.key .. "_alt"
                    self.config = { vouchers = { 'v_mannpower_tour_of_duty', 'v_mannpower_squad_surplus' }
                end
                return { key = key, vars = {} }
            end
        return { key = key, vars = vars }
        end,
        if self.get_current_deck_key() == "b_mannpower_manndeck" then
            apply = function(self, sleeve)
                for k, v in pairs(self.config.vouchers) do
                    G.GAME.used_vouchers[v] = true
                    G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            Card.apply_to_run(nil, G.P_CENTERS[v])
                            return true
                        end
                    }))
                end
            end
        else
	    	    calculate = function(self, sleeve, context)
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
	    	    end
        end
    }
end
