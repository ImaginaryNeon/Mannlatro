SMODS.ConsumableType {
    key = 'Mannpower',
    name = 'Mannpower',
    primary_colour = HEX('FFA630'),
    secondary_colour = HEX('FFF812'),
    badge_colour = HEX('ED712B'),
    default = "c_mannpower_strength",
    select_card = "consumeables",
    shop_rate = 1,
    loc_txt = {
        name = 'Mannpower',       -- used on card type badges
        collection = 'Mannpower', -- label for the button to access the collection
        undiscovered = {          -- description for undiscovered cards in the collection
            name = 'Not Discovered',
            text = { 'Purchase or use this powerup in a match of Mannpower to learn what it does', 'Or just go to the wiki, I\'m not your mom' },
        },
    }
}
