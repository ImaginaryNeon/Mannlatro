-- Based off of Cryptid's "The Greed" Boss Blind
SMODS.Blind {
    key = "vampire",
    atlas = 'mannpowerblind',
    pos = {
        y = 2
    },
    boss = { min = 2 },
  	config = {
  		blind_mod = 0.1,
  	},
    loc_vars = function(self, info_queue, card)
	  	return {
		  	vars = {
			  	number_format(lenient_bignum((get_blind_amount(G.GAME.round_resets.ante) * 0.1))),
			  },
	  	}
	end,
  	collection_loc_vars = function(self)
	  	return {
		  	vars = {
			  	"(" .. number_format(0.1) .. "X base)",
  			},
	  	}
	  end,
  	mult = 1.5,
    boss_colour = HEX("ed712b"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            return {
                                blindsize = math.floor((get_blind_amount(G.GAME.round_resets.ante) * 0.01)
                            }
                            delay(0.23)
                        end
                        return true
                    end
                }))
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function()
                        SMODS.juice_up_blind()
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
                        return true
                    end)
                }))
                delay(0.4)
            end
        end
    end
}
