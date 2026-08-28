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
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Code toolkit" },
                { "<leader>f", group = "Find/Replace" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
                { "<leader>m", group = "Markdown" },
                { "<leader>n", group = "Notify" },
                { "<leader>p", group = "PHP tools" },
            },
        })
    end,
}
