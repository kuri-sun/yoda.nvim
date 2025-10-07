local M = {}

M.palette = {
  -- Core colors (minimal palette)
  bg = "#050705",        -- Ultra-dark base
  fg = "#b9f6ca",        -- Main text (light green base)
  white = "#e5e5e5",     -- White for strings and contrast
  
  -- Green accent (darker and easier on eyes)
  accent = "#00cc77",    -- Darker saber green for important highlights
  
  -- Brown complements (warm and readable)
  brown = "#d4a574",     -- Warm brown for functions
  brown_dim = "#b8956a", -- Dimmer brown for types
  
  -- Interface/Type distinction
  interface = "#a8c7e0", -- Soft blue-gray for interfaces/types
  
  -- Pink for control flow keywords
  pink = "#e6a3d0",      -- Soft pink for export/return/if/etc
  
  -- Essential semantic colors
  dim = "#5a7a5a",       -- Comments (darker green for readability)
  subtle = "#7a9a8a",    -- Secondary text, punctuation
  bright = "#ffffff",    -- Pure white for emphasis
  blue = "#00bfff",      -- Keywords, functions (from alacritty)
  
  -- Minimal semantic colors (only for critical UI feedback)
  error = "#ff6666",     -- Errors only (softer red)
  warning = "#ffee58",   -- Warnings only
  
  -- Background variations (subtle)
  bg_dark = "#050705",   -- Same as bg
  bg_light = "#0a0d0a",  -- Slightly lighter for UI elements
  bg_highlight = "#0f120f", -- Very subtle highlight
  
  -- Simplified derived colors
  border = "#2a3a2a",    -- Subtle borders
  selection = "#0a2218", -- Selection background
  cursor_line = "#0a0d0a", -- Cursor line (very subtle)
  line_number = "#2a3a2a", -- Line numbers
  
  -- Git/Diff (muted)
  diff_add = "#0a2a0a",    -- Very subtle green
  diff_delete = "#2a0a0a", -- Very subtle red
  diff_change = "#1a1a0a", -- Very subtle yellow
  diff_text = "#2a2a1a",   -- Slightly brighter change
  
  -- Map traditional colors to our minimal palette
  red = "#ff6666",       -- Only for errors
  yellow = "#ffee58",    -- Only for warnings
  gray = "#5a7a5a",      -- Use darker green for comments
  green = "#00cc77",     -- Use darker accent color
  cyan = "#b9f6ca",      -- Use main fg color
  magenta = "#e6a3d0",   -- Use pink color
  orange = "#b8956a",    -- Use brown_dim color
  blue = "#00cc77",      -- Map to accent green
  
  -- Export for compatibility
  fg_dark = "#7a9a8a",   -- Same as subtle
  fg_light = "#e5e5e5",  -- Same as white
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