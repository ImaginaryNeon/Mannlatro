SMODS.Back {
    key = 'manndeck',
    atlas = 'deck',
    pos = { x = 0, y = 0 },
--    loc_vars = function(self, info_queue, card)
        -- Add money if the last hand scored over the blind requirements
--        return { vars = { card.ability.extra.money, card.ability.extra.money_gain } }
--    end,
    calculate = function(self, back, context)
        if context.ante_end then
      	    G.E_MANAGER:add_event(Event({
			          trigger = "before",
			          func = function()
				            local key = "p_mannpower_powerpack_1"
				            local card = Card(
				          	G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					          G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
			          		G.CARD_W * 1.27,
					          G.CARD_H * 1.27,
				        	  G.P_CARDS.empty,
	  			        	G.P_CENTERS[key],
  					        { bypass_discovery_center = true, bypass_discovery_ui = true }
		  		          )
			  	          card.cost = 0
				            card.from_tag = true
				            G.FUNCS.use_card({ config = { ref_table = card } })
				            card:start_materialize()
				            pack_opened = true
				            return true
			        end,
      	    }))
        end
    end
}
