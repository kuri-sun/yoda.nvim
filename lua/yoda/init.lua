local M = {}

M.config = {
    theme = "dark",
    italic_comments = true,
    transparent_background = false,
    bold_keywords = true,
    underline_match_paren = true,
    colors = {},
    highlights = {},

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
        neo_tree = true,
        nvim_tree = true,
        cmp = true,
        gitsigns = true,
        snacks = true,
        netrw = true,
        todo_comments = true,
        indent_blankline = true,
        dashboard = true,
        which_key = true,
        misc = true,
        mini = true,
    },
}

-- Setup function to configure the theme
function M.setup(opts)
    -- Merge user options with defaults
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})

    -- Load the colorscheme
    M.load()
end

-- Load the colorscheme
function M.load()
    -- Set termguicolors for true color support
    vim.o.termguicolors = true

    -- Setup colors with theme
    require("yoda.colors").setup(M.config)

    -- Apply highlights
    require("yoda.highlights").setup()

    -- Set the colorscheme name (this must come after applying highlights)
    vim.g.colors_name = "yoda"

    -- Apply configuration-based overrides
    local set = vim.api.nvim_set_hl
    local colors = require("yoda.colors").palette

    -- Apply transparent background if requested
    if M.config.transparent_background then
        set(0, "Normal", { fg = colors.fg, bg = "NONE" })
        set(0, "NormalFloat", { fg = colors.fg, bg = "NONE" })
        set(0, "NormalNC", { fg = colors.fg, bg = "NONE" })
        set(0, "SignColumn", { fg = colors.fg, bg = "NONE" })
        set(0, "EndOfBuffer", { fg = colors.bg_light, bg = "NONE" })
    end

    -- Apply custom color overrides
    if M.config.colors and type(M.config.colors) == "table" then
        for key, value in pairs(M.config.colors) do
            colors[key] = value
        end
    end

    -- Handle italic comments
    if not M.config.italic_comments then
        set(0, "Comment", { fg = colors.dim, italic = false })
        set(0, "@comment", { fg = colors.dim, italic = false })
        set(0, "@comment.documentation", { fg = colors.dim, italic = false })
    end

    -- Handle bold keywords
    if not M.config.bold_keywords then
        set(0, "Keyword", { fg = colors.pink, bold = false })
        set(0, "@keyword", { fg = colors.pink, bold = false })
        set(0, "Statement", { fg = colors.pink, bold = false })
        set(0, "Conditional", { fg = colors.pink, bold = false })
    end

    -- Handle underline match paren
    if not M.config.underline_match_paren then
        set(0, "MatchParen", { fg = colors.accent, underline = false })
    end

    -- Apply custom highlight overrides
    if M.config.highlights and type(M.config.highlights) == "function" then
        M.config.highlights(colors, set)
    elseif M.config.highlights and type(M.config.highlights) == "table" then
        for group, opts in pairs(M.config.highlights) do
            set(0, group, opts)
        end
    end

    -- Reload lualine if it's loaded
    require("yoda.util").reload_lualine()

    -- Set terminal colors
    vim.g.terminal_color_0 = colors.bg_dark
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_8 = colors.gray
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.fg_light
end

-- Provide a convenient reload function for development
function M.reload()
    -- Clear the module cache
    package.loaded["yoda"] = nil
    package.loaded["yoda.colors"] = nil
    package.loaded["yoda.highlights"] = nil

    -- Reload and setup
    require("yoda").load()
end

function M.set_theme(theme)
    M.config.theme = theme
    M.load()
end

function M.toggle_theme()
    M.config.theme = M.config.theme == "dark" and "light" or "dark"
    M.load()
end

-- Lualine helper
M.lualine = require("yoda.lualine")

-- Auto-command to reload theme on save during development
function M.enable_dev_mode()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "**/lua/yoda/*.lua",
        callback = function()
            M.reload()
            vim.notify("Yoda theme reloaded", vim.log.levels.INFO)
        end,
        group = vim.api.nvim_create_augroup("YodaThemeDev", { clear = true }),
    })
end

return M
