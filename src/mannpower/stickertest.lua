local isCryptid = SMODS.find_mod("Cryptid")[1]
local abovestake = (isCryptid and "orange") or "gold"

--[[SMODS.Stake {
    name = "Haunted Stake",
    key = "haunted",
    pos = { x = 0, y = 0 },
    atlas = "stake",
    applied_stakes = { abovestake },
    above_stake = abovestake,
    colour = HEX("4fe89b"),
    sticker_atlas = "sticker",
    sticker_pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX('43c77b') } }, }
    end,
    prefix_config = { applied_stakes = { mod = false } },
    modifiers = function()
        --        G.GAME.modifiers.enable_eternaween_in_shop = true
        G.GAME.modifiers.enable_mannpower_halloween = true
    end,
}]]

SMODS.Sticker {
    key = "halloween",
    atlas = 'sticker',
    badge_colour = HEX('9b1718'),
    pos = { x = 0, y = 0 },
    config = {
        pisspants = false
    },
    needs_enable_flag = true,
    --[[should_apply = function(self, card, center, area, bypass_roll)
        return G.GAME.modifiers.enable_eternaween_in_shop and
            SMODS.Sticker.should_apply(self, card, center, area, bypass_roll) -- this handles the enable flag and rate
    end,]]
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { SMODS.ConsumableTypes['WheelofFate'].badge_colour } }, }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if card.ability.mannpower_halloween.pisspants == false then
                return {
                    message = localize('k_disabled_ex'),
                    colour = G.C.FILTER,
                    delay = 0.45,
                    func = function()
                        card:set_debuff(true)
                    end
                }
            end
        end
        if context.using_consumeable and context.consumeable.ability.set == 'WheelofFate' then
            card.ability.mannpower_halloween.pisspants = true
            SMODS.debuff_card(card, "prevent_debuff", "halloween")
        end
    end
}
