local M = {}

function M.highlights(colors, set)
	-- CMP (completion) highlights
	set(0, "CmpItemAbbr", { fg = colors.fg })
	set(0, "CmpItemAbbrDeprecated", { fg = colors.dim, strikethrough = true })
	set(0, "CmpItemAbbrMatch", { fg = colors.accent })
	set(0, "CmpItemAbbrMatchFuzzy", { fg = colors.accent })
	set(0, "CmpItemKind", { fg = colors.subtle })
	set(0, "CmpItemMenu", { fg = colors.dim })

	-- Kind-specific highlights
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
end

return M