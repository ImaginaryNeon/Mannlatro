SMODS.Blind {
    key = 'king',
    atlas = 'mannpowerblind',
    pos = {
        y = 9
    },
    mult = 2,
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
    boss = { min = 2, max = 10 },
    debuff = { is_face = false },
    boss_colour = HEX('ED712B'),
    in_pool = function(self, args)
		  if G.GAME.starting_params.no_faces == true then
		  	return false
      else
        return true
	  end
}
