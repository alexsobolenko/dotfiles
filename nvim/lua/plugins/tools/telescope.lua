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

        local builtin = require('telescope.builtin')
        local utils = require("extras.utils")
        utils.keymap("n", "<leader>ff", builtin.find_files, "Find files")
        utils.keymap("n", "<leader>fw", builtin.live_grep, "Find words")
        utils.keymap("n", "<leader>fb", builtin.buffers, "Find buffers")
        utils.keymap("n", "<leader>ls", builtin.lsp_document_symbols, "LSP document symbols")
        utils.keymap("n", "gr", builtin.lsp_references, "Go to references")
        utils.keymap("n", "gd", builtin.lsp_definitions, "Go to definition")
    end,
}
