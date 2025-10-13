local M = {}

function M.highlights(colors, set)
    -- Telescope fuzzy finder highlights
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
end

return M
