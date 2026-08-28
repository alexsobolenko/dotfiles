-- neovim colorscheme

-- return {
--     "tanvirtin/monokai.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("monokai").setup()
--     end,
-- }

return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme("sonokai")
    end,
}
