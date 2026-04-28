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
        local builtin = require("telescope.builtin")
        local keymap = require("extras.utils").keymap

        keymap("n", "<leader>ff", builtin.find_files, "Find files")
        keymap("n", "<leader>fg", builtin.git_files, "Find git files")
        keymap("n", "<leader>fw", builtin.live_grep, "Find words")
        keymap("n", "<leader>fc", builtin.grep_string, "Find word under cursor")
        keymap("n", "<leader>fb", builtin.buffers, "Find buffers")
        keymap("n", "<leader>fh", builtin.help_tags, "Find help")
        keymap("n", "<leader>fo", builtin.oldfiles, "Find old files")
        keymap("n", "<leader>fr", builtin.resume, "Resume find")
        keymap("n", "<leader>fd", builtin.diagnostics, "Find diagnostics")
        keymap("n", "<leader>fk", builtin.keymaps, "Find keymaps")
        keymap("n", "<leader>fC", builtin.commands, "Find commands")
        keymap("n", "<leader>gb", builtin.git_branches, "Git branches")
        keymap("n", "<leader>gc", builtin.git_commits, "Git commits")
        keymap("n", "<leader>gs", builtin.git_status, "Git status")
        keymap("n", "<leader>ls", builtin.lsp_document_symbols, "LSP document symbols")
        keymap("n", "<leader>lS", builtin.lsp_workspace_symbols, "LSP workspace symbols")
    end,
}
