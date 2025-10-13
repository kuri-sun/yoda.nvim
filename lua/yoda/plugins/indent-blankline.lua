local M = {}

function M.highlights(colors, set)
    -- Indent-blankline highlights
    set(0, "IblIndent", { fg = colors.bg_highlight })
    set(0, "IblScope", { fg = colors.border })
end

return M
