SMODS.Joker {
    key = "vaccinator",
    name = "Violent Vaccinator",
    atlas = 'bossjoker',
    --poke_custom_prefix = "finity_boss",
    pronouns = "he_him",
    config = {
        extra = { xmult = 2, list = { "cards with Enhancements", "cards with Editions", "cards with Seals", "face cards", "odd ranks", "even ranks", "Hearts", "Diamonds", "Clubs", "Spades" },
            item_1 = '???', item_2 = '???', },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult, card.ability.extra.item_1, card.ability.extra.item_2 }
        }
    end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = "finity_showdown",
    pos = { x = 0, y = 0 },
    cost = 10,
    soul_pos = { x = 1, y = 0 },
    dependencies = { 'finity' },
    add_to_deck = function(self, card, from_debuff)
        local prioritem1 = card.ability.extra.item_1
        local prioritem2 = card.ability.extra.item_2
        local item1list = {}
        local item2list = {}
        for i = 1, #card.ability.extra.list do
            if not (card.ability.extra.list[i] == prioritem1) and not (card.ability.extra.list[i] == prioritem2) then
                table.insert(item1list, card.ability.extra.list[i])
            end
        end
        card.ability.extra.item_1 = pseudorandom_element(item1list,
            "mannpower_vaccinator_joker" .. G.GAME.round_resets.ante)
        for i = 1, #card.ability.extra.list do
            if not (card.ability.extra.list[i] == prioritem2) and not (card.ability.extra.list[i] == card.ability.extra.item_1) and not (card.ability.extra.list[i] == prioritem1) then
                table.insert(item2list, card.ability.extra.list[i])
            end
        end
        card.ability.extra.item_2 = pseudorandom_element(item2list,
            "mannpower_vaccinator_joker" .. G.GAME.round_resets.ante)
    end,
    calculate = function(self, card, context)
        if context.ante_change and context.ante_end and not context.blueprint then
            local prioritem1 = card.ability.extra.item_1
            local prioritem2 = card.ability.extra.item_2
            local item1list = {}
            local item2list = {}
            for i = 1, #card.ability.extra.list do
                if not (card.ability.extra.list[i] == prioritem1) and not (card.ability.extra.list[i] == prioritem2) then
                    table.insert(item1list, card.ability.extra.list[i])
                end
            end
            card.ability.extra.item_1 = pseudorandom_element(item1list,
                "mannpower_vaccinator_joker" .. G.GAME.round_resets.ante)
            for i = 1, #card.ability.extra.list do
                if not (card.ability.extra.list[i] == prioritem2) and not (card.ability.extra.list[i] == card.ability.extra.item_1) and not (card.ability.extra.list[i] == prioritem1) then
                    table.insert(item2list, card.ability.extra.list[i])
                end
            end
            card.ability.extra.item_2 = pseudorandom_element(item2list,
                "mannpower_vaccinator_joker" .. G.GAME.round_resets.ante)
        end
        if context.individual and context.cardarea == G.play then
            local item_1 = card.ability.extra.item_1
            local item_2 = card.ability.extra.item_2
            local rank = context.other_card:get_id()
            if (context.other_card:is_suit("Hearts", true) and ((item_1 == "Hearts") or (item_2 == "Hearts")))
                or (context.other_card:is_suit("Spades", true) and ((item_1 == "Spades") or (item_2 == "Spades")))
                or (context.other_card:is_suit("Diamonds", true) and ((item_1 == "Diamonds") or (item_2 == "Diamonds")))
                or (context.other_card:is_suit("Clubs", true) and ((item_1 == "Clubs") or (item_2 == "Clubs")))
                or (next(SMODS.get_enhancements(context.other_card)) and ((item_1 == "cards with Enhancements") or (item_2 == "cards with Enhancements")))
                or (((rank <= 10 and rank >= 0 and rank % 2 == 1) or (rank == 14)) and ((item_1 == "odd ranks") or (item_2 == "odd ranks")))
                or ((rank <= 10 and rank >= 0 and rank % 2 == 0) and ((item_1 == "even ranks") or (item_2 == "even ranks")))
                or (context.other_card.edition and ((item_1 == "cards with Editions") or (item_2 == "cards with Editions")))
                or (context.other_card:get_seal(true) and ((item_1 == "cards with Seals") or (item_2 == "cards with Seals")))
                or (context.other_card:is_face(true) and ((item_1 == "face cards") or (item_2 == "face cards"))) then
                return { xmult = card.ability.extra.xmult }
            end
            --return {
            --      Xmult_mod = card.ability.extra.xmult,
            --      message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            --}
        end
    end
}
