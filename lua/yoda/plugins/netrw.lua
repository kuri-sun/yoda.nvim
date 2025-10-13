local M = {}

function M.highlights(colors, set)
    -- Native vim file explorer (netrw) highlights
    set(0, "netrwDir", { fg = colors.string_green }) -- Directory names with green
    set(0, "netrwClassify", { fg = colors.white }) -- Directory "/" suffix in white
    set(0, "netrwLink", { fg = colors.cyan }) -- Symlinks
    set(0, "netrwExe", { fg = colors.accent }) -- Executables
    set(0, "netrwPlain", { fg = colors.fg }) -- Regular files

    -- Multiple possible names for current selection in netrw
    set(0, "netrwCursorline", { fg = colors.string_green, underline = true })
    set(0, "netrwCursor", { fg = colors.string_green, underline = true })
    set(0, "netrwSelected", { fg = colors.string_green, underline = true })
    set(0, "netrwMarkFile", { fg = colors.string_green, underline = true })
end

return M
