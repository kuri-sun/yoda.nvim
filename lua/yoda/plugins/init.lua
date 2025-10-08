local M = {}

-- List of plugin modules to load
local plugins = {
	"neo-tree",
	"nvim-tree",
	"telescope",
	"cmp",
	"gitsigns",
	"misc",
}

function M.setup(colors, set)
	-- Load all plugin highlight modules
	for _, plugin in ipairs(plugins) do
		local ok, module = pcall(require, "yoda.plugins." .. plugin)
		if ok and module.highlights then
			module.highlights(colors, set)
		end
	end
end

return M