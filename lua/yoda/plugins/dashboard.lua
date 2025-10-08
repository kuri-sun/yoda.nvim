local M = {}

function M.highlights(colors, set)
	-- Dashboard highlights
	set(0, "DashboardHeader", { fg = colors.accent })
	set(0, "DashboardCenter", { fg = colors.fg })
	set(0, "DashboardFooter", { fg = colors.dim })
	set(0, "DashboardKey", { fg = colors.bright })
	set(0, "DashboardDesc", { fg = colors.fg })
	set(0, "DashboardIcon", { fg = colors.dim })
end

return M