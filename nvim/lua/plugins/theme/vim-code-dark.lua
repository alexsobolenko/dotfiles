-- vim-code-dark colorscheme neovim

return {
    "tomasiser/vim-code-dark",
    config = function()
        if vim.g.nvim_theme == "vim-code-dark" then
            vim.cmd.colorscheme("codedark")
        end
    end,
}
