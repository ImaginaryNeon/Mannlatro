SMODS.Consumable { -- I, Super Jump
    key = 'superjump',
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 0,
        y = 0
    },
    set_ability = function(self, card)
        card.ability.extra.xmult = 1.5
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xmult = 1.5,
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {     -- II, Small Head
    key = 'smallhead', -- X1.5 Chips
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 1,
        y = 0
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xchips = 1.5,
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xchips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { -- III, Super Speed
    key = 'superspeed',
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 2,
        y = 0
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xmult = 1.5,
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = 1
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {       -- IV, Zero Gravity
    key = 'zerogravity', -- +2 Hand Size
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 3,
        y = 0
    },
    --    select_card = 'consumeables',
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((3 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    config = {
        extra = {
            handsize = 2,
            duration = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.handsize,
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handsize)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-1 * card.ability.extra.handsize)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {   -- V, Big Head
    key = 'bighead', -- X1.5 Mult
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 4,
        y = 0
    },
    --    select_card = 'consumeables',
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    config = {
        extra = {
            xmult = 1.5,
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {      -- VI, UberCharge
    key = 'ubercharge', -- Other cards cannot be destroyed
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 0,
        y = 1
    },
    --    select_card = 'consumeables',
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((3 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    config = {
        extra = {
            duration = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_type_destroyed and context.card ~= card then
            return {
                no_destroy = true,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {     -- VII, Critical Hits
    key = 'criticals', -- 1 in 2 chance for X3 mult
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 1,
        y = 1
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xmult = 3,
            duration = 2,
            odds = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'the gargoyle...IS GONE')
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.duration, numerator, denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'the gargoyle...IS GONE', 1, card.ability.extra.odds) then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {    -- VIII, Dance Off
    key = 'danceoff', -- Creates 1 copy of the Fool at the start of each Blind, must have room
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 2,
        y = 1
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Tarot',
                                key = "c_fool",
                                key_append = 'piss' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { -- IX, Fish Troll
    key = 'fish',
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 3,
        y = 1
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xmult = 1.5,
            duration = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable {  -- X, Decapitated
    key = 'nohead', -- Destroy the first discarded card each round
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 4,
        y = 1
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            xmult = 1.5,
            duration = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { -- XXX, Whammy
    key = 'whammy',
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 0,
        y = 2
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((5 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            change_mult = 2,
            duration = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.change_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.modify_ante then
            local piss = card.ability.extra.change_mult * context.modify_ante
            return {
                modify = piss,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable { -- XXX (2), Cherry Bomb
    key = 'cherrybomb',
    set = 'WheelofFate',
    atlas = 'ghostfort',
    pos = {
        x = 1,
        y = 2
    },
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((2 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    --    select_card = 'consumeables',
    config = {
        extra = {
            duration = 2,
            xmult = 1.2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable { -- LOL, Lucky You
    key = 'luckyyou',
    set = 'Spectral',
    atlas = 'ghostfort',
    pos = {
        x = 3,
        y = 2
    },
    soul_rate = 0.003,
    hidden = true,
    soul_set = 'WheelofFate',
    select_card = 'consumeables',
    no_doe = true,
    set_ability = function(self, card)
        card.ability.extra.duration = math.ceil((77 + (G.GAME.extended_duration_turns or 0)) *
            (G.GAME.extended_duration_mult or 1))
    end,
    config = {
        extra = {
            seven = 7,
            duration = 77,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.duration,
                card.ability.extra.seven
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.seven,
                xchips = card.ability.extra.seven,
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.duration = card.ability.extra.duration - 1
            if card.ability.extra.duration <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.seven
    end,
    use = function(self, card, area, copier)
    end,
    can_use = function(self, card)
        return true
    end,
}
