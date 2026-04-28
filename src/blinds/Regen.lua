SMODS.Blind {
    key = "regen",
    atlas = 'mannpowerblind',
    pos = {
        y = 5
    },
    boss = { min = 3 },
    config = {
        blind_mod = 0.2,
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(lenient_bignum((get_blind_amount(G.GAME.round_resets.ante) * 0.2))),
            },
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                "(" .. number_format(0.2) .. "X base)",
            },
        }
    end,
    boss_colour = HEX("ED712B"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.final_scoring_step then
                return {
                    score = get_blind_amount(G.GAME.round_resets.ante) * -0.2,
                }
            end
            --[[           if G.GAME.chips < 0 then
                return {
                    score = G.GAME.chips * -1,
                }
            end --]]
        end
    end
    --		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
}
