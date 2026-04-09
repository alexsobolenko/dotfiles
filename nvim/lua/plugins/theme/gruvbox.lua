-- gruvbox-material colorscheme

return {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
        if vim.g.nvim_theme == "gruvbox" then
            vim.g.gruvbox_material_enable_italic = true
            vim.cmd.colorscheme("gruvbox-material")
        end
    end,
}
