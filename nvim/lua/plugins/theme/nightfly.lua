-- nightfly colorscheme neovim

return {
    "bluz71/vim-nightfly-colors",
    config = function()
        if vim.g.nvim_theme == "nightfly" then
            vim.cmd([[colorscheme nightfly]])
        end
    end,
}
