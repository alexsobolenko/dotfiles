-- IDE status line

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local icons = require("extras.icons")
        local lsp_progress = require("lsp-progress")
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = icons.statusbar.component_separators,
                section_separators = icons.statusbar.section_separators,
                disabled_filetypes = {
                    "dashboard",
                    "NvimTree",
                    "Outline",
                },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = icons.statusbar.section_separators.right },
                        right_padding = 3,
                    },
                },
                lualine_b = {
                    { "fileformat" },
                    { "filename" },
                    { "branch" },
                    { "diff", symbols = icons.statusbar.git },
                },
                lualine_c = {
                   {
                       function()
                           return lsp_progress.progress()
                       end,
                   },
                },
                lualine_x = {},
                lualine_y = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = icons.statusbar.diagnostics,
                    },
                    { "o:encoding", fmt = string.upper },
                    { "filetype" },
                    { "progress" },
                },
                lualine_z = {
                    {
                        "location",
                        separator = { right = icons.statusbar.section_separators.left },
                        left_padding = 2,
                    },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = { "fugitive", "nvim-tree", "quickfix" },
        })
    end,
}
