local M = {}

function M.highlights(colors, set)
	set(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
	set(0, "NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg_dark })
	set(0, "NeoTreeVertSplit", { fg = colors.border })
	set(0, "NeoTreeWinSeparator", { fg = colors.border })
	set(0, "NeoTreeEndOfBuffer", { fg = colors.bg })
	set(0, "NeoTreeRootName", { fg = colors.bright, bold = true })

	-- Git status colors
	set(0, "NeoTreeGitAdded", { fg = colors.accent })
	set(0, "NeoTreeGitConflict", { fg = colors.error })
	set(0, "NeoTreeGitDeleted", { fg = colors.error })
	set(0, "NeoTreeGitIgnored", { fg = colors.dim })
	set(0, "NeoTreeGitModified", { fg = colors.warning })
	set(0, "NeoTreeGitUnstaged", { fg = colors.warning })
	set(0, "NeoTreeGitUntracked", { fg = colors.dim })
	set(0, "NeoTreeGitStaged", { fg = colors.accent })

	-- File tree UI elements
	set(0, "NeoTreeIndentMarker", { fg = colors.bg_highlight })
	set(0, "NeoTreeExpander", { fg = colors.dim })
	set(0, "NeoTreeDimText", { fg = colors.dim })
	set(0, "NeoTreeDirectoryIcon", { fg = colors.dim })
	set(0, "NeoTreeDirectoryName", { fg = colors.fg })
	set(0, "NeoTreeDotfile", { fg = colors.dim })
	set(0, "NeoTreeFileIcon", { fg = colors.dim })
	set(0, "NeoTreeFileName", { fg = colors.fg })
	set(0, "NeoTreeFileNameOpened", { fg = colors.bright })
	set(0, "NeoTreeHiddenByName", { fg = colors.dim })
	set(0, "NeoTreeIgnored", { fg = colors.dim })
	set(0, "NeoTreeSymbolicLinkTarget", { fg = colors.accent, underline = true })

	-- Search and filter
	set(0, "NeoTreeFilterTerm", { fg = colors.accent })

	-- Floating windows
	set(0, "NeoTreeFloatBorder", { fg = colors.border })
	set(0, "NeoTreeFloatTitle", { fg = colors.bright })
	set(0, "NeoTreeTitleBar", { fg = colors.bright, bg = colors.bg_light })

	-- Status line
	set(0, "NeoTreeStatusLine", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NeoTreeStatusLineNC", { fg = colors.dim, bg = colors.bg_dark })

	-- Other UI elements
	set(0, "NeoTreeSignColumn", { fg = colors.dim, bg = colors.bg })
	set(0, "NeoTreeCursorLine", { bg = colors.cursor_line })
	set(0, "NeoTreeBufferNumber", { fg = colors.dim })
	set(0, "NeoTreeWindowsHidden", { fg = colors.dim })
	set(0, "NeoTreeStats", { fg = colors.dim })
	set(0, "NeoTreeStatsHeader", { fg = colors.bright })
end

return M