SMODS.Blind {
    key = "reflect",
    atlas = 'mannpowerblind',
    pos = {
        y = 3
    },
    boss = { min = 3 },
    boss_colour = HEX("b52d2d"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].ability.set == 'Joker' then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers.cards[i]:juice_up()
                                        return true
                                    end,
                                }))
                                ease_dollars(-1)
                                delay(0.23)
                            end
                        end
                        return true
                    end
                }))
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function()
                        SMODS.juice_up_blind()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        return true
                    end)
                }))
                delay(0.4)
            end
        end
    end
}
