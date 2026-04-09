-- sonokai colorscheme neovim

return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        if vim.g.nvim_theme == "sonokai" then
            vim.g.sonokai_enable_italic = true
            vim.cmd.colorscheme("sonokai")
        end
    end,
}
