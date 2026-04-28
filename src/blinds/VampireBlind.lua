-- Based off of Cryptid's "The Greed" Boss Blind
SMODS.Blind {
    key = "vampire",
    atlas = 'mannpowerblind',
    pos = {
        y = 2
    },
    boss = { min = 4 },
    config = {
        blind_mod = 0.05,
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
                "(" .. number_format(0.05) .. "X base)",
            },
        }
    end,
    mult = 1.5,
    boss_colour = HEX("ed712b"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
                for i = 1, #G.play.cards do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.play.cards[i]:juice_up()
                            return true
                        end,
                    }))
                    delay(0.23)
                end
                return {
                    blindsize = math.floor((get_blind_amount(G.GAME.round_resets.ante) * 0.05)) * #G.play.cards
                }
            end
        end
    end
}
