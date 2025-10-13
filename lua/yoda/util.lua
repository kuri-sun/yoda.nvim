local M = {}

-- Reload lualine theme
function M.reload_lualine()
    -- Check if lualine is loaded
    if package.loaded["lualine"] == nil then
        return
    end

    -- Force reload of the yoda lualine theme
    package.loaded["lualine.themes.yoda"] = nil

    -- Get current lualine config
    local lualine_opts = require("lualine").get_config()

    -- Only reload if using yoda theme
    if lualine_opts.options.theme == "yoda" then
        local lualine_theme = require("lualine.themes.yoda")
        lualine_opts.options.theme = lualine_theme
        require("lualine").setup(lualine_opts)
    end
end

return M
