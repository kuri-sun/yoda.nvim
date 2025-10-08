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
	
	-- Snacks file search character match highlights
	set(0, "SnacksPickerMatch", { fg = colors.accent })
	set(0, "SnacksPickerCursor", { fg = colors.accent, bg = colors.selection })
	set(0, "SnacksSearchMatch", { fg = colors.accent })

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
	
	-- Native vim file explorer (netrw) highlights
	set(0, "netrwDir", { fg = colors.string_green })  -- Directory names with green
	set(0, "netrwClassify", { fg = colors.white })    -- Directory "/" suffix in white
	set(0, "netrwLink", { fg = colors.cyan })         -- Symlinks
	set(0, "netrwExe", { fg = colors.accent })        -- Executables
	set(0, "netrwPlain", { fg = colors.fg })          -- Regular files
	
	-- Multiple possible names for current selection in netrw
	set(0, "netrwCursorline", { fg = colors.string_green, underline = true })
	set(0, "netrwCursor", { fg = colors.string_green, underline = true })
	set(0, "netrwSelected", { fg = colors.string_green, underline = true })
	set(0, "netrwMarkFile", { fg = colors.string_green, underline = true })
	
	-- todo-comments.nvim plugin highlights
	set(0, "TodoBgTODO", { fg = colors.todo_purple, bold = true })
	set(0, "TodoFgTODO", { fg = colors.todo_purple, bold = true })
	set(0, "TodoSignTODO", { fg = colors.todo_purple, bold = true })
	set(0, "TodoBgNOTE", { fg = colors.interface, bold = true })
	set(0, "TodoFgNOTE", { fg = colors.interface, bold = true })
	set(0, "TodoSignNOTE", { fg = colors.interface, bold = true })
	set(0, "TodoBgFIX", { fg = colors.error, bold = true })
	set(0, "TodoFgFIX", { fg = colors.error, bold = true })
	set(0, "TodoSignFIX", { fg = colors.error, bold = true })
	set(0, "TodoBgHACK", { fg = colors.warning, bold = true })
	set(0, "TodoFgHACK", { fg = colors.warning, bold = true })
	set(0, "TodoSignHACK", { fg = colors.warning, bold = true })
end

return M

