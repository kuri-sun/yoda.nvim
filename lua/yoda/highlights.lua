local M = {}

function M.setup()
	local colors = require("yoda.colors").palette
	local set = vim.api.nvim_set_hl

	-- Reset colorscheme
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Editor
	set(0, "Normal", { fg = colors.fg, bg = colors.bg })
	set(0, "NormalNC", { fg = colors.fg, bg = colors.bg_dark })
	set(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_light })
	set(0, "FloatBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "FloatTitle", { fg = colors.bright, bg = colors.bg_light })

	set(0, "Cursor", { fg = colors.bg, bg = colors.accent })
	set(0, "CursorLine", { bg = "NONE" })
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

	-- Syntax
	set(0, "Comment", { fg = colors.dim, italic = true })
	set(0, "Constant", { fg = colors.interface })  -- Changed to pale blue for class-like names
	set(0, "String", { fg = colors.string_green })
	set(0, "Character", { fg = colors.string_green })
	set(0, "Number", { fg = colors.number })
	set(0, "Boolean", { fg = colors.string })
	set(0, "Float", { fg = colors.number })

	set(0, "Identifier", { fg = colors.fg })
	set(0, "Function", { fg = colors.brown })

	set(0, "Statement", { fg = colors.accent })
	set(0, "Conditional", { fg = colors.accent })
	set(0, "Repeat", { fg = colors.accent })
	set(0, "Label", { fg = colors.fg })
	set(0, "Operator", { fg = colors.subtle })
	set(0, "Keyword", { fg = colors.accent })
	set(0, "Exception", { fg = colors.pink })

	set(0, "PreProc", { fg = colors.subtle })
	set(0, "Include", { fg = colors.accent })
	set(0, "Define", { fg = colors.subtle })
	set(0, "Macro", { fg = colors.subtle })
	set(0, "PreCondit", { fg = colors.subtle })

	set(0, "Type", { fg = colors.interface })
	set(0, "StorageClass", { fg = colors.brown_dim })
	set(0, "Structure", { fg = colors.interface })
	set(0, "Typedef", { fg = colors.interface })

	set(0, "Special", { fg = colors.orange })
	set(0, "SpecialChar", { fg = colors.accent })
	set(0, "Tag", { fg = colors.fg })
	set(0, "Delimiter", { fg = colors.subtle })
	set(0, "SpecialComment", { fg = colors.dim, italic = true })
	set(0, "Debug", { fg = colors.red })

	set(0, "Underlined", { underline = true })
	set(0, "Ignore", { fg = colors.dim })
	set(0, "Error", { fg = colors.error })
	set(0, "Todo", { fg = colors.todo_purple, bold = true })

	-- Treesitter
	set(0, "@variable", { fg = colors.fg })
	set(0, "@variable.builtin", { fg = colors.bright })
	set(0, "@variable.parameter", { fg = colors.fg, italic = true })
	set(0, "@variable.member", { fg = colors.fg })

	set(0, "@constant", { fg = colors.interface })  -- Changed to pale blue for class-like names
	set(0, "@constant.builtin", { fg = colors.bright })
	set(0, "@constant.macro", { fg = colors.orange })

	set(0, "@module", { fg = colors.fg })
	set(0, "@module.builtin", { fg = colors.bright })
	set(0, "@label", { fg = colors.fg })

	set(0, "@string", { fg = colors.string_green })
	set(0, "@string.documentation", { fg = colors.dim, italic = true })
	set(0, "@string.regexp", { fg = colors.accent })
	set(0, "@string.escape", { fg = colors.accent })
	set(0, "@string.special", { fg = colors.accent })
	set(0, "@string.special.symbol", { fg = colors.cyan })
	set(0, "@string.special.path", { fg = colors.string_green })
	set(0, "@string.special.url", { fg = colors.string_green, underline = true })

	set(0, "@character", { fg = colors.string_green })
	set(0, "@character.special", { fg = colors.accent })

	set(0, "@boolean", { fg = colors.string })
	set(0, "@number", { fg = colors.number })
	set(0, "@number.float", { fg = colors.number })

	set(0, "@type", { fg = colors.interface })
	set(0, "@type.builtin", { fg = colors.interface })  -- Changed to interface color
	set(0, "@type.definition", { fg = colors.interface })

	set(0, "@attribute", { fg = colors.orange })
	set(0, "@attribute.builtin", { fg = colors.orange })
	set(0, "@property", { fg = colors.fg })

	set(0, "@function", { fg = colors.brown })
	set(0, "@function.builtin", { fg = colors.bright })
	set(0, "@function.call", { fg = colors.brown })
	set(0, "@function.macro", { fg = colors.subtle })
	set(0, "@function.method", { fg = colors.brown })
	set(0, "@function.method.call", { fg = colors.brown })

	set(0, "@constructor", { fg = colors.interface })
	set(0, "@operator", { fg = colors.subtle })
	
	-- Additional type-like highlighting
	set(0, "@type.qualifier", { fg = colors.interface })
	set(0, "@namespace", { fg = colors.interface })
	set(0, "@variable.global", { fg = colors.interface })  -- Global variables often classes
	
	-- TypeScript/JavaScript specific type annotations
	set(0, "@type.javascript", { fg = colors.interface })
	set(0, "@type.typescript", { fg = colors.interface })
	set(0, "@type.annotation", { fg = colors.interface })
	set(0, "@variable.builtin.typescript", { fg = colors.interface })
	set(0, "@variable.builtin.javascript", { fg = colors.interface })
	
	-- Make constants that look like types appear as types (PascalCase variables)
	set(0, "@constant.lua", { fg = colors.interface })
	set(0, "@variable.lua", { link = "@variable" })  -- Regular variables stay normal

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
	set(0, "@comment.todo", { fg = colors.todo_purple, bold = true })
	set(0, "@comment.note", { fg = colors.fg, italic = true })
	
	-- Additional TODO comment patterns
	set(0, "@text.todo", { fg = colors.todo_purple, bold = true })
	set(0, "@keyword.todo", { fg = colors.todo_purple, bold = true })
	set(0, "TodoComment", { fg = colors.todo_purple, bold = true })
	set(0, "CommentTodo", { fg = colors.todo_purple, bold = true })

	set(0, "@tag", { fg = colors.fg })
	set(0, "@tag.attribute", { fg = colors.subtle })
	set(0, "@tag.delimiter", { fg = colors.subtle })

	set(0, "@diff.plus", { fg = colors.accent })
	set(0, "@diff.minus", { fg = colors.error })
	set(0, "@diff.delta", { fg = colors.warning })
	

	-- LSP
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

	-- Unused/unnecessary code highlighting
	set(0, "DiagnosticUnnecessary", { fg = colors.dim_gray, italic = true })
	set(0, "DiagnosticDeprecated", { fg = colors.dim_gray, strikethrough = true })
	set(0, "DiagnosticUnderlineUnnecessary", { undercurl = true, sp = colors.dim_gray })
	set(0, "DiagnosticUnderlineDeprecated", { undercurl = true, sp = colors.dim_gray })
	set(0, "DiagnosticVirtualTextUnnecessary", { fg = colors.dim_gray, bg = colors.bg_highlight })
	set(0, "DiagnosticVirtualTextDeprecated", { fg = colors.dim_gray, bg = colors.bg_highlight })

	set(0, "LspReferenceText", { bg = colors.bg_highlight })
	set(0, "LspReferenceRead", { bg = colors.bg_highlight })
	set(0, "LspReferenceWrite", { bg = colors.bg_highlight })

	set(0, "LspCodeLens", { fg = colors.dim })
	set(0, "LspCodeLensSeparator", { fg = colors.dim })
	set(0, "LspSignatureActiveParameter", { fg = colors.accent })

	-- Diff
	set(0, "DiffAdd", { bg = colors.diff_add })
	set(0, "DiffChange", { bg = colors.diff_change })
	set(0, "DiffDelete", { bg = colors.diff_delete })
	set(0, "DiffText", { bg = colors.diff_text })

	-- Load plugin-specific highlights
	require("yoda.plugins").setup(colors, set)
	
	-- Force TODO highlighting (must be last to override plugins)
	vim.defer_fn(function()
		set(0, "Todo", { fg = colors.todo_purple, bold = true })
		set(0, "@comment.todo", { fg = colors.todo_purple, bold = true })
		set(0, "@text.todo", { fg = colors.todo_purple, bold = true })
		-- Force any potential plugin overrides
		set(0, "TodoBgTODO", { fg = colors.todo_purple, bold = true })
		set(0, "TodoFgTODO", { fg = colors.todo_purple, bold = true })
		set(0, "TodoSignTODO", { fg = colors.todo_purple, bold = true })
	end, 200)
end

return M
