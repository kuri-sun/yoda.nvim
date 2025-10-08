local M = {}

function M.highlights(colors, set)
	-- Nvim-tree file explorer highlights (legacy support)
	set(0, "NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
	set(0, "NvimTreeRootFolder", { fg = colors.bright })
	set(0, "NvimTreeFolderIcon", { fg = colors.dim })
	set(0, "NvimTreeFolderName", { fg = colors.fg })
	set(0, "NvimTreeOpenedFolderName", { fg = colors.bright })
	set(0, "NvimTreeEmptyFolderName", { fg = colors.dim })
	set(0, "NvimTreeExecFile", { fg = colors.accent })
	set(0, "NvimTreeSpecialFile", { fg = colors.bright })
	set(0, "NvimTreeImageFile", { fg = colors.fg })
	set(0, "NvimTreeGitDirty", { fg = colors.warning })
	set(0, "NvimTreeGitStaged", { fg = colors.accent })
	set(0, "NvimTreeGitMerge", { fg = colors.warning })
	set(0, "NvimTreeGitNew", { fg = colors.accent })
	set(0, "NvimTreeGitDeleted", { fg = colors.error })
end

return M