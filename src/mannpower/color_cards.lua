--local isFluff = SMODS.find_mod("MoreFluff")[1] -- apparently morefluff is undergoing a substantial rework right when I decide to try to add crossmod,
-- so until that's all done imma just
--if isFluff then
if not (FLUFF and FLUFF.is_rewrite) then
    sendInfoMessage("Mannlatro's crossmod content requires the rewrite version of More Fluff.",
        "Mannlatro - MoreFluff")
    return
else
    FLUFF.Colour({
        key = "col_mannco_orange",
        name = "col_MannCo_Orange",
        atlas = "mp_colors",
        pos = { x = 3, y = 0 },
        config = {
            upgrade_rounds = 2,
            create_set = "Mannpower",
        },
        attributes = { "generation", "mannpower", "consumable" },
    })
    FLUFF.Colour({
        key = "col_teamspirit",
        name = "col_TeamSpirit",
        atlas = "mp_colors",
        pos = { x = 2, y = 0 },
        config = {
            upgrade_rounds = 2,
        },
        attributes = { attributes = { "modify_card", "mannpower" } },
        can_use = function(self, card)
            if G.hand and #G.hand.cards > 0 then
                for k, v in pairs(G.hand.cards) do
                    if not (v:get_seal() == "mannpower_strange") then
                        return true
                    end
                end
            end
            return false
        end,
        colour_effect = function(self, card, area)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    local temp_pool = {}
                    local backup_pool = {}
                    for k, v in pairs(G.hand.cards) do
                        if not v:get_seal() then
                            table.insert(temp_pool, v)
                        end
                        if v:get_seal() and not (v:get_seal() == "mannpower_strange") then
                            table.insert(backup_pool, v)
                        end
                    end
                    if #temp_pool > 0 then
                        local over = false
                        local eligible_card = pseudorandom_element(temp_pool, pseudoseed("black"))
                        eligible_card:set_seal("mannpower_strange", nil, true)
                        check_for_unlock({ type = 'strange_made' })
                        eligible_card:juice_up(0.3, 0.5)
                    elseif #backup_pool > 0 then
                        local over = false
                        local eligible_card = pseudorandom_element(backup_pool, pseudoseed("black"))
                        eligible_card:set_seal("mannpower_strange", nil, true)
                        check_for_unlock({ type = 'strange_made' })
                        eligible_card:juice_up(0.3, 0.5)
                    end
                    return true
                end,
            }))
        end,
    })
    --[[FLUFF.Colour({
        key = "col_mannco_orange",
        name = "col_MannCo_Orange",
        atlas = "mp_spectral_spectrum",
        pos = { x = 0, y = 0 },
        config = {
            upgrade_rounds = 2,
            create_set = "WheelofFate",
        },
        attributes = { "generation", "screamfortress", "consumable" },
    })]]
end
--end
