local M = {}

M.palette = {
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
}

-- Semantic color mappings for easier access
M.semantics = {
	error = M.palette.red,
	warning = M.palette.yellow,
	info = M.palette.cyan,
	hint = M.palette.blue,
	success = M.palette.green,
}

return M
