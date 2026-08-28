-- find and replace ui

return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup({})

        vim.keymap.set("n", "<leader>fr", function()
            require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end, { desc = "Find and replace in current file", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>fR", function()
            require("grug-far").open()
        end, { desc = "Find and replace in project", noremap = true, silent = true })
    end,
}
