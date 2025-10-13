-- .luacheckrc
-- Configuration for luacheck linter

-- Set standard to luajit (what Neovim uses)
std = "luajit"

-- Global variables that are allowed (Neovim globals)
globals = {
  "vim",
  "_TESTING",
}

-- Read globals from other files
read_globals = {
  "vim",
}

-- Ignore specific warnings
ignore = {
  "212/_.*",     -- Allow unused argument if it starts with underscore
  "214",         -- Allow unused variable in a local function
  "581",         -- Allow negation of comparison  
  "631",         -- Allow assignment inside condition
}

-- Files to exclude from checking
exclude_files = {
  -- Add any files to exclude here if needed
}

-- Override settings for specific files
files["lua/yoda/plugins/**/*.lua"] = {
  ignore = {"113"}, -- Allow undefined globals for plugin files (external deps)
}

files["ci/**/*.lua"] = {
  globals = {"os", "debug"}, -- CI scripts can use these
}

-- Maximum line length
max_line_length = 120