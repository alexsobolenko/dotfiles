-- monokai colorscheme neovim

return {
    "tanvirtin/monokai.nvim",
    config = function()
        if vim.g.nvim_theme == "monokai" then
            require("monokai").setup()
        end
    end,
}
