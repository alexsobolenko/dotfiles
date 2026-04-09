return {
    "pcyman/phptools.nvim",
    config = function()
        require("phptools").setup()

        -- mappings
        vim.keymap.set("n", "<leader>gg", ":PhpToolsGetSet<CR>", {
            desc = "PHP generate getters and setters",
            noremap = true,
            silent = true
        })
    end,
}
