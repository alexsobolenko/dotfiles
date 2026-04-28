local M = {}

-- map table
function M.map(tbl, func)
    local result = {}
    for i, v in ipairs(tbl) do
        result[i] = func(v)
    end

    return result
end

-- set custom keymap
function M.keymap(mode, lhs, rhs, desc, opts)
    opts = vim.tbl_extend("force", {
        noremap = true,
        silent = true,
    }, opts or {})

    if desc then
        opts.desc = desc
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

-- load and setup theme
function M.setup_theme()
    local default_theme = "monokai"
    local selected_theme = nil

    local config_path = vim.fn.stdpath("config")
    local handle = vim.uv.fs_scandir(config_path .. "/lua/plugins/theme")

    local theme_list = {}
    if handle ~= nil then
        while true do
            local name, t = vim.uv.fs_scandir_next(handle)
            if not name then
                break
            end
            if t == "file" and type(name) == "string" and name:match("%.lua$") then
                local theme_name = name:gsub("%.lua$", "")
                table.insert(theme_list, theme_name)
            end
        end
        local theme_file = config_path .. "/.theme"
        if vim.uv.fs_stat(theme_file) then
            local file = io.open(theme_file, "r")
            if file then
                selected_theme = file:read("*l")
                file:close()
            end
        end
    end

    if not selected_theme or not vim.tbl_contains(theme_list, selected_theme) then
        selected_theme = default_theme
    end

    return selected_theme
end

return M
