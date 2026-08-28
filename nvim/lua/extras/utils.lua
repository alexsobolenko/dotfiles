local M = {}

-- set a keymap with noremap/silent defaults, overridable via opts
function M.keymap(mode, lhs, rhs, desc, opts, buffer)
    local default_opts = { desc = desc, noremap = true, silent = true }
    opts = vim.tbl_extend("force", default_opts, opts or {})
    if buffer ~= nil then
        opts = vim.tbl_extend("force", opts, { buffer = buffer })
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- map table
function M.map(tbl, func)
    local result = {}
    for i, v in ipairs(tbl) do
        result[i] = func(v)
    end

    return result
end

return M
