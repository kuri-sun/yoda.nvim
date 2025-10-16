local M = {}

local palettes = {
    dark = {
        -- Core colors
        bg = "#050705",
        fg = "#d4d4d4", -- Slightly darker white (was pale green)
        white = "#e5e5e5",
        accent = "#00e690",
        brown = "#d4a574",
        brown_dim = "#b8956a",
        interface = "#52b0e2", -- Better blue for types
        pink = "#e6a3d0",
        dim = "#5a7a5a",
        subtle = "#7a9a8a",
        bright = "#ffffff",
        number = "#80d6c3", -- Soft teal for numbers
        string = "#e6d7a3", -- Soft antique yellow for booleans
        string_green = "#b9f6ca", -- Light green for strings
        todo_purple = "#a78bfa", -- True soft purple for TODO comments
        error = "#ff6666",
        warning = "#ffee58",

        -- Background variations
        bg_dark = "#050705",
        bg_light = "#0a0d0a",
        bg_highlight = "#0f120f",
        border = "#2a3a2a",
        selection = "#0a2218",
        cursor_line = "#0a0d0a",
        line_number = "#2a3a2a",

        -- Git/Diff
        diff_add = "#0a2a0a",
        diff_delete = "#2a0a0a",
        diff_change = "#1a1a0a",
        diff_text = "#2a2a1a",

        -- Traditional color mappings
        red = "#ff6666",
        yellow = "#ffee58",
        gray = "#5a7a5a",
        dim_gray = "#6a6a6a", -- True gray for unused code
        green = "#00dd88",
        cyan = "#7dd3c0", -- Changed to match teal
        magenta = "#e6a3d0",
        orange = "#b8956a",
        blue = "#00dd88",
        fg_dark = "#7a9a8a",
        fg_light = "#e5e5e5",
    },
    light = {
        -- Core colors (lighter, clearer on white bg)
        bg = "#f3f5f4", -- Light neutral background
        fg = "#1a1d1f", -- Primary text
        white = "#0b0d0f", -- Strong emphasis text
        accent = "#3eb47e", -- update: Slightly brighter accent green
        brown = "#b88347", -- Functions / identifiers (lighter)
        brown_dim = "#d6a55a", -- Storage classes, secondary (lighter)
        interface = "#6eacf2", -- Types / classes (slightly brighter blue)
        pink = "#b0307a", -- Keywords / control (stronger)
        dim = "#56606b", -- Comments
        subtle = "#6b7280", -- Punctuation / operators
        bright = "#000000", -- Max emphasis
        number = "#57aeb6", -- Numbers (lighter teal)
        string = "#b89335", -- Booleans and similar (lighter amber)
        string_green = "#2e7d32", -- Strings (darker green for readability)
        todo_purple = "#b0a4f5", -- TODO/notes (lighter purple)
        error = "#e38a8a", -- Errors (lighter red)
        warning = "#f0b56d", -- Warnings (lighter orange)

        -- Background variations
        bg_dark = "#e6eae9", -- Panel bg
        bg_light = "#fbfdfc", -- Float/menus bg
        bg_highlight = "#dbe7e0", -- Selection/highlight bg
        border = "#b7bfc7", -- Subtle border (darker)
        selection = "#b9e3cf", -- Stronger green-tinted selection
        cursor_line = "#e7ecea", -- Current line
        line_number = "#8a929a", -- Gutter numbers

        -- Git/Diff
        diff_add = "#bfe9cf",
        diff_delete = "#f4c3c3",
        diff_change = "#ece7b6",
        diff_text = "#e1dc8a",

        -- Traditional color mappings
        red = "#e38a8a",
        yellow = "#f0c98a",
        gray = "#6b7280",
        dim_gray = "#8b9299", -- Unused code
        green = "#3bb07a",
        cyan = "#5fb4da",
        magenta = "#b0307a",
        orange = "#efbe71",
        blue = "#6aa8ef",
        fg_dark = "#3f454a",
        fg_light = "#0b0d0f",
    },
}

function M.setup(opts)
    local theme = opts and opts.theme or "dark"
    M.palette = palettes[theme] or palettes.dark
    M.semantics = M.get_semantics()
end

-- Initialize with dark theme
M.palette = palettes.dark

function M.get_semantics()
    return {
        error = M.palette.red,
        warning = M.palette.yellow,
        info = M.palette.cyan,
        hint = M.palette.blue,
        success = M.palette.green,
    }
end

M.semantics = M.get_semantics()

return M
