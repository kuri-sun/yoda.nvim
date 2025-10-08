local M = {}

function M.setup()
	local colors = require("colors").palette
	local set = vim.api.nvim_set_hl

	-- Reset colorscheme
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Editor highlights (minimal approach)
	set(0, "Normal", { fg = colors.fg, bg = colors.bg })
	set(0, "NormalNC", { fg = colors.fg, bg = colors.bg_dark })
	set(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_light })
	set(0, "FloatBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "FloatTitle", { fg = colors.bright, bg = colors.bg_light })

	set(0, "Cursor", { fg = colors.bg, bg = colors.accent })
	set(0, "CursorLine", { bg = colors.cursor_line })
	set(0, "CursorLineNr", { fg = colors.fg })
	set(0, "LineNr", { fg = colors.line_number })

	set(0, "Visual", { bg = colors.selection })
	set(0, "VisualNOS", { bg = colors.selection })
	set(0, "Search", { fg = colors.bg, bg = colors.accent })
	set(0, "IncSearch", { fg = colors.bg, bg = colors.accent })
	set(0, "CurSearch", { fg = colors.bg, bg = colors.accent })

	set(0, "StatusLine", { fg = colors.fg, bg = colors.bg_light })
	set(0, "StatusLineNC", { fg = colors.dim, bg = colors.bg_dark })
	set(0, "WinBar", { fg = colors.fg, bg = colors.bg })
	set(0, "WinBarNC", { fg = colors.dim, bg = colors.bg })

	set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_light })
	set(0, "PmenuSel", { fg = colors.bg, bg = colors.accent })
	set(0, "PmenuSbar", { bg = colors.bg_highlight })
	set(0, "PmenuThumb", { bg = colors.border })

	set(0, "TabLine", { fg = colors.dim, bg = colors.bg_light })
	set(0, "TabLineFill", { bg = colors.bg_dark })
	set(0, "TabLineSel", { fg = colors.bright, bg = colors.bg })

	set(0, "MatchParen", { fg = colors.accent, underline = true })
	set(0, "ColorColumn", { bg = colors.bg_highlight })
	set(0, "SignColumn", { fg = colors.dim, bg = colors.bg })
	set(0, "FoldColumn", { fg = colors.dim, bg = colors.bg })
	set(0, "Folded", { fg = colors.dim, bg = colors.bg_light })

	set(0, "WildMenu", { fg = colors.bg, bg = colors.accent })
	set(0, "Directory", { fg = colors.fg })
	set(0, "Question", { fg = colors.fg })
	set(0, "MoreMsg", { fg = colors.fg })
	set(0, "ModeMsg", { fg = colors.fg })

	set(0, "ErrorMsg", { fg = colors.error })
	set(0, "WarningMsg", { fg = colors.warning })

	set(0, "NonText", { fg = colors.dim })
	set(0, "SpecialKey", { fg = colors.dim })
	set(0, "Whitespace", { fg = colors.dim })
	set(0, "EndOfBuffer", { fg = colors.bg })

	set(0, "VertSplit", { fg = colors.border })
	set(0, "WinSeparator", { fg = colors.border })

	-- Syntax highlights (green theme with brown accents)
	set(0, "Comment", { fg = colors.dim, italic = true })
	set(0, "Constant", { fg = colors.bright })
	set(0, "String", { fg = colors.white })
	set(0, "Character", { fg = colors.white })
	set(0, "Number", { fg = colors.bright })
	set(0, "Boolean", { fg = colors.bright })
	set(0, "Float", { fg = colors.bright })

	set(0, "Identifier", { fg = colors.fg })
	set(0, "Function", { fg = colors.brown })

	set(0, "Statement", { fg = colors.accent })
	set(0, "Conditional", { fg = colors.accent })
	set(0, "Repeat", { fg = colors.accent })
	set(0, "Label", { fg = colors.fg })
	set(0, "Operator", { fg = colors.subtle })
	set(0, "Keyword", { fg = colors.accent })
	set(0, "Exception", { fg = colors.accent })

	set(0, "PreProc", { fg = colors.subtle })
	set(0, "Include", { fg = colors.accent })
	set(0, "Define", { fg = colors.subtle })
	set(0, "Macro", { fg = colors.subtle })
	set(0, "PreCondit", { fg = colors.subtle })

	set(0, "Type", { fg = colors.interface })
	set(0, "StorageClass", { fg = colors.brown_dim })
	set(0, "Structure", { fg = colors.interface })
	set(0, "Typedef", { fg = colors.interface })

	set(0, "Special", { fg = colors.accent })
	set(0, "SpecialChar", { fg = colors.accent })
	set(0, "Tag", { fg = colors.fg })
	set(0, "Delimiter", { fg = colors.subtle })
	set(0, "SpecialComment", { fg = colors.dim, italic = true })
	set(0, "Debug", { fg = colors.warning })

	set(0, "Underlined", { underline = true })
	set(0, "Ignore", { fg = colors.dim })
	set(0, "Error", { fg = colors.error })
	set(0, "Todo", { fg = colors.accent, bold = true })

	-- Treesitter highlights (light green base with white strings)
	set(0, "@variable", { fg = colors.fg })
	set(0, "@variable.builtin", { fg = colors.bright })
	set(0, "@variable.parameter", { fg = colors.fg })
	set(0, "@variable.member", { fg = colors.fg })

	set(0, "@constant", { fg = colors.bright })
	set(0, "@constant.builtin", { fg = colors.bright })
	set(0, "@constant.macro", { fg = colors.bright })

	set(0, "@module", { fg = colors.fg })
	set(0, "@module.builtin", { fg = colors.bright })
	set(0, "@label", { fg = colors.fg })

	set(0, "@string", { fg = colors.white })
	set(0, "@string.documentation", { fg = colors.dim, italic = true })
	set(0, "@string.regexp", { fg = colors.accent })
	set(0, "@string.escape", { fg = colors.accent })
	set(0, "@string.special", { fg = colors.accent })
	set(0, "@string.special.symbol", { fg = colors.white })
	set(0, "@string.special.path", { fg = colors.white })
	set(0, "@string.special.url", { fg = colors.white, underline = true })

	set(0, "@character", { fg = colors.white })
	set(0, "@character.special", { fg = colors.accent })

	set(0, "@boolean", { fg = colors.bright })
	set(0, "@number", { fg = colors.bright })
	set(0, "@number.float", { fg = colors.bright })

	set(0, "@type", { fg = colors.interface })
	set(0, "@type.builtin", { fg = colors.bright })
	set(0, "@type.definition", { fg = colors.interface })

	set(0, "@attribute", { fg = colors.subtle })
	set(0, "@attribute.builtin", { fg = colors.subtle })
	set(0, "@property", { fg = colors.fg })

	set(0, "@function", { fg = colors.brown })
	set(0, "@function.builtin", { fg = colors.bright })
	set(0, "@function.call", { fg = colors.brown })
	set(0, "@function.macro", { fg = colors.subtle })
	set(0, "@function.method", { fg = colors.brown })
	set(0, "@function.method.call", { fg = colors.brown })

	set(0, "@constructor", { fg = colors.interface })
	set(0, "@operator", { fg = colors.subtle })

	set(0, "@keyword", { fg = colors.accent })
	set(0, "@keyword.coroutine", { fg = colors.pink })
	set(0, "@keyword.function", { fg = colors.pink })
	set(0, "@keyword.operator", { fg = colors.subtle })
	set(0, "@keyword.import", { fg = colors.pink })
	set(0, "@keyword.type", { fg = colors.accent })
	set(0, "@keyword.modifier", { fg = colors.accent })
	set(0, "@keyword.repeat", { fg = colors.pink })
	set(0, "@keyword.return", { fg = colors.pink })
	set(0, "@keyword.debug", { fg = colors.warning })
	set(0, "@keyword.exception", { fg = colors.pink })
	set(0, "@keyword.conditional", { fg = colors.pink })

	set(0, "@conditional", { fg = colors.pink })
	set(0, "@repeat", { fg = colors.pink })
	set(0, "@debug", { fg = colors.warning })
	set(0, "@exception", { fg = colors.pink })

	set(0, "@include", { fg = colors.pink })
	set(0, "@preproc", { fg = colors.subtle })
	set(0, "@define", { fg = colors.subtle })
	set(0, "@macro", { fg = colors.subtle })

	set(0, "@punctuation", { fg = colors.subtle })
	set(0, "@punctuation.delimiter", { fg = colors.subtle })
	set(0, "@punctuation.bracket", { fg = colors.subtle })
	set(0, "@punctuation.special", { fg = colors.subtle })

	set(0, "@comment", { fg = colors.dim, italic = true })
	set(0, "@comment.documentation", { fg = colors.dim, italic = true })
	set(0, "@comment.error", { fg = colors.error, italic = true })
	set(0, "@comment.warning", { fg = colors.warning, italic = true })
	set(0, "@comment.todo", { fg = colors.accent, bold = true })
	set(0, "@comment.note", { fg = colors.fg, italic = true })

	set(0, "@tag", { fg = colors.fg })
	set(0, "@tag.attribute", { fg = colors.subtle })
	set(0, "@tag.delimiter", { fg = colors.subtle })

	set(0, "@diff.plus", { fg = colors.accent })
	set(0, "@diff.minus", { fg = colors.error })
	set(0, "@diff.delta", { fg = colors.warning })

	-- LSP highlights (minimal)
	set(0, "DiagnosticError", { fg = colors.error })
	set(0, "DiagnosticWarn", { fg = colors.warning })
	set(0, "DiagnosticInfo", { fg = colors.fg })
	set(0, "DiagnosticHint", { fg = colors.dim })
	set(0, "DiagnosticOk", { fg = colors.accent })

	set(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
	set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
	set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.fg })
	set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.dim })
	set(0, "DiagnosticUnderlineOk", { undercurl = true, sp = colors.accent })

	set(0, "DiagnosticVirtualTextError", { fg = colors.error, bg = colors.bg_highlight })
	set(0, "DiagnosticVirtualTextWarn", { fg = colors.warning, bg = colors.bg_highlight })
	set(0, "DiagnosticVirtualTextInfo", { fg = colors.fg, bg = colors.bg_highlight })
	set(0, "DiagnosticVirtualTextHint", { fg = colors.dim, bg = colors.bg_highlight })
	set(0, "DiagnosticVirtualTextOk", { fg = colors.accent, bg = colors.bg_highlight })

	set(0, "DiagnosticSignError", { fg = colors.error })
	set(0, "DiagnosticSignWarn", { fg = colors.warning })
	set(0, "DiagnosticSignInfo", { fg = colors.fg })
	set(0, "DiagnosticSignHint", { fg = colors.dim })
	set(0, "DiagnosticSignOk", { fg = colors.accent })

	set(0, "LspReferenceText", { bg = colors.bg_highlight })
	set(0, "LspReferenceRead", { bg = colors.bg_highlight })
	set(0, "LspReferenceWrite", { bg = colors.bg_highlight })

	set(0, "LspCodeLens", { fg = colors.dim })
	set(0, "LspCodeLensSeparator", { fg = colors.dim })
	set(0, "LspSignatureActiveParameter", { fg = colors.accent })

	-- Git highlights (minimal)
	set(0, "GitSignsAdd", { fg = colors.accent })
	set(0, "GitSignsChange", { fg = colors.warning })
	set(0, "GitSignsDelete", { fg = colors.error })
	set(0, "GitSignsAddNr", { fg = colors.accent })
	set(0, "GitSignsChangeNr", { fg = colors.warning })
	set(0, "GitSignsDeleteNr", { fg = colors.error })
	set(0, "GitSignsAddLn", { bg = colors.diff_add })
	set(0, "GitSignsChangeLn", { bg = colors.diff_change })
	set(0, "GitSignsDeleteLn", { bg = colors.diff_delete })

	set(0, "DiffAdd", { bg = colors.diff_add })
	set(0, "DiffChange", { bg = colors.diff_change })
	set(0, "DiffDelete", { bg = colors.diff_delete })
	set(0, "DiffText", { bg = colors.diff_text })

	-- Telescope highlights (minimal)
	set(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg })
	set(0, "TelescopeBorder", { fg = colors.border })
	set(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_light })
	set(0, "TelescopePromptBorder", { fg = colors.border })
	set(0, "TelescopePromptTitle", { fg = colors.bright })
	set(0, "TelescopePreviewTitle", { fg = colors.bright })
	set(0, "TelescopeResultsTitle", { fg = colors.bright })
	set(0, "TelescopeSelection", { bg = colors.selection })
	set(0, "TelescopeSelectionCaret", { fg = colors.accent })
	set(0, "TelescopeMatching", { fg = colors.accent })

	-- Nvim-tree highlights (minimal)
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

	-- CMP highlights (minimal)
	set(0, "CmpItemAbbr", { fg = colors.fg })
	set(0, "CmpItemAbbrDeprecated", { fg = colors.dim, strikethrough = true })
	set(0, "CmpItemAbbrMatch", { fg = colors.accent })
	set(0, "CmpItemAbbrMatchFuzzy", { fg = colors.accent })
	set(0, "CmpItemKind", { fg = colors.subtle })
	set(0, "CmpItemMenu", { fg = colors.dim })

	-- Kind-specific highlights all use the same minimal colors
	local cmp_kinds = {
		"Text",
		"Method",
		"Function",
		"Constructor",
		"Field",
		"Variable",
		"Class",
		"Interface",
		"Module",
		"Property",
		"Unit",
		"Value",
		"Enum",
		"Keyword",
		"Snippet",
		"Color",
		"File",
		"Reference",
		"Folder",
		"EnumMember",
		"Constant",
		"Struct",
		"Event",
		"Operator",
		"TypeParameter",
	}
	for _, kind in ipairs(cmp_kinds) do
		set(0, "CmpItemKind" .. kind, { fg = colors.subtle })
	end

	-- Other plugin highlights (minimal)
	set(0, "IblIndent", { fg = colors.bg_highlight })
	set(0, "IblScope", { fg = colors.border })

	set(0, "SnacksNormal", { fg = colors.fg, bg = colors.bg })
	set(0, "SnacksBorder", { fg = colors.border })
	set(0, "SnacksTitle", { fg = colors.bright })
	set(0, "SnacksFooter", { fg = colors.dim })
	set(0, "SnacksKey", { fg = colors.bright })
	set(0, "SnacksValue", { fg = colors.fg })
	set(0, "SnacksDesc", { fg = colors.dim })
	set(0, "SnacksGroup", { fg = colors.bright })

	set(0, "DashboardHeader", { fg = colors.accent })
	set(0, "DashboardCenter", { fg = colors.fg })
	set(0, "DashboardFooter", { fg = colors.dim })
	set(0, "DashboardKey", { fg = colors.bright })
	set(0, "DashboardDesc", { fg = colors.fg })
	set(0, "DashboardIcon", { fg = colors.dim })

	set(0, "WhichKey", { fg = colors.bright })
	set(0, "WhichKeyGroup", { fg = colors.fg })
	set(0, "WhichKeyDesc", { fg = colors.fg })
	set(0, "WhichKeySeparator", { fg = colors.dim })
	set(0, "WhichKeyFloat", { bg = colors.bg_light })
	set(0, "WhichKeyValue", { fg = colors.fg })

	-- Lazygit highlights (balanced lightsaber theme, less green-heavy)
	set(0, "LazyGitBorder", { fg = colors.border })
	set(0, "LazyGitTitle", { fg = colors.bright, bold = true })
	set(0, "LazyGitNormal", { fg = colors.fg, bg = colors.bg })

	-- File status (warm, non-green palette)
	set(0, "LazyGitModified", { fg = colors.brown }) -- Warm brown for modified
	set(0, "LazyGitAdded", { fg = colors.interface }) -- Blue-gray for added (no green)
	set(0, "LazyGitDeleted", { fg = colors.error }) -- Red for deleted
	set(0, "LazyGitRenamed", { fg = colors.pink }) -- Pink for renamed
	set(0, "LazyGitUntracked", { fg = colors.brown_dim }) -- Warm dim for untracked
	set(0, "LazyGitStaged", { fg = colors.white }) -- White for staged (clean)
	set(0, "LazyGitConflicted", { fg = colors.warning }) -- Yellow for conflicts

	-- Branch and commit colors (warm, non-green tones)
	set(0, "LazyGitBranch", { fg = colors.interface, bold = true }) -- Blue-gray for branches
	set(0, "LazyGitLocalBranch", { fg = colors.brown }) -- Brown for local
	set(0, "LazyGitRemoteBranch", { fg = colors.pink }) -- Pink for remote
	set(0, "LazyGitCommit", { fg = colors.brown_dim }) -- Warm brown for commits
	set(0, "LazyGitTag", { fg = colors.bright }) -- White for tags

	-- UI elements (neutral focus highlight - no green)
	set(0, "LazyGitSelected", { fg = colors.bg, bg = colors.interface }) -- Dark text on blue-gray
	set(0, "LazyGitSelectedBold", { fg = colors.bg, bg = colors.interface, bold = true }) -- Bold for emphasis
	set(0, "LazyGitHeader", { fg = colors.interface, bold = true })
	set(0, "LazyGitKey", { fg = colors.brown }) -- Brown instead of green for keys
	set(0, "LazyGitOption", { fg = colors.brown_dim })

	-- Diff colors (warm, non-green focus)
	set(0, "LazyGitDiffAdd", { fg = colors.brown_dim }) -- Brown instead of green
	set(0, "LazyGitDiffDelete", { fg = colors.error }) -- Red for deletions
	set(0, "LazyGitDiffChange", { fg = colors.interface }) -- Blue-gray for changes
	set(0, "LazyGitDiffHeader", { fg = colors.white, bold = true })

	-- Additional status colors (no green)
	set(0, "LazyGitIgnored", { fg = colors.brown_dim })
	set(0, "LazyGitUpstream", { fg = colors.pink })
end

return M
