SMODS.Voucher {
    key = 'tour_of_duty',
    atlas = 'vouchers',
    pos = { x = 0, y = 0 },
    config = { extra = { rate = 4 } },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mannpower_rate = card.ability.extra.rate
                return true
            end
        }))
    end,
    unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mannpower_rate = math.max(0, G.GAME.mannpower_rate - 4)
                return true
            end
        }))
    end,
}
SMODS.Voucher {
    key = 'squad_surplus',
    atlas = 'vouchers',
    pos = { x = 1, y = 0 },
    config = { extra = { rate = 3 } },
    requires = { 'v_mannpower_tour_of_duty' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rate } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mannpower_rate = 4 * card.ability.extra.rate
                return true
            end
        }))
    end,
    unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mannpower_rate = math.max(0, G.GAME.mannpower_rate / 3)
                return true
            end
        }))
    end,
}
if Cryptid then
    SMODS.Voucher {
        key = 'developer_console',
        atlas = 'vouchers',
        dependencies = {
            items = {
                "set_cry_tier3",
            },
        },
        pools = { ["Tier3"] = true },
        pos = { x = 2, y = 0 },
        --    unlocked = false,
        requires = { 'v_mannpower_squad_surplus' },
        calculate = function(self, card, context)
            if context.create_booster_card and context.booster.config.center.group_key == "k_cry_program_pack" and pseudorandom("developer_console") > 0.8 then
                return { booster_create_flags = { set = 'Mannpower', key_append = 'ar2', skip_materialize = true } }
            end
        end
        --    locked_loc_vars = function(self, info_queue, card)
        --        return { vars = { 25, G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls } }
        --    end,
        --    check_for_unlock = function(self, args)
        --        return args.type == 'c_tarot_reading_used' and G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls >= 25
        --    end
    }
end

SMODS.Voucher {
    key = 'spellbook_magazine', -- Wheel of Fate cards are 4x more likely to appear in the Shop
    atlas = 'vouchers',
    pos = { x = 0, y = 0 },
    config = { extra = { rate = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rate, colours = { HEX('43c77b') } } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.wheeloffate_rate = G.GAME.wheeloffate_rate * card.ability.extra.rate
                return true
            end
        }))
    end,
    unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.wheeloffate_rate = math.max(0, G.GAME.wheeloffate_rate / card.ability.extra.rate)
                return true
            end
        }))
    end,
}
SMODS.Voucher {
    key = 'fancy_spellbook', -- Wheel of Fate cards have +1 Duration
    atlas = 'vouchers',
    pos = { x = 1, y = 0 },
    config = { extra = { bonus = 1 } },
    requires = { 'v_mannpower_spellbook_magazine' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus, colours = { HEX('43c77b') } } }
    end,
    redeem = function(self, card)
        G.GAME.extended_duration_turns = (G.GAME.extended_duration_turns or 0) + card.ability.extra.bonus
    end,
    unredeem = function(self, card)
        G.GAME.extended_duration_turns = (G.GAME.extended_duration_turns or 0) - card.ability.extra.bonus
    end,
}
if Cryptid then
    SMODS.Voucher {
        key = 'fireproof_diary', -- Wheel of Fate cards have doubled Duration values
        atlas = 'vouchers',
        dependencies = {
            items = {
                "set_cry_tier3",
            },
        },
        pools = { ["Tier3"] = true },
        pos = { x = 2, y = 0 },
        --    unlocked = false,
        config = { extra = { bonus = 2 } },
        requires = { 'v_mannpower_fancy_spellbook' },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.bonus, colours = { SMODS.ConsumableTypes['WheelofFate'].badge_colour } } }
        end,
        redeem = function(self, card)
            G.GAME.extended_duration_mult = (G.GAME.extended_duration_mult or 1) * card.ability.extra.bonus
        end,
        unredeem = function(self, card)
            G.GAME.extended_duration_mult = (G.GAME.extended_duration_mult or 1) * card.ability.extra.bonus
        end,
        --    locked_loc_vars = function(self, info_queue, card)
        --        return { vars = { 25, G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls } }
        --    end,
        --    check_for_unlock = function(self, args)
        --        return args.type == 'c_tarot_reading_used' and G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls >= 25
        --    end
    }
end
