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
        })
    end,
}
