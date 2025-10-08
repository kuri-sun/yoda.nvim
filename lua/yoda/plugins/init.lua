local M = {}

-- Plugin name mapping from config extension names to file names
local plugin_map = {
	neo_tree = "neo-tree",
	nvim_tree = "nvim-tree",
	telescope = "telescope",
	cmp = "cmp",
	gitsigns = "gitsigns",
	snacks = "snacks",
	netrw = "netrw",
	todo_comments = "todo-comments",
	indent_blankline = "indent-blankline",
	dashboard = "dashboard",
	which_key = "which-key",
	misc = "misc",
}

function M.setup(colors, set)
	local config = require("yoda").config
	local extensions = config.extensions or {}
	
	-- Load plugin highlights based on enabled extensions
	for ext_name, enabled in pairs(extensions) do
		if enabled and plugin_map[ext_name] then
			local plugin_file = plugin_map[ext_name]
			local ok, module = pcall(require, "yoda.plugins." .. plugin_file)
			if ok and module.highlights then
				module.highlights(colors, set)
			end
		end
	end
end

return M

