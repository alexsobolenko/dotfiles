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
        -- copy the focused node's name/path to the system clipboard
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
                width = 45,
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

        -- mappings
        vim.keymap.set("n", "<leader>e", ":Neotree left<CR>", {
            desc = "Neotree left panel",
            noremap = true,
            silent = true,
        })

        -- open the tree on the left on startup, focus stays on the editor
        -- (config() itself already runs on the VimEnter event this plugin is
        -- loaded on, so no need to wrap this in another VimEnter autocmd)
        require("neo-tree.command").execute({ action = "show", position = "left" })
    end,
}
