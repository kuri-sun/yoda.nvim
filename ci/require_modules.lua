-- ci/require_modules.lua
-- Headless CI: require core modules and exit with clear status

local function println(msg)
  io.write(tostring(msg) .. "\n")
end

local modules = {
  'yoda',
  'yoda.colors',
  'yoda.highlights',
  'yoda.plugins',
}

local failed = false

for _, m in ipairs(modules) do
  local ok, err = pcall(require, m)
  if not ok then
    println('Error loading module ' .. m .. ': ' .. tostring(err))
    failed = true
    break
  else
    println('✅ Module ' .. m .. ' loaded successfully')
  end
end

if failed then
  vim.cmd('cquit 1')
else
  println('All modules loaded successfully')
  vim.cmd('qall')
end

