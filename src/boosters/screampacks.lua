SMODS.Booster {
    key = "spell_normal_1",
    weight = 1,
    kind = 'Merasmus', -- You can also use Arcana if you want it to belong to the vanilla kind
    cost = 4,
    atlas = 'halloweenpack',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_merasmus_pack", -- Delete this if you're using `group_name` in `loc_txt`
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra, colours = { HEX('43c77b') } },
            key = self.key:sub(1, -3) -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour { new_colour = SMODS.ConsumableTypes['WheelofFate'].primary_colour, special_colour = darken(G.C.BLACK, 0.2), contrast = 1.5 }
    end,
    --    particles = function(self)
    --        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
    --            timer = 0.015,
    --            scale = 0.2,
    --            initialize = true,
    --            lifespan = 1,
    --            speed = 1.1,
    --            padding = -1,
    --            attach = G.ROOM_ATTACH,
    --            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
    --            fill = true
    --        })
    --        G.booster_pack_sparkles.fade_alpha = 1
    --        G.booster_pack_sparkles:fade(1, 0)
    --    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "WheelofFate",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "konichiwa"
        }
        return _card
    end,
    cry_digital_hallucinations = {
        colour = HEX("38F3AB"),          --Message color
        loc_key = "mannpower_plus_fate", --Localization key
        create = function()
            local ccard = create_card("WheelofFate", G.consumables, nil, nil, nil, nil, nil, "diha")
            ccard:set_edition({ negative = true }, true)
            ccard:add_to_deck()
            G.consumeables:emplace(ccard)
        end
    }
}

SMODS.Booster {
    key = "spell_normal_2",
    weight = 0.9,
    kind = 'Merasmus',
    cost = 4,
    atlas = 'halloweenpack',
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_merasmus_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra, colours = { HEX('43c77b') } },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour { new_colour = SMODS.ConsumableTypes['WheelofFate'].primary_colour, special_colour = darken(G.C.BLACK, 0.2), contrast = 1.5 }
    end,
    --    particles = function(self)
    --        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
    --            timer = 0.015,
    --            scale = 0.2,
    --            initialize = true,
    --            lifespan = 1,
    --            speed = 1.1,
    --            padding = -1,
    --            attach = G.ROOM_ATTACH,
    --            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
    --            fill = true
    --        })
    --        G.booster_pack_sparkles.fade_alpha = 1
    --        G.booster_pack_sparkles:fade(1, 0)
    --    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "WheelofFate",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "konichiwa"
        }
        return _card
    end,
    cry_digital_hallucinations = {
        colour = HEX("38F3AB"),
        loc_key = "mannpower_plus_fate", --Localization key
        create = function()
            local ccard = create_card("WheelofFate", G.consumables, nil, nil, nil, nil, nil, "diha")
            ccard:set_edition({ negative = true }, true)
            ccard:add_to_deck()
            G.consumeables:emplace(ccard)
        end
    }
}

SMODS.Booster {
    key = "spell_normal_3", -- flask
    weight = 0.9,
    kind = 'Merasmus',
    cost = 4,
    atlas = 'halloweenpack',
    pos = { x = 2, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_merasmus_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra, colours = { HEX('43c77b') } },
            key = self.key:sub(1, -3) -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour { new_colour = SMODS.ConsumableTypes['WheelofFate'].primary_colour, special_colour = darken(G.C.BLACK, 0.2), contrast = 1.5 }
    end,
    --    particles = function(self)
    --        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
    --            timer = 0.015,
    --            scale = 0.2,
    --            initialize = true,
    --            lifespan = 1,
    --            speed = 1.1,
    --            padding = -1,
    --            attach = G.ROOM_ATTACH,
    --            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
    --            fill = true
    --        })
    --        G.booster_pack_sparkles.fade_alpha = 1
    --        G.booster_pack_sparkles:fade(1, 0)
    --    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "WheelofFate",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "konichiwa"
        }
        return _card
    end,
    cry_digital_hallucinations = {
        colour = HEX("38F3AB"),          --The message color to be displayed
        loc_key = "mannpower_plus_fate", --Localization key for the message to be displayed
        create = function()              --The function that adds the card to your run (example here for Program Packs)
            local ccard = create_card("WheelofFate", G.consumables, nil, nil, nil, nil, nil, "diha")
            ccard:set_edition({ negative = true }, true)
            ccard:add_to_deck()
            G.consumeables:emplace(ccard)
        end
    }
}


