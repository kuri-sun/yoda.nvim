local M = {}

function M.highlights(colors, set)
	-- Indent-blankline highlights
	set(0, "IblIndent", { fg = colors.bg_highlight })
	set(0, "IblScope", { fg = colors.border })

	-- Snacks.nvim highlights
	set(0, "SnacksNormal", { fg = colors.fg, bg = colors.bg })
	set(0, "SnacksBorder", { fg = colors.border })
	set(0, "SnacksTitle", { fg = colors.bright })
	set(0, "SnacksFooter", { fg = colors.dim })
	set(0, "SnacksKey", { fg = colors.bright })
	set(0, "SnacksValue", { fg = colors.fg })
	set(0, "SnacksDesc", { fg = colors.dim })
	set(0, "SnacksGroup", { fg = colors.bright })

	-- Dashboard highlights
	set(0, "DashboardHeader", { fg = colors.accent })
	set(0, "DashboardCenter", { fg = colors.fg })
	set(0, "DashboardFooter", { fg = colors.dim })
	set(0, "DashboardKey", { fg = colors.bright })
	set(0, "DashboardDesc", { fg = colors.fg })
	set(0, "DashboardIcon", { fg = colors.dim })

	-- WhichKey highlights
	set(0, "WhichKey", { fg = colors.bright })
	set(0, "WhichKeyGroup", { fg = colors.fg })
	set(0, "WhichKeyDesc", { fg = colors.fg })
	set(0, "WhichKeySeparator", { fg = colors.dim })
	set(0, "WhichKeyFloat", { bg = colors.bg_light })
	set(0, "WhichKeyValue", { fg = colors.fg })
end

return M