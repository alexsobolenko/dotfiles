-- preview markdown code

return {
    "ellisonleao/glow.nvim",
    config = function()
        require("glow").setup({
            style = "dark",
            border = "rounded",
        })

        -- mappings
        vim.keymap.set("n", "<leader>mp", ":Glow<CR>", {
            desc = "Markdown preview",
            noremap = true,
            silent = true,
        })
    end,
}
