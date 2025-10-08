local M = {}

local palettes = {
	dark = {
		-- Core colors
		bg = "#050705",
		fg = "#b9f6ca",
		white = "#e5e5e5",
		accent = "#00cc77",
		brown = "#d4a574",
		brown_dim = "#b8956a",
		interface = "#a8c7e0",
		pink = "#e6a3d0",
		dim = "#5a7a5a",
		subtle = "#7a9a8a",
		bright = "#ffffff",
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
		green = "#00cc77",
		cyan = "#b9f6ca",
		magenta = "#e6a3d0",
		orange = "#b8956a",
		blue = "#00cc77",
		fg_dark = "#7a9a8a",
		fg_light = "#e5e5e5",
	},
	light = {
		-- Core colors
		bg = "#fafff5",
		fg = "#2a4a2a",
		white = "#1a1a1a",
		accent = "#00aa55",
		brown = "#8b5a2b",
		brown_dim = "#6b4a1b",
		interface = "#2a5a7a",
		pink = "#a64a7a",
		dim = "#6a8a6a",
		subtle = "#4a6a5a",
		bright = "#000000",
		error = "#cc3333",
		warning = "#cc9900",

		-- Background variations
		bg_dark = "#f0f5f0",
		bg_light = "#ffffff",
		bg_highlight = "#e8f0e8",
		border = "#c0d0c0",
		selection = "#d0e8d8",
		cursor_line = "#f0f5f0",
		line_number = "#a0b0a0",

		-- Git/Diff
		diff_add = "#e0f0e0",
		diff_delete = "#f0e0e0",
		diff_change = "#f0f0d0",
		diff_text = "#e8e8c0",

		-- Traditional color mappings
		red = "#cc3333",
		yellow = "#cc9900",
		gray = "#6a8a6a",
		green = "#00aa55",
		cyan = "#2a4a2a",
		magenta = "#a64a7a",
		orange = "#6b4a1b",
		blue = "#00aa55",
		fg_dark = "#4a6a5a",
		fg_light = "#1a1a1a",
	}
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
