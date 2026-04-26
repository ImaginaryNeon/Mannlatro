local original_update = Game.update
function Game.update(self, dt)
    original_update(self, dt)
    local blind = G.GAME.blind
    if not G.SETTINGS.paused and blind and blind.config.blind.key == 'bl_mannpower_agility' then
        blind.effect.extra.timer = blind.effect.extra.timer + dt
        -- trigger after 10 seconds
        if blind.effect.extra.timer >= 8 then
            -- reset timer to 0
            blind.effect.extra.timer = 0
            -- do your effect that happens every 10 seconds here (thanks to srockw for helping with this)
            if G.hand and #G.hand.highlighted > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.FUNCS.discard_cards_from_highlighted(nil, true)
                        G.hand:unhighlight_all()
                        return true
                    end
                }))
            else
                message = "Missed!"
            end
        end
    end
end

SMODS.Blind {
    key = 'agility',
    atlas = 'mannpowerblind',
    pos = {
        y = 7
    },
    config = {
        extra = {
            timer = 0,
        },
    },
    boss = { min = 1, max = 10 },
    boss_colour = HEX('ED712B'),
    loc_vars = function(self)
        return { vars = { self.config.extra.timer } }
    end,
}
