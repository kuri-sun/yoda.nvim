local M = {}

function M.highlights(colors, set)
	-- GitSigns highlights
	set(0, "GitSignsAdd", { fg = colors.accent })
	set(0, "GitSignsChange", { fg = colors.warning })
	set(0, "GitSignsDelete", { fg = colors.error })
	set(0, "GitSignsAddNr", { fg = colors.accent })
	set(0, "GitSignsChangeNr", { fg = colors.warning })
	set(0, "GitSignsDeleteNr", { fg = colors.error })
	set(0, "GitSignsAddLn", { bg = colors.diff_add })
	set(0, "GitSignsChangeLn", { bg = colors.diff_change })
	set(0, "GitSignsDeleteLn", { bg = colors.diff_delete })
end

return M