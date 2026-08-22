return {
    "williamboman/mason.nvim",
    config = function()
        local icons = require("extras.icons")
        require("mason").setup({
            ui = {
                icons = icons.mason,
            },
        })
    end
}
