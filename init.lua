local M = {}

-- Default configuration
M.config = {
	-- Enable/disable italic comments
	italic_comments = true,
	-- Enable/disable background transparency
	transparent_background = false,
	-- Enable/disable bold keywords
	bold_keywords = true,
	-- Enable/disable underline for matching parentheses
	underline_match_paren = true,
	-- Custom color overrides (merged with default palette)
	colors = {},
	-- Custom highlight overrides (applied after default highlights)
	highlights = {},
}

-- Setup function to configure the theme
function M.setup(opts)
	-- Merge user options with defaults
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Apply transparent background if requested
	if M.config.transparent_background then
		local colors = require("yoda.colors").palette
		colors.bg = "NONE"
		colors.bg_dark = "NONE"
		colors.bg_light = "NONE"
	end

	-- Apply custom color overrides
	if M.config.colors and type(M.config.colors) == "table" then
		local colors = require("yoda.colors").palette
		for key, value in pairs(M.config.colors) do
			colors[key] = value
		end
	end
end

-- Load the colorscheme
function M.load()
	-- Set termguicolors for true color support
	vim.o.termguicolors = true

	-- Apply highlights
	require("yoda.highlights").setup()

	-- Set the colorscheme name (this must come after applying highlights)
	vim.g.colors_name = "yoda"

	-- Apply style overrides based on configuration
	local set = vim.api.nvim_set_hl
	local colors = require("yoda.colors").palette

	-- Handle italic comments
	if not M.config.italic_comments then
		set(0, "Comment", { fg = colors.gray, italic = false })
		set(0, "@comment", { fg = colors.gray, italic = false })
		set(0, "@comment.documentation", { fg = colors.gray, italic = false })
	end

	-- Handle bold keywords
	if not M.config.bold_keywords then
		set(0, "Keyword", { fg = colors.blue, bold = false })
		set(0, "@keyword", { fg = colors.blue, bold = false })
		set(0, "Statement", { fg = colors.blue, bold = false })
		set(0, "Conditional", { fg = colors.blue, bold = false })
	end

	-- Handle underline match paren
	if not M.config.underline_match_paren then
		set(0, "MatchParen", { fg = colors.accent, bold = true, underline = false })
	end

	-- Apply custom highlight overrides
	if M.config.highlights and type(M.config.highlights) == "function" then
		M.config.highlights(colors, set)
	elseif M.config.highlights and type(M.config.highlights) == "table" then
		for group, opts in pairs(M.config.highlights) do
			set(0, group, opts)
		end
	end

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
	package.loaded["yoda.init"] = nil

	-- Reload and setup
	require("yoda").load()
end

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

