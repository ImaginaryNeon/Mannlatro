return {
    descriptions = {
        Joker = {
            j_mannpower_passjack = {
                name = 'PASS Time JACK',
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}Jack{} to create a",
                    "{C:diamonds}Mannpower{} card when scored",
                    "{C:inactive}(Must have room)",
                }
            },
        },
        Back = {
            b_mannpower_manndeck = {
                name = 'Mannpower Deck',
                text = {
                    "After defeating each {C:attention}Boss Blind{},",
                    "open a {C:attention}Mannpower Pack{}"
                },
                unlock = {
                    "Trigger playing cards with",
                    "a {V:1}Stat Clock{} 25 times",
                    "in a single run"
                    --[[
                    "Trigger playing cards with",
                    "a {V:1}Stat Clock{} 10 times",
                    "in a single run on {C:red}Red Stake{}",
                    "or {C:blue}Blue Stake{} difficulty"
                    --]]
                }
            }
        },
        Blind = {
            bl_mannpower_agility = {
                name = 'The Agility',
                text = {
                    'Discards highlighted cards',
                    'every 10 seconds'
                }
            },
            bl_mannpower_king = {
                name = 'The King',
                text = {
                    "All number cards",
                    "are debuffed",
                    "{C:inactive}#1#{}"
                }
            },
            bl_mannpower_strength = {
                name = 'The Strength',
                text = {
                    'Scoring cards have their rank',
                    'decreased by 1 before scoring'
                }
            },
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
                    'Played cards have a',
                    '1 in 4 chance to',
                    'gain a permenant -$1'
                }
            },
            bl_mannpower_precision = {
                name = 'The Precision',
                text = {
                    'Start with 1 hand',
                    'and 1 discard'
                }
            },
            bl_mannpower_reflect = {
                name = 'The Reflect',
                text = {
                    'Lose $1 for each owned Joker',
                    'when hand is played'
                }
            },
            bl_mannpower_regen = {
                name = "The Regeneration",
                text = {
                    "Lose #1# score",
                    "after each hand"
                },
            },
            bl_mannpower_resistance = {
                name = "The Resistance",
                text = {
                    "+#1# blind requirement",
                    "per Joker owned when",
                    "blind is selected"
                },
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
                    'Destroys 1 random unselected',
                    'card every 6 seconds,'
                }
            },
            bl_mannpower_vampire = {
                name = "The Vampire",
                text = {
                    "+#1# blind requirements",
                    "per card played"
                },
            },
        },
        Other = {
            p_mannpower_powerpack = { -- say that five times fast
                name = 'Mannpower Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:diamonds}Power-Up{} cards"
                }
            },
            mannpower_strange_seal = {
                name = 'Stat Clock',
                text = {
                    'Gains {C:mult}+#1#{} Mult when',
                    'this card is played',
                    'and scores',
                }
            }
        },
        Spectral = {
            c_mannpower_godmode = {
                name = 'Godmode',
                text = {
                    "All {C:attention}Editionless{} Jokers",
                    "become {C:dark_edition}Negative{}"
                }
            },
            c_mannpower_powerplay = {
                name = 'PowerPlay',
                text = {
                    "All {C:attention}Editionless{} cards in hand",
                    "become {C:dark_edition}Polychrome{}"
                }
            }

        },
        Mannpower = {
            c_mannpower_strength = {
                name = 'Strength',
                text = {
                    "Add a {C:attention}Stat Clock{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_mannpower_resistance = {
                name = 'Resistance',
                text = {
                    'Disables the current',
                    '{C:attention}Boss Blind{}'
                },
            },
            c_mannpower_vampire = {
                name = 'Vampire',
                text = {
                    "Removes {C:red}all {C:green}modifications{}",
                    "from up to {C:attention}#1#{} cards,",
                    "Earn {C:money}$#2#{} per {C:green}modification{} removed",
                    "{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)",
                }
            },
            c_mannpower_reflect = {
                name = 'Reflect',
                text = {
                    'Select up to #1# card',
                    'and permenantly give it {X:blind,C:white}X#2#{} Blind size',
                    '{C:inactive}(This effect stacks){}'
                }
            },
            c_mannpower_haste = {
                name = 'Haste',
                text = {
                    'Use on the {C:attention}first hand{} of a Blind',
                    'to double {C:blue}hands{} and {C:red}discards{}'
                }
            },
            c_mannpower_regeneration = {
                name = 'Regeneration',
                text = {
                    'Use to create',
                    'a {C:attention}D6 Tag{}'
                }
            },
            c_mannpower_precision = {
                name = 'Precision',
                text = {
                    'Use this card to earn {C:money}$#1#{}',
                    'Earn {C:red}$#2#{} less per Joker owned',
                    '{C:inactive}(Currently {C:money}$#3#{C:inactive})'
                }
            },
            c_mannpower_agility = {
                name = 'Agility',
                text = {
                    'Use this card to earn {C:money}$#2#{}',
                    'Earn {C:money}$#3#{} more if the last hand scored',
                    'more than the Blind requirements.'
                }
            },
            c_mannpower_knockout = {
                name = 'Knockout',
                text = {
                    "Increases rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}#2#{} and",
                    "remove their {C:attention}Enhancements{}",
                },
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
                    'Make #1# Joker {C:legendary}Eternal{},',
                    '{C:common}Perishable{}, and {C:dark_edition}Negative{}'
                }
            },
            c_mannpower_supernova = {
                name = 'Supernova',
                text = {
                    'Remove all Stickers',
                    'from 1 Joker'
                }
            }
        },
        Sleeve = {
            sleeve_mannpower_mannsleve = {
                name = "Mannpower Sleeve",
                text = {
                    "After defeating each {C:attention}Boss Blind{},",
                    "open a {C:attention}Mannpower Pack{}"
                },
            },
            sleeve_mannpower_mannsleve_alt = {
                name = "Mannpower Sleeve",
                text = {
                    "Start run with",
                    "{C:attention}Tour of Duty{}",
                    "and {C:attention}Squad Surplus{}"
                },
            },
            sleeve_mannpower_mannsleve_cry_alt = {
                name = "Mannpower Sleeve",
                text = {
                    "Start run with",
                    "{C:attention}Tour of Duty{},",
                    "{C:attention}Squad Surplus{},",
                    "and {C:cry_code}Developer Console{}"
                },
            }
        },
        Voucher = {
            v_mannpower_tour_of_duty = {
                name = "Tour of Duty",
                text = {
                    "{C:attention}Mannpower{} cards",
                    "can appear",
                    "in the {C:attention}shop{}",
                },
            },
            v_mannpower_squad_surplus = {
                name = "Squad Surplus",
                text = {
                    "{C:attention}Mannpower{} cards appear",
                    "{C:attention}#1#X{} more frequently",
                    "in the shop",
                },
            },
            v_mannpower_developer_console = {
                name = "Developer Console",
                text = {
                    "{C:attention}Mannpower{} cards may",
                    "appear in any of",
                    "the {C:cry_code}Code Packs",
                },
            },
        }
    },
    misc = {
        dictionary = {
            k_mannpower_pack = "Mannpower Pack",
            mannpower_plus_mann = "+1 Power-Up"
        },
        labels = {
            mannpower_strange_seal = "Stat Clock",
        },
        achievement_names = {
            ach_mannpower_strange0 = "Strange",
            ach_mannpower_strange1 = "Unremarkable",
            ach_mannpower_strange2 = "Scarcely Lethal",
            ach_mannpower_strange3 = "Mildly Menacing",
            ach_mannpower_strange4 = "Somewhat Threatening",
            ach_mannpower_strange5 = "Uncharitable",
            ach_mannpower_strange6 = "Notably Dangerous",
            ach_mannpower_strange7 = "Sufficiently Lethal",
            ach_mannpower_strange8 = "Truly Feared",
            ach_mannpower_strange9 = "Spectacularly Lethal",
            ach_mannpower_strange10 = "Mult-Splattered",
            ach_mannpower_strange11 = "Wicked Nasty",
            ach_mannpower_strange12 = "Positively Inhumane",
            ach_mannpower_strange13 = "Totally Ordinary",
            ach_mannpower_strange14 = "Blind-Melting",
            ach_mannpower_strange15 = "Retrigger-Inducing",
            ach_mannpower_strange16 = "Ante-Clearing",
            ach_mannpower_strange17 = "Epic",
            ach_mannpower_strange18 = "Legendary",
            ach_mannpower_strange19 = "Australian",
            ach_mannpower_strange20 = "Jimbo's Own",
        },
        achievement_descriptions = {
            ach_mannpower_strange0 = "Use a Consumable to get a Stat Clock on a playing card",
            ach_mannpower_strange1 = "Trigger playing cards with Stat Clocks 10 times in a run",
            ach_mannpower_strange2 = "Trigger playing cards with Stat Clocks 25 times in a run",
            ach_mannpower_strange3 = "Trigger playing cards with Stat Clocks 45 times in a run",
            ach_mannpower_strange4 = "Trigger playing cards with Stat Clocks 70 times in a run",
            ach_mannpower_strange5 = "Trigger playing cards with Stat Clocks 100 times in a run",
            ach_mannpower_strange6 = "Trigger playing cards with Stat Clocks a total of 135 times",
            ach_mannpower_strange7 = "Trigger playing cards with Stat Clocks a total of 175 times",
            ach_mannpower_strange8 = "Trigger playing cards with Stat Clocks a total of 225 times",
            ach_mannpower_strange9 = "Trigger playing cards with Stat Clocks a total of 275 times",
            ach_mannpower_strange10 = "Trigger playing cards with Stat Clocks a total of 350 times",
            ach_mannpower_strange11 = "Trigger playing cards with Stat Clocks a total of 500 times",
            ach_mannpower_strange12 = "Trigger playing cards with Stat Clocks a total of 750 times",
            ach_mannpower_strange13 = "Trigger playing cards with Stat Clocks a total of 999 times",
            ach_mannpower_strange14 = "Trigger playing cards with Stat Clocks a total of 1000 times",
            ach_mannpower_strange15 = "Trigger playing cards with Stat Clocks a total of 1500 times",
            ach_mannpower_strange16 = "Trigger playing cards with Stat Clocks a total of 2500 times",
            ach_mannpower_strange17 = "Trigger playing cards with Stat Clocks a total of 5000 times",
            ach_mannpower_strange18 = "Trigger playing cards with Stat Clocks a total of 7500 times",
            ach_mannpower_strange19 = "Trigger playing cards with Stat Clocks a total of 7616 times",
            ach_mannpower_strange20 = "Trigger playing cards with Stat Clocks a total of 8500 times",
        }
    }
}
