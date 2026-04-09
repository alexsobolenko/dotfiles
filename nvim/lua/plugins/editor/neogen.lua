-- create annotations

return {
    "danymat/neogen",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        require("neogen").setup({
            enabled = true,
            languages = {
                php = {
                    template = {
                        annotation_convention = "phpdoc",
                        types = true,
                    },
                },
            },
        })

        -- mappings
        vim.keymap.set("n", "<leader>an", ":lua require('neogen').generate<CR>", {
            desc = "Generate annotation",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>af", ":lua require('neogen').generate({ type = 'func' })<CR>", {
            desc = "Annotate function",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>ac", ":lua require('neogen').generate({ type = 'class' })<CR>", {
            desc = "Annotate class",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>at", ":lua require('neogen').generate({ type = 'type' })<CR>", {
            desc = "Annotate type",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>aa", ":lua require('neogen').generate({ type = 'file' })<CR>", {
            desc = "Annotate file",
            noremap = true,
            silent = true,
        })
    end,
}
