SMODS.Sound({
    key = "strangecase",
    path = "strange.ogg",
})
local isFluff = SMODS.find_mod("MoreFluff")[1]
SMODS.Joker {
    key = "canteen",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    atlas = "jonklers",
    pos = { x = 0, y = 0 },
    config = { extra = { charges = 0, max_charges = 3, type = "None", mismin = 0, mismax = 50, money = 1, xmult = 3, odds_S = 2, odds_T = 2, kill_odds = 2, odds_M = 2, money2 = 2 } },
    loc_vars = function(self, info_queue, card)
        -- local fool_c = card.ability.extra.type or G.GAME.mannpower_last_skipped_booster_kind or nil
        local numeratorS, denominatorS = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_S,
            'mannpower_canteen_spectral')
        local numeratorT, denominatorT = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_T,
            'mannpower_canteen_tarot')
        local colour = (card.ability.extra.type == 'None' --[[or fool_c.name == 'The Fool']]) and G.C.RED or G.C.GREEN
        --[[if not (not fool_c or fool_c.name == 'The Fool') then
            info_queue[#info_queue + 1] = fool_c
        end]]
        -- Add tooltips by appending to info_queue
        info_queue[#info_queue + 1] = { key = 'mannpower_explanation', set = 'Other', vars = { card.ability.extra.money, card.ability.extra.xmult, numeratorS, denominatorS, numeratorT, denominatorT, colours = { HEX('43c77b'), } } }
        if Cryptid then
            info_queue[#info_queue + 1] = { key = 'mannpower_explanation_cry', set = 'Other', vars = { card.ability.extra.mismin, card.ability.extra.mismax, colours = { HEX("474931"), HEX("ef0098"), HEX("14b341") } } }
        end
        if isFluff then
            local numeratorM, denominatorM = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_M,
                'mannpower_canteen_modded')
            info_queue[#info_queue + 1] = { key = 'mannpower_explanation_fluff', set = 'Other', vars = { numeratorM, denominatorM, card.ability.extra.money2, colours = { HEX("4f6367"), HEX("8e73d9") } } }
        end
        local main_end = { {
            n = G.UIT.C,
            config = { align = "bm", padding = 0.02 },
            nodes = { {
                n = G.UIT.C,
                config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                nodes = {
                    { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.type or 'None') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                }
            }
            }
        }
        }
        return {
            vars = { card.ability.extra.charges, card.ability.extra.max_charges, card.ability.extra.type or 'None' },
            main_end = main_end
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.type = --[[tostring(G.GAME.mannpower_last_skipped_booster_kind) or]] 'None'
        if (card.ability.extra.type == 'None') or (card.ability.extra.type == nil) then
            card.ability.extra.type = 'None'
            card.ability.extra.charges = 0
        end
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and (not card.ability.extra.type or card.ability.extra.type == 'None') then
            if context.booster.kind then
                card.ability.extra.type = tostring(context.booster.kind)
                card.ability.extra.charges = card.ability.extra.max_charges
            end
            if context.booster.key == 'p_cry_empowered' then
                card.ability.extra.type = 'Empowered'
            end
            if card.ability.extra.type == "Colour" then
                card.ability.extra.type = "Color" -- WHAT THE FUCK IS A KILOMETER???
            end
        end
        if context.before then
            if card.ability.extra.charges > 0 and card.ability.extra.type == 'Celestial' then
                card.ability.extra.charges = (card.ability.extra.charges or 0) - 1
                if card.ability.extra.charges <= 0 and card.ability.extra.type ~= 'None' then
                    card.ability.extra.type = 'None'
                    card.ability.extra.charges = 0
                end
                return {
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
            if card.ability.extra.charges <= 0 then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
        end
        if (context.setting_blind and card.ability.extra.type == 'Mannpower' and not card.getting_sliced) then
            if card.ability.extra.charges > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_discard(3)
                        return true
                    end,
                }))
                card.ability.extra.charges = (card.ability.extra.charges or 0) - 1
            end
            if card.ability.extra.charges <= 0 then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
        end
        if context.individual and card.ability.extra.type == 'Standard' and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            if card.ability.extra.charges > 0 then
                card.ability.extra.charges = (card.ability.extra.charges or 0) - 1
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local card_copied = copy_card(context.scoring_hand[1], nil, nil, G.playing_card)
                card_copied:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, card_copied)
                G.hand:emplace(card_copied)
                card_copied.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_copied:start_materialize()
                        return true
                    end
                }))
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                                return true
                            end
                        }))
                    end
                }
            end
            if card.ability.extra.charges <= 0 then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
        end
        if context.joker_main then
            if card.ability.extra.type ~= 'Celestial' and card.ability.extra.type ~= 'Mannpower' and card.ability.extra.type ~= 'Standard' then
                if card.ability.extra.charges > 0 then
                    card.ability.extra.charges = (card.ability.extra.charges or 0) - 1
                    if card.ability.extra.type == 'Arcana' then
                        local moneys = 0
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].ability.set == 'Joker' then
                                moneys = moneys + card.ability.extra.money
                            end
                        end
                        return { dollars = moneys, }
                    end
                    if card.ability.extra.type == 'Buffoon' then
                        return {
                            xmult = card.ability.extra.xmult
                        }
                    end
                    if card.ability.extra.type == 'Spectral' and SMODS.pseudorandom_probability(card, 'mannpower_canteen_spectral', 1, card.ability.extra.odds_S) then
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Spectral', key_append = 'mannpower_canteen_spectral'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                            return {
                                message = localize('k_plus_spectral'),
                                colour = G.C.SECONDARY_SET.Spectral
                            }
                        end
                    end
                    if card.ability.extra.type == 'baneful' then
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and SMODS.pseudorandom_probability(card, 'mannpower_baneful_kill', 1, card.ability.extra.kill_odds) then
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        SMODS.destroy_cards(G.jokers.cards[i], nil, nil, true)
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                                play_sound('mannpower_strangecase')
                                delay(0.6)
                            end
                        end
                        card.ability.extra.charges = 0
                    end
                    if Cryptid and card.ability.extra.type == 'Empowered' then
                        if G.jokers.config.card_limit > #G.jokers.cards then
                            local thyend = {}
                            for k, v in pairs(G.P_CENTER_POOLS.Joker) do
                                if (v.rarity == 4 or v.rarity == "cry_epic" or v.rarity == "cry_exotic") and not next(SMODS.find_card(v.key)) then
                                    table.insert(thyend, v.key)
                                end
                            end
                            local isnow = pseudorandom_element(thyend, "mannpower_gamba" .. G.GAME.round_resets.ante)
                            SMODS.add_card { set = 'Joker', key = isnow }
                        end
                    end
                    if card.ability.extra.type == "Code" then
                        return {
                            mult = pseudorandom('v=gblBwWNyMqk', card.ability.extra.mismin,
                                card.ability.extra.mismax)
                        }
                    end
                    if Cryptid and card.ability.extra.type == "meme" then
                        if G.jokers.config.card_limit > #G.jokers.cards then
                            play_sound('mannpower_strangecase')
                            SMODS.add_card { set = 'Joker', key = "j_jolly", skip_materialize = true, edition = 'e_cry_m' }
                            return {
                                mult = pseudorandom('vremade_misprint', card.ability.extra.mismin,
                                    card.ability.extra.mismax)
                            }
                        end
                    end
                    if card.ability.extra.type == "Merasmus" and SMODS.pseudorandom_probability(card, 'mannpower_canteen_spectral', 1, card.ability.extra.odds_S) then
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Tarot', key_append = 'mannpower_canteen_tarot'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                            return {
                                message = localize('k_plus_tarot'),
                                colour = G.C.SECONDARY_SET.Tarot
                            }
                        end
                    end
                    if card.ability.extra.type == "Rotarot" then
                        return { dollars = card.ability.extra.money2 * #G.consumeables.cards, }
                    end
                    if card.ability.extra.type == "Color" then
                        if card.ability.extra.charges <= 0 then
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = (function()
                                        SMODS.add_card {
                                            set = 'Colour', key_append = 'mannpower_canteen_tarot'
                                        }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end)
                                }))
                                return {
                                    message = "+1 Color",
                                    colour = G.C.SECONDARY_SET.Colour
                                }
                            end
                        end
                    end
                    if card.ability.extra.type == 'Modded' and SMODS.pseudorandom_probability(card, 'mannpower_canteen_spectral', 1, card.ability.extra.odds_S) and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
                    then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card {
                                    set = "Joker",
                                    attributes = { "Joker" },
                                    filter = function(pool)
                                        local new_pool = {}
                                        for k, v in pairs(pool) do
                                            if G.P_CENTERS[v.key].original_mod and not G.P_CENTERS[v.key]:is_rarity(1) then
                                                table.insert(new_pool, v)
                                            end
                                        end
                                        if #new_pool == 0 then return pool end
                                        return new_pool
                                    end,
                                }
                                G.GAME.joker_buffer = 0
                                return true
                            end,
                        }))
                        return { message = localize("k_plus_joker"), colour = G.C.BLUE }
                    end
                end
            end
            if card.ability.extra.charges <= 0 and card.ability.extra.type ~= 'None' then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
            if (card.ability.extra.type == 'None') or (card.ability.extra.type == nil) or not (card.ability.extra.type) then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
        end
        if context.after and not context.blueprint then
            if card.ability.extra.charges <= 0 and card.ability.extra.type ~= 'None' then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
            if (card.ability.extra.type == 'None') or (card.ability.extra.type == nil) or not (card.ability.extra.type) then
                card.ability.extra.type = 'None'
                card.ability.extra.charges = 0
            end
        end
    end
}
