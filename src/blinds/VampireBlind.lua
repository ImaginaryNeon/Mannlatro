-- Based off of Cryptid's "The Greed" Boss Blind and The Tooth
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
        if Talisman or Amulet then
            return {
                vars = {
                    number_format(lenient_bignum((get_blind_amount(G.GAME.round_resets.ante) * 0.1))),
                },
            }
        else
            return {
                vars = {
                    number_format((get_blind_amount(G.GAME.round_resets.ante) * 0.1)),
                },
            }
        end
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


SMODS.Blind {
    key = 'final_vaccinator',
    atlas = 'vaccinator',
    pos = {
        y = 0
    },
    boss_colour = HEX("b83b3b"),
    config = {
        extra = {
            list = { "Cards with Enhancements", "Cards with Editions", "Cards with Seals", "Face cards", "Cards with Enhancements", "Hearts", "Diamonds", "Clubs", "Spades" },
            item_1 = '???',
            item_2 = '???',
        },
    },
    collection_loc_vars = function(self)
        return {
            vars = {
                "???", "???",
            },
        }
    end,
    boss = { showdown = true },
    loc_vars = function(self)
        local config = G.GAME.blind.effect.extra or self.config.extra
        return { vars = { (config.item_1 or "???"), (config.item_2 or "???") } }
    end,
    calculate = function(self, blind, context)
        if context.blind_disabled or context.blind_defeated then
            blind.effect.extra.item_1 = "???"
            blind.effect.extra.item_2 = "???"
        end
        if blind.disabled then return end
        if context.press_play and G.jokers.cards[1] then
            blind.triggered = true -- This won't trigger Matador in this context due to a Vanilla bug (a workaround is setting it in context.debuff_hand)
            blind.prepped = true
        end
        if context.hand_drawn then
            if blind.prepped then
                local prioritem1 = blind.effect.extra.item_1
                local prioritem2 = blind.effect.extra.item_2
                local item1list = {}
                local item2list = {}
                for i = 1, #blind.effect.extra.list do
                    if not (blind.effect.extra.list[i] == prioritem1) and not (blind.effect.extra.list[i] == prioritem2) then
                        table.insert(item1list, blind.effect.extra.list[i])
                    end
                end
                blind.effect.extra.item_1 = pseudorandom_element(item1list,
                    "mannpower_vaccinator" .. G.GAME.round_resets.ante)
                for i = 1, #blind.effect.extra.list do
                    if not (blind.effect.extra.list[i] == prioritem2) and not (blind.effect.extra.list[i] == blind.effect.extra.item_1) and not (blind.effect.extra.list[i] == prioritem1) then
                        table.insert(item2list, blind.effect.extra.list[i])
                    end
                end
                blind.effect.extra.item_2 = pseudorandom_element(item2list,
                    "mannpower_vaccinator" .. G.GAME.round_resets.ante)
                local item_1 = blind.effect.extra.item_1
                local item_2 = blind.effect.extra.item_2
                --[[for i, playing_card in ipairs(G.hand.cards) do -- trying this because the fuckass debuff recalcage doesn't actually recalc it I guess
                    if playing_card.debuff then                -- because why would it do that?
                        local thing = false                    -- it would be too normal and logical and FUCK YOU
                        if playing_card:is_suit("Hearts") and ((item_1 == "Hearts") or (item_2 == "Hearts")) then
                            thing = true
                        end
                        if playing_card:is_suit("Spades") and ((item_1 == "Spades") or (item_2 == "Spades")) then
                            thing = true
                        end
                        if playing_card:is_suit("Diamonds") and ((item_1 == "Diamonds") or (item_2 == "Diamonds")) then
                            thing = true
                        end
                        if playing_card:is_suit("Clubs") and ((item_1 == "Clubs") or (item_2 == "Clubs")) then
                            thing = true
                        end
                        if next(SMODS.get_enhancements(playing_card)) and ((item_1 == "Cards with Enhancements") or (item_2 == "Cards with Enhancements")) then
                            thing = true
                        end
                        if playing_card.edition and ((item_1 == "Cards with Editions") or (item_2 == "Cards with Editions")) then
                            thing = true
                        end
                        if playing_card:get_seal() and ((item_1 == "Cards with Seals") or (item_2 == "Cards with Seals")) then
                            thing = true
                        end
                        if playing_card:is_face(true) and ((item_1 == "Face cards") or (item_2 == "Face cards")) then
                            thing = true
                        end
                        if thing == false then SMODS.recalc_debuff(playing_card) end
                    end
                end]]
                for k, v in pairs(G.playing_cards) do
                    SMODS.recalc_debuff(v)
                end
            end
            blind:set_text()
        end
        if context.debuff_card and context.debuff_card.area ~= G.jokers then
            local rank = context.debuff_card:get_id()
            local item_1 = blind.effect.extra.item_1
            local item_2 = blind.effect.extra.item_2
            if context.debuff_card:is_suit("Hearts", true) and ((item_1 == "Hearts") or (item_2 == "Hearts")) then
                return { debuff = true }
            end
            if context.debuff_card:is_suit("Spades", true) and ((item_1 == "Spades") or (item_2 == "Spades")) then
                return { debuff = true }
            end
            if context.debuff_card:is_suit("Diamonds", true) and ((item_1 == "Diamonds") or (item_2 == "Diamonds")) then
                return { debuff = true }
            end
            if context.debuff_card:is_suit("Clubs", true) and ((item_1 == "Clubs") or (item_2 == "Clubs")) then
                return { debuff = true }
            end
            if next(SMODS.get_enhancements(context.debuff_card)) and ((item_1 == "Cards with Enhancements") or (item_2 == "Cards with Enhancements")) then
                return { debuff = true }
            end
            if context.debuff_card.edition and ((item_1 == "Cards with Editions") or (item_2 == "Cards with Editions")) then
                return { debuff = true }
            end
            if context.debuff_card:get_seal(true) and ((item_1 == "Cards with Seals") or (item_2 == "Cards with Seals")) then
                return { debuff = true }
            end
            if context.debuff_card:is_face(true) and ((item_1 == "Face cards") or (item_2 == "Face cards")) then
                return { debuff = true }
            end
            --if rank == 2 or rank == 3 or rank == 4 or rank == 5 or rank == 6 or rank == 8 or rank == 7 or rank == 9 or rank == 10 then
            --	return { debuff = true }
            --end
        end
    end,
}
