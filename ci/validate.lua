#!/usr/bin/env nvim -l
-- ci/validate.lua  
-- Basic validation checks that don't require external tools

-- Set up paths
local project_root = vim.fn.getcwd()
vim.opt.runtimepath:prepend(project_root)

local exit_code = 0

-- Print with colors
local function print_status(color, message)
    local colors = {
        red = '\027[31m',
        green = '\027[32m',
        yellow = '\027[33m',
        blue = '\027[34m',
        reset = '\027[0m'
    }
    print(colors[color] .. message .. colors.reset)
end

print_status('blue', '🔍 yoda.nvim Basic Validation')
print('=================================')
print('')

-- Test 1: Check that theme can be loaded
print_status('blue', '🎨 Testing theme loading...')
local theme_ok, theme_err = pcall(function()
    vim.cmd('colorscheme yoda')
end)

if theme_ok then
    print_status('green', '✅ Theme loads successfully')
else
    print_status('red', '❌ Failed to load theme: ' .. tostring(theme_err))
    exit_code = 1
end

-- Test 2: Check that all main modules can be required
print_status('blue', '📦 Testing module loading...')
local modules = {
    'yoda',
    'yoda.colors',
    'yoda.highlights', 
    'yoda.plugins',
    'yoda.util'
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if ok then
        print_status('green', '✅ Module ' .. module .. ' loaded')
    else
        print_status('red', '❌ Failed to load ' .. module .. ': ' .. tostring(err))
        exit_code = 1
    end
end

-- Test 3: Check basic theme functionality
print_status('blue', '⚙️  Testing basic functionality...')

-- Test that we can get colors
local colors_ok, colors = pcall(require, 'yoda.colors')
if colors_ok and colors.palette then
    print_status('green', '✅ Color palette accessible')
else
    print_status('red', '❌ Color palette not accessible')
    exit_code = 1
end

-- Test that highlights can be applied
local highlights_ok, highlights = pcall(require, 'yoda.highlights')
if highlights_ok and type(highlights.setup) == 'function' then
    local setup_ok = pcall(highlights.setup, colors and colors.palette or {})
    if setup_ok then
        print_status('green', '✅ Highlights can be applied')
    else
        print_status('red', '❌ Failed to apply highlights')
        exit_code = 1
    end
else
    print_status('red', '❌ Highlights module not functional')
    exit_code = 1
end

-- Test 4: Check that key highlight groups are defined
print_status('blue', '🎯 Testing highlight groups...')
local required_groups = {
    'Normal',
    'Comment', 
    'String',
    'Function',
    'Keyword'
}

for _, group in ipairs(required_groups) do
    local hl = vim.api.nvim_get_hl(0, {name = group})
    if hl and next(hl) then
        print_status('green', '✅ ' .. group .. ' highlight defined')
    else
        print_status('red', '❌ ' .. group .. ' highlight missing')
        exit_code = 1
    end
end

print('')

-- Summary
if exit_code == 0 then
    print_status('green', '🎉 All validation checks passed!')
else
    print_status('red', '💥 Some validation checks failed!')
end

print('')
os.exit(exit_code)