-- display a character as the colorcolumn

return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        local icons = require("extras.icons")
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype ~= "dashboard" then
                    require("virt-column").setup({
                        char = icons.indent.virtline,
                        virtcolumn = "120",
                    })
                end
            end,
        })
    end,
}
