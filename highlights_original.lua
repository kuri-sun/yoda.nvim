local M = {}

function M.setup()
  local colors = require("yoda.colors").palette
  local set = vim.api.nvim_set_hl
  
  -- Reset colorscheme
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Editor highlights
  set(0, "Normal", { fg = colors.fg, bg = colors.bg })
  set(0, "NormalNC", { fg = colors.fg, bg = colors.bg_dark })
  set(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_light })
  set(0, "FloatBorder", { fg = colors.border, bg = colors.bg_light })
  set(0, "FloatTitle", { fg = colors.accent, bg = colors.bg_light, bold = true })
  
  set(0, "Cursor", { fg = colors.bg, bg = colors.accent })
  set(0, "CursorLine", { bg = colors.cursor_line })
  set(0, "CursorLineNr", { fg = colors.accent, bold = true })
  set(0, "LineNr", { fg = colors.line_number })
  
  set(0, "Visual", { bg = colors.selection })
  set(0, "VisualNOS", { bg = colors.selection })
  set(0, "Search", { fg = colors.bg, bg = colors.yellow })
  set(0, "IncSearch", { fg = colors.bg, bg = colors.accent })
  set(0, "CurSearch", { fg = colors.bg, bg = colors.orange })
  
  set(0, "StatusLine", { fg = colors.fg, bg = colors.bg_light })
  set(0, "StatusLineNC", { fg = colors.fg_dark, bg = colors.bg_dark })
  set(0, "WinBar", { fg = colors.fg, bg = colors.bg })
  set(0, "WinBarNC", { fg = colors.fg_dark, bg = colors.bg })
  
  set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_light })
  set(0, "PmenuSel", { fg = colors.bg, bg = colors.accent })
  set(0, "PmenuSbar", { bg = colors.bg_highlight })
  set(0, "PmenuThumb", { bg = colors.gray })
  
  set(0, "TabLine", { fg = colors.fg_dark, bg = colors.bg_light })
  set(0, "TabLineFill", { bg = colors.bg_dark })
  set(0, "TabLineSel", { fg = colors.accent, bg = colors.bg, bold = true })
  
  set(0, "MatchParen", { fg = colors.accent, bold = true, underline = true })
  set(0, "ColorColumn", { bg = colors.bg_highlight })
  set(0, "SignColumn", { fg = colors.gray, bg = colors.bg })
  set(0, "FoldColumn", { fg = colors.gray, bg = colors.bg })
  set(0, "Folded", { fg = colors.gray, bg = colors.bg_light })
  
  set(0, "WildMenu", { fg = colors.bg, bg = colors.accent })
  set(0, "Directory", { fg = colors.blue, bold = true })
  set(0, "Question", { fg = colors.cyan })
  set(0, "MoreMsg", { fg = colors.cyan })
  set(0, "ModeMsg", { fg = colors.cyan, bold = true })
  
  set(0, "ErrorMsg", { fg = colors.red, bold = true })
  set(0, "WarningMsg", { fg = colors.yellow, bold = true })
  
  set(0, "NonText", { fg = colors.gray })
  set(0, "SpecialKey", { fg = colors.gray })
  set(0, "Whitespace", { fg = colors.gray })
  set(0, "EndOfBuffer", { fg = colors.bg })
  
  set(0, "VertSplit", { fg = colors.border })
  set(0, "WinSeparator", { fg = colors.border })
  
  -- Syntax highlights
  set(0, "Comment", { fg = colors.gray, italic = true })
  set(0, "Constant", { fg = colors.orange })
  set(0, "String", { fg = colors.accent })
  set(0, "Character", { fg = colors.accent })
  set(0, "Number", { fg = colors.orange })
  set(0, "Boolean", { fg = colors.orange, bold = true })
  set(0, "Float", { fg = colors.orange })
  
  set(0, "Identifier", { fg = colors.fg })
  set(0, "Function", { fg = colors.yellow })
  
  set(0, "Statement", { fg = colors.blue, bold = true })
  set(0, "Conditional", { fg = colors.blue, bold = true })
  set(0, "Repeat", { fg = colors.blue, bold = true })
  set(0, "Label", { fg = colors.blue })
  set(0, "Operator", { fg = colors.cyan })
  set(0, "Keyword", { fg = colors.blue, bold = true })
  set(0, "Exception", { fg = colors.red, bold = true })
  
  set(0, "PreProc", { fg = colors.magenta })
  set(0, "Include", { fg = colors.magenta })
  set(0, "Define", { fg = colors.magenta })
  set(0, "Macro", { fg = colors.magenta })
  set(0, "PreCondit", { fg = colors.magenta })
  
  set(0, "Type", { fg = colors.cyan })
  set(0, "StorageClass", { fg = colors.cyan })
  set(0, "Structure", { fg = colors.cyan })
  set(0, "Typedef", { fg = colors.cyan })
  
  set(0, "Special", { fg = colors.orange })
  set(0, "SpecialChar", { fg = colors.orange })
  set(0, "Tag", { fg = colors.blue })
  set(0, "Delimiter", { fg = colors.fg_dark })
  set(0, "SpecialComment", { fg = colors.gray, italic = true })
  set(0, "Debug", { fg = colors.red })
  
  set(0, "Underlined", { underline = true })
  set(0, "Ignore", { fg = colors.gray })
  set(0, "Error", { fg = colors.red, bold = true })
  set(0, "Todo", { fg = colors.yellow, bg = colors.bg_highlight, bold = true })
  
  -- Treesitter highlights
  set(0, "@variable", { fg = colors.fg })
  set(0, "@variable.builtin", { fg = colors.orange })
  set(0, "@variable.parameter", { fg = colors.fg_light })
  set(0, "@variable.member", { fg = colors.fg_light })
  
  set(0, "@constant", { fg = colors.orange })
  set(0, "@constant.builtin", { fg = colors.orange, bold = true })
  set(0, "@constant.macro", { fg = colors.magenta })
  
  set(0, "@module", { fg = colors.cyan })
  set(0, "@module.builtin", { fg = colors.cyan, bold = true })
  set(0, "@label", { fg = colors.blue })
  
  set(0, "@string", { fg = colors.accent })
  set(0, "@string.documentation", { fg = colors.gray, italic = true })
  set(0, "@string.regexp", { fg = colors.orange })
  set(0, "@string.escape", { fg = colors.orange, bold = true })
  set(0, "@string.special", { fg = colors.orange })
  set(0, "@string.special.symbol", { fg = colors.fg })
  set(0, "@string.special.path", { fg = colors.cyan })
  set(0, "@string.special.url", { fg = colors.cyan, underline = true })
  
  set(0, "@character", { fg = colors.accent })
  set(0, "@character.special", { fg = colors.orange })
  
  set(0, "@boolean", { fg = colors.orange, bold = true })
  set(0, "@number", { fg = colors.orange })
  set(0, "@number.float", { fg = colors.orange })
  
  set(0, "@type", { fg = colors.cyan })
  set(0, "@type.builtin", { fg = colors.cyan, bold = true })
  set(0, "@type.definition", { fg = colors.cyan })
  
  set(0, "@attribute", { fg = colors.magenta })
  set(0, "@attribute.builtin", { fg = colors.magenta, bold = true })
  set(0, "@property", { fg = colors.fg_light })
  
  set(0, "@function", { fg = colors.yellow })
  set(0, "@function.builtin", { fg = colors.yellow, bold = true })
  set(0, "@function.call", { fg = colors.yellow })
  set(0, "@function.macro", { fg = colors.magenta })
  set(0, "@function.method", { fg = colors.yellow })
  set(0, "@function.method.call", { fg = colors.yellow })
  
  set(0, "@constructor", { fg = colors.cyan })
  set(0, "@operator", { fg = colors.cyan })
  
  set(0, "@keyword", { fg = colors.blue, bold = true })
  set(0, "@keyword.coroutine", { fg = colors.blue, bold = true })
  set(0, "@keyword.function", { fg = colors.blue, bold = true })
  set(0, "@keyword.operator", { fg = colors.cyan })
  set(0, "@keyword.import", { fg = colors.magenta })
  set(0, "@keyword.type", { fg = colors.cyan })
  set(0, "@keyword.modifier", { fg = colors.blue })
  set(0, "@keyword.repeat", { fg = colors.blue, bold = true })
  set(0, "@keyword.return", { fg = colors.blue, bold = true })
  set(0, "@keyword.debug", { fg = colors.red })
  set(0, "@keyword.exception", { fg = colors.red, bold = true })
  set(0, "@keyword.conditional", { fg = colors.blue, bold = true })
  
  set(0, "@conditional", { fg = colors.blue, bold = true })
  set(0, "@repeat", { fg = colors.blue, bold = true })
  set(0, "@debug", { fg = colors.red })
  set(0, "@exception", { fg = colors.red, bold = true })
  
  set(0, "@include", { fg = colors.magenta })
  set(0, "@preproc", { fg = colors.magenta })
  set(0, "@define", { fg = colors.magenta })
  set(0, "@macro", { fg = colors.magenta })
  
  set(0, "@punctuation", { fg = colors.fg_dark })
  set(0, "@punctuation.delimiter", { fg = colors.fg_dark })
  set(0, "@punctuation.bracket", { fg = colors.fg_dark })
  set(0, "@punctuation.special", { fg = colors.orange })
  
  set(0, "@comment", { fg = colors.gray, italic = true })
  set(0, "@comment.documentation", { fg = colors.gray, italic = true })
  set(0, "@comment.error", { fg = colors.red, italic = true })
  set(0, "@comment.warning", { fg = colors.yellow, italic = true })
  set(0, "@comment.todo", { fg = colors.yellow, bg = colors.bg_highlight, bold = true })
  set(0, "@comment.note", { fg = colors.cyan, italic = true })
  
  set(0, "@tag", { fg = colors.blue })
  set(0, "@tag.attribute", { fg = colors.cyan })
  set(0, "@tag.delimiter", { fg = colors.fg_dark })
  
  set(0, "@diff.plus", { fg = colors.green })
  set(0, "@diff.minus", { fg = colors.red })
  set(0, "@diff.delta", { fg = colors.yellow })
  
  -- LSP highlights
  set(0, "DiagnosticError", { fg = colors.red })
  set(0, "DiagnosticWarn", { fg = colors.yellow })
  set(0, "DiagnosticInfo", { fg = colors.cyan })
  set(0, "DiagnosticHint", { fg = colors.blue })
  set(0, "DiagnosticOk", { fg = colors.green })
  
  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
  set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
  set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.blue })
  set(0, "DiagnosticUnderlineOk", { undercurl = true, sp = colors.green })
  
  set(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg_highlight })
  set(0, "DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.bg_highlight })
  set(0, "DiagnosticVirtualTextInfo", { fg = colors.cyan, bg = colors.bg_highlight })
  set(0, "DiagnosticVirtualTextHint", { fg = colors.blue, bg = colors.bg_highlight })
  set(0, "DiagnosticVirtualTextOk", { fg = colors.green, bg = colors.bg_highlight })
  
  set(0, "DiagnosticSignError", { fg = colors.red })
  set(0, "DiagnosticSignWarn", { fg = colors.yellow })
  set(0, "DiagnosticSignInfo", { fg = colors.cyan })
  set(0, "DiagnosticSignHint", { fg = colors.blue })
  set(0, "DiagnosticSignOk", { fg = colors.green })
  
  set(0, "LspReferenceText", { bg = colors.bg_highlight })
  set(0, "LspReferenceRead", { bg = colors.bg_highlight })
  set(0, "LspReferenceWrite", { bg = colors.bg_highlight })
  
  set(0, "LspCodeLens", { fg = colors.gray })
  set(0, "LspCodeLensSeparator", { fg = colors.gray })
  set(0, "LspSignatureActiveParameter", { fg = colors.accent, bold = true })
  
  -- Git highlights
  set(0, "GitSignsAdd", { fg = colors.green })
  set(0, "GitSignsChange", { fg = colors.yellow })
  set(0, "GitSignsDelete", { fg = colors.red })
  set(0, "GitSignsAddNr", { fg = colors.green })
  set(0, "GitSignsChangeNr", { fg = colors.yellow })
  set(0, "GitSignsDeleteNr", { fg = colors.red })
  set(0, "GitSignsAddLn", { bg = colors.diff_add })
  set(0, "GitSignsChangeLn", { bg = colors.diff_change })
  set(0, "GitSignsDeleteLn", { bg = colors.diff_delete })
  
  set(0, "DiffAdd", { bg = colors.diff_add })
  set(0, "DiffChange", { bg = colors.diff_change })
  set(0, "DiffDelete", { bg = colors.diff_delete })
  set(0, "DiffText", { bg = colors.diff_text })
  
  -- Telescope highlights
  set(0, "TelescopeNormal", { fg = colors.fg, bg = colors.bg })
  set(0, "TelescopeBorder", { fg = colors.border })
  set(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_light })
  set(0, "TelescopePromptBorder", { fg = colors.accent })
  set(0, "TelescopePromptTitle", { fg = colors.accent, bold = true })
  set(0, "TelescopePreviewTitle", { fg = colors.blue, bold = true })
  set(0, "TelescopeResultsTitle", { fg = colors.cyan, bold = true })
  set(0, "TelescopeSelection", { fg = colors.bg, bg = colors.accent })
  set(0, "TelescopeSelectionCaret", { fg = colors.accent })
  set(0, "TelescopeMatching", { fg = colors.yellow, bold = true })
  
  -- Nvim-tree highlights
  set(0, "NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  set(0, "NvimTreeRootFolder", { fg = colors.accent, bold = true })
  set(0, "NvimTreeFolderIcon", { fg = colors.blue })
  set(0, "NvimTreeFolderName", { fg = colors.blue })
  set(0, "NvimTreeOpenedFolderName", { fg = colors.blue, bold = true })
  set(0, "NvimTreeEmptyFolderName", { fg = colors.gray })
  set(0, "NvimTreeExecFile", { fg = colors.green, bold = true })
  set(0, "NvimTreeSpecialFile", { fg = colors.yellow, underline = true })
  set(0, "NvimTreeImageFile", { fg = colors.magenta })
  set(0, "NvimTreeGitDirty", { fg = colors.yellow })
  set(0, "NvimTreeGitStaged", { fg = colors.green })
  set(0, "NvimTreeGitMerge", { fg = colors.orange })
  set(0, "NvimTreeGitNew", { fg = colors.green })
  set(0, "NvimTreeGitDeleted", { fg = colors.red })
  
  -- CMP highlights
  set(0, "CmpItemAbbr", { fg = colors.fg })
  set(0, "CmpItemAbbrDeprecated", { fg = colors.gray, strikethrough = true })
  set(0, "CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
  set(0, "CmpItemAbbrMatchFuzzy", { fg = colors.yellow })
  set(0, "CmpItemKind", { fg = colors.blue })
  set(0, "CmpItemMenu", { fg = colors.gray })
  set(0, "CmpItemKindText", { fg = colors.fg })
  set(0, "CmpItemKindMethod", { fg = colors.yellow })
  set(0, "CmpItemKindFunction", { fg = colors.yellow })
  set(0, "CmpItemKindConstructor", { fg = colors.cyan })
  set(0, "CmpItemKindField", { fg = colors.fg_light })
  set(0, "CmpItemKindVariable", { fg = colors.fg })
  set(0, "CmpItemKindClass", { fg = colors.cyan })
  set(0, "CmpItemKindInterface", { fg = colors.cyan })
  set(0, "CmpItemKindModule", { fg = colors.cyan })
  set(0, "CmpItemKindProperty", { fg = colors.fg_light })
  set(0, "CmpItemKindUnit", { fg = colors.orange })
  set(0, "CmpItemKindValue", { fg = colors.orange })
  set(0, "CmpItemKindEnum", { fg = colors.cyan })
  set(0, "CmpItemKindKeyword", { fg = colors.blue })
  set(0, "CmpItemKindSnippet", { fg = colors.accent })
  set(0, "CmpItemKindColor", { fg = colors.magenta })
  set(0, "CmpItemKindFile", { fg = colors.fg })
  set(0, "CmpItemKindReference", { fg = colors.fg })
  set(0, "CmpItemKindFolder", { fg = colors.blue })
  set(0, "CmpItemKindEnumMember", { fg = colors.cyan })
  set(0, "CmpItemKindConstant", { fg = colors.orange })
  set(0, "CmpItemKindStruct", { fg = colors.cyan })
  set(0, "CmpItemKindEvent", { fg = colors.yellow })
  set(0, "CmpItemKindOperator", { fg = colors.cyan })
  set(0, "CmpItemKindTypeParameter", { fg = colors.cyan })
  
  -- Indent Blankline
  set(0, "IblIndent", { fg = colors.bg_highlight })
  set(0, "IblScope", { fg = colors.gray })
  
  -- Snacks.nvim highlights
  set(0, "SnacksNormal", { fg = colors.fg, bg = colors.bg })
  set(0, "SnacksBorder", { fg = colors.border })
  set(0, "SnacksTitle", { fg = colors.accent, bold = true })
  set(0, "SnacksFooter", { fg = colors.gray })
  set(0, "SnacksKey", { fg = colors.yellow })
  set(0, "SnacksValue", { fg = colors.fg })
  set(0, "SnacksDesc", { fg = colors.gray })
  set(0, "SnacksGroup", { fg = colors.blue, bold = true })
  
  -- Dashboard highlights
  set(0, "DashboardHeader", { fg = colors.accent })
  set(0, "DashboardCenter", { fg = colors.blue })
  set(0, "DashboardFooter", { fg = colors.gray })
  set(0, "DashboardKey", { fg = colors.yellow })
  set(0, "DashboardDesc", { fg = colors.fg })
  set(0, "DashboardIcon", { fg = colors.blue })
  
  -- Which-key highlights
  set(0, "WhichKey", { fg = colors.yellow })
  set(0, "WhichKeyGroup", { fg = colors.blue })
  set(0, "WhichKeyDesc", { fg = colors.fg })
  set(0, "WhichKeySeparator", { fg = colors.gray })
  set(0, "WhichKeyFloat", { bg = colors.bg_light })
  set(0, "WhichKeyValue", { fg = colors.cyan })
end

return M