-- BIG

SMODS.Booster {
    key = "spell_rare_1",
    weight = 0.8,
    kind = 'Merasmus', -- You can also use Arcana if you want it to belong to the vanilla kind
    cost = 8,
    atlas = 'halloweenpack',
    pos = { x = 0, y = 1 },
    config = { extra = 5, choose = 1 },
    group_key = "k_merasmus_pack", -- Delete this if you're using `group_name` in `loc_txt`
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra, colours = { HEX('43c77b') } },
            key = self.key:sub(1, -3) -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour { new_colour = SMODS.ConsumableTypes['WheelofFate'].primary_colour, special_colour = darken(G.C.BLACK, 0.2), contrast = 1.5 }
    end,
    --    particles = function(self)
    --        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
    --            timer = 0.015,
    --            scale = 0.2,
    --            initialize = true,
    --            lifespan = 1,
    --            speed = 1.1,
    --            padding = -1,
    --            attach = G.ROOM_ATTACH,
    --            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
    --            fill = true
    --        })
    --        G.booster_pack_sparkles.fade_alpha = 1
    --        G.booster_pack_sparkles:fade(1, 0)
    --    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "WheelofFate",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "konichiwa"
        }
        return _card
    end,
    cry_digital_hallucinations = {
        colour = HEX("38F3AB"),          --The message color to be displayed
        loc_key = "mannpower_plus_fate", --Localization key for the message to be displayed
        create = function()              --The function that adds the card to your run (example here for Program Packs)
            local ccard = create_card("WheelofFate", G.consumables, nil, nil, nil, nil, nil, "diha")
            ccard:set_edition({ negative = true }, true)
            ccard:add_to_deck()
            G.consumeables:emplace(ccard)
        end
    }
}

SMODS.Booster {
    key = "spell_rare_2", -- ball
    weight = 0.8,
    kind = 'Merasmus',    -- You can also use Arcana if you want it to belong to the vanilla kind
    cost = 8,
    atlas = 'halloweenpack',
    pos = { x = 1, y = 1 },
    config = { extra = 5, choose = 1 },
    group_key = "k_merasmus_pack", -- Delete this if you're using `group_name` in `loc_txt`
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra, colours = { HEX('43c77b') } },
            key = self.key:sub(1, -3) -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour { new_colour = SMODS.ConsumableTypes['WheelofFate'].primary_colour, special_colour = darken(G.C.BLACK, 0.2), contrast = 1.5 }
    end,
    --    particles = function(self)
    --        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
    --            timer = 0.015,
    --            scale = 0.2,
    --            initialize = true,
    --            lifespan = 1,
    --            speed = 1.1,
    --            padding = -1,
    --            attach = G.ROOM_ATTACH,
    --            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
    --            fill = true
    --        })
    --        G.booster_pack_sparkles.fade_alpha = 1
    --        G.booster_pack_sparkles:fade(1, 0)
    --    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "WheelofFate",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "konichiwa"
        }
        return _card
    end,
    cry_digital_hallucinations = {
        colour = HEX("38F3AB"),          --The message color to be displayed
        loc_key = "mannpower_plus_fate", --Localization key for the message to be displayed
        create = function()              --The function that adds the card to your run (example here for Program Packs)
            local ccard = create_card("WheelofFate", G.consumables, nil, nil, nil, nil, nil, "diha")
            ccard:set_edition({ negative = true }, true)
            ccard:add_to_deck()
            G.consumeables:emplace(ccard)
        end
    }
}
