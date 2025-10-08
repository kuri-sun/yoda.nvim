local M = {}

-- Default lualine configuration with yoda theme and vim icon
M.config = {
    options = {
        theme = "yoda",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                "mode",
                icon = "",
                fmt = function(mode)
                    return mode:upper()
                end,
            },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "neo-tree", "lazy" },
}

-- Setup function to configure lualine with yoda defaults
function M.setup(opts)
    local config = vim.tbl_deep_extend("force", M.config, opts or {})
    require("lualine").setup(config)
end

return M
