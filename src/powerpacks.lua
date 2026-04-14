SMODS.Booster {
    key = "powerpack_normal_1",
    weight = 1,
    kind = 'MannpowerP', -- You can also use Arcana if you want it to belong to the vanilla kind
    cost = 4,
    atlas = 'mannpowerpack'
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_mannpower_pack", -- Delete this if you're using `group_name` in `loc_txt`
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.SECONDARY_SET.Planet, 0.2), lighten(G.C.BLUE, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "Mannpower",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "Haltwhereisgabrielandwhathaveyoudonewithhim"
        }
        end
        return _card
    end,
},
SMODS.Booster {
    key = "powerpack_normal_2",
    weight = 1,
    kind = 'MannpowerP', -- You can also use Arcana if you want it to belong to the vanilla kind
    cost = 4,
    atlas = 'mannpowerpack'
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_mannpower_pack", -- Delete this if you're using `group_name` in `loc_txt`
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.MULT, 0.4), lighten(G.C.SUITS.Hearts, 0.2), lighten(G.C.MULT, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card
        _card = {
            set = "Mannpower",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "Haltwhereisgabrielandwhathaveyoudonewithhim"
        }
        end
        return _card
    end,
}
