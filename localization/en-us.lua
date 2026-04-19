return {
    descriptions = {
        Back = {
            b_mannpower_manndeck = {
                name = 'Mannpower Deck',
                text = {
                    "After defeating each {C:attention}Boss Blind{},",
                    "open a {C:attention}Mannpower Pack{}"
                },
                unlock = {
                    "Test",
                }
            }
        },
        Blind = {
            bl_mannpower_supernova = {
                name = 'The Supernova',
                text = {
                    'Played cards lose',
                    'their Enhancements'
                }
            },
            bl_mannpower_plague = {
                name = 'The Plague',
                text = {
                    'Played cards gain a permenant -$1'
                }
            },
            bl_mannpower_knockout = {
                name = 'The Knockout',
                text = {
                    'Played hands may not contain',
                    'more than 1 card'
                }
            },
            bl_mannpower_haste = {
                name = 'The Haste',
                text = {
                    'Destroys 1 card in hand',
                    'every 12 seconds,',
                    'multiplied by game speed'
                }
            },
            bl_mannpower_haste2 = {
                name = 'The Haste (V2)',
                text = {
                    'Discards 1 random card',
                    'every 10 seconds,',
                    'multiplied by game speed'
                }
            }
        },
        Other = {
            p_mannpower_mannpowerpack_1 = { -- say that five times fast
                name = 'Mannpower Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:gold}Power-Up{} cards"
                }
            },
            p_mannpower_mannpowerpack_2 = {
                name = 'Mannpower Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:gold}Power-Up{} cards"
                }
            },
        },
        Spectral = {
            c_mannpower_powerplay = {
                name = 'PowerPlay',
                text = {
                    "All Editionless cards in hand become {C:dark_edition}Polychrome{}",
                    "All Editionless Jokers become {C:dark_edition}Negative{}"
                }
            }
        },
        Mannpower = {
            c_mannpower_strength = {
                name = 'Strength',
                text = {
                    "Increases rank of",
                    "up to {C:attention}#1#{} selected",
                    "card by {C:attention}#2#{}",
                },
            },
            c_mannpower_resistance = {
                name = 'Resistance',
                text = {
                    'Disables the current',
                    '{C:attention}Boss Blind{}'
                },
            },
            c_mannpower_reflect = {
                name = 'Reflect',
                text = {
                    'Select up to #1# card',
                    'and permenantly give it {X:blind,C:white}x#2#{} Blind size',
                    '{C:inactive}(This effect stacks){}'
                }
            },
            c_mannpower_precision = {
                name = 'Precision',
                text = {
                    'Use this card to earn {C:money}$#1#{}',
                    'Increases by {C:money}$#2#{} when a hand scores',
                    'more than the Blind requirements'
                }
            },
            c_mannpower_kingmp = {
                name = 'King',
                text = {
                    'Enhance up to #1# card',
                    'into a Steel King'
                }
            },
            c_mannpower_plague = {
                name = 'Plague',
                text = {
                    'Make #1# Joker',
                    '{C:legendary}Eternal{} and {C:dark_edition}Negative{}'
                }
            },
            c_mannpower_supernova = {
                name = 'Supernova',
                text = {
                    'Remove all Stickers',
                    'from #1# Joker'
                }
            }
        }
    },
    dictionary = {
        k_mannpower_pack = "Mannpower Pack",
        mannpower_plus_mp = "+1 Power-Up"
    }
}
