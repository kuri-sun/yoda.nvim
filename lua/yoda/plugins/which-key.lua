local M = {}

function M.highlights(colors, set)
	-- WhichKey highlights
	set(0, "WhichKey", { fg = colors.bright })
	set(0, "WhichKeyGroup", { fg = colors.fg })
	set(0, "WhichKeyDesc", { fg = colors.fg })
	set(0, "WhichKeySeparator", { fg = colors.dim })
	set(0, "WhichKeyFloat", { bg = colors.bg_light })
	set(0, "WhichKeyValue", { fg = colors.fg })
end

return M