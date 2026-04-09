-- dashboard

return {
    "goolord/alpha-nvim",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "echasnovski/mini.icons" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local d = require("extras.dashboard")
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = d.header()
        dashboard.section.buttons.val = d.buttons()
        dashboard.section.footer.val = d.footer()

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
