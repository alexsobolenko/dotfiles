-- display a character as the colorcolumn

return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        local icons = require("extras.icons")
        require("virt-column").setup({
            char = icons.indent.virtline,
            virtcolumn = "120",
            exclude = {
                filetypes = { "dashboard" },
            },
        })
    end,
}
