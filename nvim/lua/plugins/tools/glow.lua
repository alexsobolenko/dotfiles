-- preview markdown code

return {
    "ellisonleao/glow.nvim",
    config = function()
        require("glow").setup({
            style = "dark",
            border = "rounded",
        })

        local utils = require("extras.utils")
        utils.keymap("n", "<leader>mp", ":Glow<CR>", "Markdown preview")
    end,
}
