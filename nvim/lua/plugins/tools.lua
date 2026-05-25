return {
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({
                style = "dark",
                border = "rounded",
            })

            vim.keymap.set("n", "<leader>mp", "<cmd>Glow<CR>", { desc = "Markdown preview", silent = true })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    layout_strategy = "horizontal",
                    layout_config = {
                        prompt_position = "top",
                        width = 0.75,
                        height = 0.75,
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files", silent = true })
            vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files", silent = true })
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find words", silent = true })
            vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor", silent = true })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers", silent = true })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help", silent = true })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files", silent = true })
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume find", silent = true })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics", silent = true })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps", silent = true })
            vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Find commands", silent = true })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches", silent = true })
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits", silent = true })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status", silent = true })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "LSP document symbols", silent = true })
            vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "LSP workspace symbols", silent = true })
        end,
    },
}
