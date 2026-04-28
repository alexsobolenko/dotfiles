-- helps with keymaps

return {
    "folke/which-key.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "echasnovski/mini.icons" },
    },
    config = function()
        require("which-key").setup({
            preset = "modern",
            spec = {
                { "<leader>a", group = "Annotations" },
                { "<leader>b", group = "Buffers" },
                { "<leader>c", group = "Code" },
                { "<leader>d", group = "Diagnostics" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
                { "<leader>lw", group = "Workspace" },
                { "<leader>m", group = "Markdown" },
                { "<leader>n", group = "Notifications" },
                { "<leader>p", group = "PHP" },
            },
        })
    end,
}
