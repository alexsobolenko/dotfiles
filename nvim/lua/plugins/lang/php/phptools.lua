return {
    "pcyman/phptools.nvim",
    config = function()
        require("phptools").setup()
        local keymap = require("extras.utils").keymap

        -- mappings
        keymap("n", "<leader>gg", "<cmd>PhpToolsGetSet<CR>", "PHP generate getters and setters")
    end,
}
