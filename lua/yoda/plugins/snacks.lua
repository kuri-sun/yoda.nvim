local M = {}

function M.highlights(colors, set)
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
end

return M
