-- helps with keymaps

return {
    "folke/which-key.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("which-key").setup({
            preset = "modern",
            win = {
                border = "rounded",
            },
            spec = {
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code-toolkit" },
                { "<leader>f", group = "find/replace" },
                { "<leader>g", group = "git" },
                { "<leader>l", group = "lsp" },
                { "<leader>m", group = "markdown" },
                { "<leader>n", group = "notify" },
                { "<leader>p", group = "php-tools" },
            },
        })
    end,
}
