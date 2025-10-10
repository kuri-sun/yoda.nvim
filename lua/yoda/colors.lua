local M = {}

local palettes = {
    dark = {
        -- Core colors
        bg = "#050705",
        fg = "#d4d4d4", -- Slightly darker white (was pale green)
        white = "#e5e5e5",
        accent = "#00dd88",
        brown = "#d4a574",
        brown_dim = "#b8956a",
        interface = "#4fa8d8", -- Better blue for types
        pink = "#e6a3d0",
        dim = "#5a7a5a",
        subtle = "#7a9a8a",
        bright = "#ffffff",
        number = "#7dd3c0", -- Soft teal for numbers
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
        -- Core colors
        bg = "#d8ddd8", -- Main background (middle gradient)
        fg = "#2d5016", -- Dark green for main text
        white = "#1a1a1a", -- Dark for strings
        accent = "#00aa44", -- Bright green accent
        brown = "#d17b00", -- Bright orange-brown for functions
        brown_dim = "#b8860b", -- Goldenrod
        interface = "#4682b4", -- Steel blue for types
        pink = "#d1447e", -- Bright pink for keywords
        dim = "#7a997a", -- Light green for comments
        subtle = "#5a7a5a", -- Medium green for punctuation
        bright = "#000000", -- Pure black for emphasis
        number = "#2c7a7b", -- Darker teal for light theme numbers
        string = "#8b7355", -- Darker antique yellow for light theme
        todo_purple = "#7c3aed", -- Darker true purple for light theme TODO comments
        error = "#dc143c", -- Bright crimson
        warning = "#ff8c00", -- Bright orange

        -- Background variations (gradient effect)
        bg_dark = "#c0c8c0", -- Darker gradient step
        bg_light = "#e0e8e0", -- Lighter gradient step
        bg_highlight = "#b8d0b8", -- Subtle green highlight
        border = "#a0c0a0", -- Medium green border
        selection = "#a8d8a8", -- Light green selection
        cursor_line = "#d4d9d4", -- Subtle gradient
        line_number = "#88a888", -- Muted green

        -- Git/Diff
        diff_add = "#d0f0d0", -- Light green
        diff_delete = "#f0d0d0", -- Light red
        diff_change = "#f0f0c0", -- Light yellow
        diff_text = "#e0e0a0", -- Slightly darker yellow

        -- Traditional color mappings
        red = "#dc143c",
        yellow = "#ff8c00",
        gray = "#7a997a",
        dim_gray = "#888888", -- True gray for unused code in light theme
        green = "#00aa44",
        cyan = "#2d5016",
        magenta = "#d1447e",
        orange = "#d17b00",
        blue = "#4682b4",
        fg_dark = "#5a7a5a",
        fg_light = "#1a1a1a",
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
