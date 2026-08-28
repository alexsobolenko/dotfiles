-- navigation tree

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        { "MunifTanjim/nui.nvim" },
    },
    config = function()
        local icons = require("extras.icons")

        local function set_cursorline_hl()
            vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { reverse = true })
        end
        set_cursorline_hl()
        vim.api.nvim_create_autocmd("ColorScheme", { callback = set_cursorline_hl })

        local base_columns = 185
        local base_width = 45
        local function adaptive_width()
            local columns = vim.o.columns
            if columns <= base_columns then
                return base_width
            end
            return math.min(base_width + math.floor((columns - base_columns) * 0.2), 90)
        end

        local function copy_to_clipboard(get_value)
            return function(state)
                local node = state.tree:get_node()
                local value = get_value(node)
                vim.fn.setreg("+", value)
                vim.notify("Copied: " .. value)
            end
        end

        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            commands = {
                copy_name_to_clipboard = copy_to_clipboard(function(node)
                    return node.name
                end),
                copy_absolute_path_to_clipboard = copy_to_clipboard(function(node)
                    return node:get_id()
                end),
                copy_relative_path_to_clipboard = copy_to_clipboard(function(node)
                    return vim.fn.fnamemodify(node:get_id(), ":.")
                end),
            },
            window = {
                width = adaptive_width,
                mappings = {
                    ["<space>"] = "none",
                    ["gn"] = { "copy_name_to_clipboard", desc = "Copy name to clipboard" },
                    ["ga"] = { "copy_absolute_path_to_clipboard", desc = "Copy absolute path to clipboard" },
                    ["gr"] = { "copy_relative_path_to_clipboard", desc = "Copy relative path to clipboard" },
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = { ".git", ".idea", ".vscode" },
                },
            },
            default_component_configs = {
                icon = {
                    folder_closed = icons.tree.folder_closed,
                    folder_open = icons.tree.folder_open,
                    folder_empty = icons.tree.folder_empty,
                },
                git_status = {
                    symbols = {
                        added = icons.tree.git_added,
                        modified = icons.tree.git_modified,
                        deleted = icons.tree.git_deleted,
                        renamed = icons.tree.git_renamed,
                        untracked = icons.tree.git_untracked,
                        ignored = icons.tree.git_ignored,
                        unstaged = icons.tree.git_unstaged,
                        staged = icons.tree.git_staged,
                        conflict = icons.tree.git_conflict,
                    },
                },
            },
        })

        require("neo-tree.command").execute({ action = "show", position = "left" })

        vim.api.nvim_create_autocmd({ "FileType", "WinEnter", "CursorMoved" }, {
            callback = function(event)
                if vim.bo[event.buf].filetype ~= "neo-tree" then
                    return
                end
                local winid = vim.fn.bufwinid(event.buf)
                if winid == -1 then
                    return
                end
                vim.schedule(function()
                    if vim.api.nvim_win_is_valid(winid) then
                        vim.api.nvim_set_option_value("cursorline", true, { win = winid })
                        vim.api.nvim_set_option_value("cursorlineopt", "both", { win = winid })
                    end
                end)
            end,
        })

        vim.api.nvim_create_autocmd("VimResized", {
            callback = function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    if vim.bo[buf].filetype == "neo-tree" then
                        vim.api.nvim_win_set_width(win, adaptive_width())
                    end
                end
            end,
        })
    end,
}
