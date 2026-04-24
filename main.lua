--#region Atlases

SMODS.Atlas { -- Jokers
    key = 'jonklers',
    path = 'jonklers.png',
    px = 71,
    py = 95
}

SMODS.Atlas { -- Vouchers
    key = 'vouchers',
    path = 'Vouchers.png',
    px = 71,
    py = 95
}

SMODS.Atlas { -- Mannpower Blinds
    key = 'mannpowerblind',
    path = 'mannpower.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
}

SMODS.Atlas { -- Mannpower Cards
    key = 'mannpowercards',
    path = 'mannpowercards.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "sleeve_atlas",
    path = "Sleeve.png",
    px = 73,
    py = 95
}

SMODS.Atlas {
    key = "statclock",
    path = "StatClock.png",
    px = 73,
    py = 95
}

SMODS.Atlas { -- Deck
    key = 'deck',
    path = 'manndeck.png',
    px = 71,
    py = 95
}

SMODS.Atlas { -- Mannpower Packs
    key = 'mannpowerpack',
    path = 'powerpacks.png',
    px = 58,
    py = 73
}

SMODS.Atlas { -- Jokers
    key = 'RTD',
    path = 'PowerPlay.png',
    px = 71,
    py = 95
}

--#endregion

--#region File Loading

local blind_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/blinds")
for _, file in ipairs(blind_src) do
    assert(SMODS.load_file("src/blinds/" .. file))()
end

local mannpower_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/mannpower")
for _, file in ipairs(mannpower_src) do
    assert(SMODS.load_file("src/mannpower/" .. file))()
end

local boosters_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/boosters")
for _, file in ipairs(boosters_src) do
    assert(SMODS.load_file("src/boosters/" .. file))()
end

SMODS.current_mod.optional_features = function()
    return {
        post_trigger = true,
        retrigger_joker = true,
        cardareas = {
            discard = true,
            deck = true
        }
    }
end
--#endregion
