-- Load the yoda colorscheme
-- Get the directory where this file is located
local current_dir = vim.fn.expand('<sfile>:p:h:h')
-- Add it to the Lua path
package.path = current_dir .. '/?.lua;' .. current_dir .. '/?/init.lua;' .. package.path

-- Now require the module
require('init').load()