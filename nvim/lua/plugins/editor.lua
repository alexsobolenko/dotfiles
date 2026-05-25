return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = { "VeryLazy" },
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "gbprod/substitute.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local substitute = require("substitute")
            substitute.setup()

            vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion", silent = true })
            vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line", silent = true })
            vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line", silent = true })
            vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode", silent = true })
        end,
    },
}
