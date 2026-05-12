return {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    opts = {
        color_icons = true,
        default = true,
        strict = true,
    },
    config = function(_, opts)
        local devicons = require("nvim-web-devicons")

        devicons.setup(opts)
        devicons.refresh()
        devicons.set_up_highlights(true)

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                devicons.refresh()
                devicons.set_up_highlights(true)
            end,
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
                devicons.refresh()
                devicons.set_up_highlights(true)
            end,
        })
    end,
}
