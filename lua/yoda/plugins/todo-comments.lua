local M = {}

function M.highlights(colors, set)
    -- todo-comments.nvim plugin highlights
    set(0, "TodoBgTODO", { fg = colors.todo_purple, bold = true })
    set(0, "TodoFgTODO", { fg = colors.todo_purple, bold = true })
    set(0, "TodoSignTODO", { fg = colors.todo_purple, bold = true })
    set(0, "TodoBgNOTE", { fg = colors.interface, bold = true })
    set(0, "TodoFgNOTE", { fg = colors.interface, bold = true })
    set(0, "TodoSignNOTE", { fg = colors.interface, bold = true })
    set(0, "TodoBgFIX", { fg = colors.error, bold = true })
    set(0, "TodoFgFIX", { fg = colors.error, bold = true })
    set(0, "TodoSignFIX", { fg = colors.error, bold = true })
    set(0, "TodoBgHACK", { fg = colors.warning, bold = true })
    set(0, "TodoFgHACK", { fg = colors.warning, bold = true })
    set(0, "TodoSignHACK", { fg = colors.warning, bold = true })
end

return M
