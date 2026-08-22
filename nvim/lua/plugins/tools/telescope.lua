-- grep git, filesystem, code

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local icons = require("extras.icons")
        require("telescope").setup({
            defaults = {
                prompt_prefix = icons.telescope.prompt_prefix,
                selection_caret = icons.telescope.selection_caret,
                entry_prefix = icons.telescope.entry_prefix,
                initial_mode = "insert",
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    width = 0.75,
                    height = 0.75,
                },
            },
        })

        -- mappings
        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {
            desc = "Find files",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {
            desc = "Find words",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            desc = "Find buffers",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
            desc = "Find help",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, {
            desc = "Git branches",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>gc", builtin.git_commits, {
            desc = "Git commits",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>gs", builtin.git_status, {
            desc = "Git status",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {
            desc = "LSP document symbols",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gr", builtin.lsp_references, {
            desc = "Go to references",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, {
            desc = "Go to definition",
            noremap = true,
            silent = true,
        })
    end,
}
