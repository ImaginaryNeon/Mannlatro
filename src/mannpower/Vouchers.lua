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
    config = { extra = { rate = 4 } },
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
                G.GAME.mannpower_rate = math.max(0, G.GAME.mannpower_rate / 4)
                return true
            end
        }))
    end,
}
if Cryptid then
    SMODS.Voucher {
        key = 'developer_console',
        atlas = 'vouchers',
        order = 32657,
        dependencies = {
            items = {
                "set_cry_tier3",
            },
        },
        pools = { ["Tier3"] = true },
        pos = { x = 2, y = 0 },
        --    unlocked = false,
        requires = { 'v_mannpower_squad_surplus' },
        --    locked_loc_vars = function(self, info_queue, card)
        --        return { vars = { 25, G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls } }
        --    end,
        --    check_for_unlock = function(self, args)
        --        return args.type == 'c_tarot_reading_used' and G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls >= 25
        --    end
    }
    SMODS.Booster:take_ownership_by_kind('Code', {
            create_card = function(self, card, i)
                local _card
                if (G.GAME.used_vouchers.v_mannpower_developer_console and pseudorandom('developer_console') > 0.8) then
                    _card = {
                        set = "Mannpower",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append =
                        "ar2"
                    }
                else
                    _card = {
                        set = "Code",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append =
                        "ar1"
                    }
                end
                return _card
            end,
        },
        true
    )
end
