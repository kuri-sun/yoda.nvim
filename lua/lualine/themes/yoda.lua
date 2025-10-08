-- Lualine theme for yoda.nvim
local colors = require("yoda.colors").palette
local config = require("yoda").config

-- Apply transparent background if configured
local bg = colors.bg
if config.transparent_background then
	bg = "NONE"
end

local yoda = {
	normal = {
		a = { fg = colors.subtle, bg = bg },
		b = { fg = colors.accent, bg = bg },
		c = { fg = colors.white, bg = bg },
		x = { fg = colors.white, bg = bg },
		y = { fg = colors.interface, bg = bg },
		z = { fg = colors.dim, bg = bg },
	},
	insert = {
		a = { fg = colors.brown, bg = bg },
		z = { fg = colors.dim, bg = bg },
	},
	visual = {
		a = { fg = colors.pink, bg = bg },
		z = { fg = colors.dim, bg = bg },
	},
	replace = {
		a = { fg = colors.error, bg = bg },
		z = { fg = colors.dim, bg = bg },
	},
	command = {
		a = { fg = colors.interface, bg = bg },
		z = { fg = colors.dim, bg = bg },
	},
	terminal = {
		a = { fg = colors.warning, bg = bg },
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
