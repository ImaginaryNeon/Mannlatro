SMODS.Achievement {
    key = "strange0",
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "strange_made" then
            return true
        end
    end,
}
SMODS.current_mod.calculate = function(self, context)
    if context.individual and context.cardarea == G.play and context.other_card.seal == "mannpower_strange" then
        G.GAME.mannpower_strange_counter = G.GAME.mannpower_strange_counter or 0
        G.GAME.mannpower_strange_counter = (G.GAME.mannpower_strange_counter or 0) + 1
        print(G.GAME.mannpower_strange_counter)
        if G.GAME.mannpower_strange_counter >= 10 and G.GAME.mannpower_strange_counter <= 10000 then
            if G.GAME.mannpower_strange_counter >= 10 and G.GAME.mannpower_strange_counter <= 25 then
                check_for_unlock({ type = "strange_threshold1" })
            end
            if G.GAME.mannpower_strange_counter >= 25 and G.GAME.mannpower_strange_counter <= 45 then
                check_for_unlock({ type = "strange_threshold2" })
            end
            if G.GAME.mannpower_strange_counter >= 45 and G.GAME.mannpower_strange_counter <= 70 then
                check_for_unlock({ type = "strange_threshold3" })
            end
            if G.GAME.mannpower_strange_counter >= 70 and G.GAME.mannpower_strange_counter <= 100 then
                check_for_unlock({ type = "strange_threshold4" })
            end
            if G.GAME.mannpower_strange_counter >= 100 and G.GAME.mannpower_strange_counter <= 135 then
                check_for_unlock({ type = "strange_threshold5" })
            end
            if G.GAME.mannpower_strange_counter >= 135 and G.GAME.mannpower_strange_counter <= 175 then
                check_for_unlock({ type = "strange_threshold6" })
            end
            if G.GAME.mannpower_strange_counter >= 175 and G.GAME.mannpower_strange_counter <= 225 then
                check_for_unlock({ type = "strange_threshold7" })
            end
            if G.GAME.mannpower_strange_counter >= 225 and G.GAME.mannpower_strange_counter <= 275 then
                check_for_unlock({ type = "strange_threshold8" })
            end
            if G.GAME.mannpower_strange_counter >= 275 and G.GAME.mannpower_strange_counter <= 350 then
                check_for_unlock({ type = "strange_threshold9" })
            end
            if G.GAME.mannpower_strange_counter >= 350 and G.GAME.mannpower_strange_counter <= 500 then
                check_for_unlock({ type = "strange_threshold10" })
            end
            if G.GAME.mannpower_strange_counter >= 500 and G.GAME.mannpower_strange_counter <= 750 then
                check_for_unlock({ type = "strange_threshold11" })
            end
            if G.GAME.mannpower_strange_counter >= 750 and G.GAME.mannpower_strange_counter <= 999 then
                check_for_unlock({ type = "strange_threshold12" })
            end
            if G.GAME.mannpower_strange_counter >= 999 and G.GAME.mannpower_strange_counter <= 1500 then
                check_for_unlock({ type = "strange_threshold13" })
            end
            if G.GAME.mannpower_strange_counter >= 1000 and G.GAME.mannpower_strange_counter <= 1500 then
                check_for_unlock({ type = "strange_threshold14" })
            end
            if G.GAME.mannpower_strange_counter >= 1500 and G.GAME.mannpower_strange_counter < 2500 then
                check_for_unlock({ type = "strange_threshold15" })
            end
            if G.GAME.mannpower_strange_counter >= 2500 and G.GAME.mannpower_strange_counter < 5000 then
                check_for_unlock({ type = "strange_threshold16" })
            end
            if G.GAME.mannpower_strange_counter >= 5000 and G.GAME.mannpower_strange_counter < 7500 then
                check_for_unlock({ type = "strange_threshold17" })
            end
            if G.GAME.mannpower_strange_counter >= 7500 and G.GAME.mannpower_strange_counter < 7616 then
                check_for_unlock({ type = "strange_threshold18" })
            end
            if G.GAME.mannpower_strange_counter >= 7616 and G.GAME.mannpower_strange_counter < 8500 then
                check_for_unlock({ type = "strange_threshold19" })
            end
            if G.GAME.mannpower_strange_counter >= 8500 and G.GAME.mannpower_strange_counter < 10000 then
                check_for_unlock({ type = "strange_threshold20" })
            end
        end
        return true
    end
end
SMODS.Achievement {
    key = "strange1",
    bypass_all_unlocked = true,
    --    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold1" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange2",
    bypass_all_unlocked = true,
    --    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold2" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange3",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold3" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange4",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold4" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange5",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold5" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange6",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold6" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange7",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold7" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange8",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold8" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange9",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold9" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange10",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold10" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange11",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold11" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange12",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold12" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange13",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold13" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange14",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold14" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange15",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold15" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange16",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold16" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange17",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold17" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange18",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold18" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange19",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold19" then
            return true
        end
    end,
}
SMODS.Achievement {
    key = "strange20",
    --    bypass_all_unlocked = true,
    reset_on_startup = true,
    unlock_condition = function(self, args)
        if args.type == "strange_threshold20" then
            return true
        end
    end,
}
