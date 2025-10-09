local M = {}

function M.highlights(colors, set)
	-- Noice UI components
	set(0, "NoiceCmdline", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NoiceCmdlineIcon", { fg = colors.accent, bg = colors.bg_light })
	set(0, "NoiceCmdlineIconSearch", { fg = colors.warning, bg = colors.bg_light })
	set(0, "NoiceCmdlinePopup", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NoiceCmdlinePopupBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "NoiceCmdlinePopupTitle", { fg = colors.accent, bg = colors.bg_light })
	set(0, "NoiceCmdlinePrompt", { fg = colors.accent, bg = colors.bg_light })

	-- Completion
	set(0, "NoiceCompletionItemKindDefault", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindKeyword", { fg = colors.pink })
	set(0, "NoiceCompletionItemKindVariable", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindConstant", { fg = colors.number })
	set(0, "NoiceCompletionItemKindReference", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindFunction", { fg = colors.brown })
	set(0, "NoiceCompletionItemKindMethod", { fg = colors.brown })
	set(0, "NoiceCompletionItemKindConstructor", { fg = colors.brown })
	set(0, "NoiceCompletionItemKindClass", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindInterface", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindStruct", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindEvent", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindEnum", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindUnit", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindModule", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindProperty", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindField", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindTypeParameter", { fg = colors.interface })
	set(0, "NoiceCompletionItemKindEnumMember", { fg = colors.fg })
	set(0, "NoiceCompletionItemKindOperator", { fg = colors.subtle })
	set(0, "NoiceCompletionItemKindSnippet", { fg = colors.accent })

	-- Confirm and popups
	set(0, "NoiceConfirm", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NoiceConfirmBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "NoicePopup", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NoicePopupBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "NoicePopupmenu", { fg = colors.fg, bg = colors.bg_light })
	set(0, "NoicePopupmenuBorder", { fg = colors.border, bg = colors.bg_light })
	set(0, "NoicePopupmenuMatch", { fg = colors.accent, bold = true })
	set(0, "NoicePopupmenuSelected", { fg = colors.fg, bg = colors.selection })

	-- Scrollbar
	set(0, "NoiceScrollbar", { fg = colors.bg_highlight, bg = colors.bg_light })
	set(0, "NoiceScrollbarThumb", { fg = colors.dim, bg = colors.bg_light })

	-- Split
	set(0, "NoiceSplit", { fg = colors.fg, bg = colors.bg })
	set(0, "NoiceSplitBorder", { fg = colors.border, bg = colors.bg })

	-- Virtual text
	set(0, "NoiceVirtualText", { fg = colors.dim })

	-- Format groups
	set(0, "NoiceFormatProgressDone", { fg = colors.accent })
	set(0, "NoiceFormatProgressTodo", { fg = colors.dim })
	set(0, "NoiceFormatEvent", { fg = colors.dim })
	set(0, "NoiceFormatKind", { fg = colors.fg })
	set(0, "NoiceFormatDate", { fg = colors.dim })
	set(0, "NoiceFormatConfirm", { bg = colors.bg_light })
	set(0, "NoiceFormatTitle", { fg = colors.accent, bold = true })

	-- LSP-related
	set(0, "NoiceLspProgressClient", { fg = colors.interface })
	set(0, "NoiceLspProgressSpinner", { fg = colors.accent })
	set(0, "NoiceLspProgressTitle", { fg = colors.fg })

	-- Mini
	set(0, "NoiceMini", { fg = colors.dim, bg = colors.bg })
end

return M