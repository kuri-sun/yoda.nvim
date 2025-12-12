local config = require("yoda").config
require("yoda.colors").setup(config)
local colors = require("yoda.colors").palette

local bg = colors.bg
if config.transparent_background then
    bg = "NONE"
end

local yoda = {
    normal = {
        a = { fg = colors.bg, bg = colors.accent },
        b = { fg = colors.accent, bg = bg },
        c = { fg = colors.string_green, bg = bg },
        x = { fg = colors.string_green, bg = bg },
        y = { fg = colors.dim, bg = bg },
        z = { fg = colors.string_green, bg = bg },
    },
    insert = {
        a = { fg = colors.bg, bg = colors.blue },
        z = { fg = colors.dim, bg = bg },
    },
    visual = {
        a = { fg = colors.bg, bg = colors.magenta },
        z = { fg = colors.dim, bg = bg },
    },
    replace = {
        a = { fg = colors.bg, bg = colors.red },
        z = { fg = colors.dim, bg = bg },
    },
    command = {
        a = { fg = colors.bg, bg = colors.interface },
        z = { fg = colors.dim, bg = bg },
    },
    terminal = {
        a = { fg = colors.bg, bg = colors.yellow },
        z = { fg = colors.dim, bg = bg },
    },
    inactive = {
        a = { fg = colors.dim, bg = bg },
        b = { fg = colors.dim, bg = bg },
        c = { fg = colors.dim, bg = bg },
        x = { fg = colors.dim, bg = bg },
        y = { fg = colors.dim, bg = bg },
        z = { fg = colors.dim, bg = bg },
    },
}

return yoda
