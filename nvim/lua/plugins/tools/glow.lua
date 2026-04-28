-- preview markdown code

return {
    "ellisonleao/glow.nvim",
    config = function()
        require("glow").setup({
            style = "dark",
            border = "rounded",
        })

        -- mappings
        require("extras.utils").keymap("n", "<leader>mp", "<cmd>Glow<CR>", "Markdown preview")
    end,
}
