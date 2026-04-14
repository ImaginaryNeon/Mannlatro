-- Literally just copying the Cryptid highlighted cards thing and trimming some of the fat so I can target Jokers with consumables without needing Cryptid as a dependency.
-- I genuinely don't understand half of this, so there's a chance everything breaks when I try to implement it
function Mannlatro.get_highlighted_cards(areas, ignore, min, max, blacklist, seed)
	ignore.checked = true
	blacklist = blacklist or function()
		return true
	end
	local cards = {}
	for i, area in pairs(areas) do
		if area.cards then
			for i2, card in pairs(area.cards) do
				if
					card ~= ignore
					and blacklist(card)
					and (card.highlighted)
					and not card.checked
				then
					cards[#cards + 1] = card
					card.checked = true
				end
			end
		end
	end
	for i, v in ipairs(cards) do
		v.checked = nil
	end
	if (#cards >= min and #cards <= max) then
		ignore.checked = nil
		return cards
	else
		for i, v in pairs(cards) do
			v.f_use_order = i
		end
		pseudoshuffle(cards, pseudoseed("forcehighlight" or seed))
		local actual = {}
		for i = 1, max do
			if cards[i] and not cards[i].checked and actual ~= ignore then
				actual[#actual + 1] = cards[i]
			end
		end
		table.sort(actual, function(a, b)
			return a.f_use_order < b.f_use_order
		end)
		for i, v in pairs(cards) do
			v.f_use_order = nil
		end
		ignore.checked = nil
		return actual
	end
	return {}
end
