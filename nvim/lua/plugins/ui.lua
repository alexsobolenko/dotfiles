return {
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("bufferline").setup({
                options = {
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    buffer_close_icon = "",
                    numbers = "ordinal",
                    show_close_icons = true,
                    offsets = {
                        { rhs = 1, min = 0, max = 12 },
                    },
                    mode = "buffers",
                    diagnostics = "nvim_lsp",
                    indicator = {
                        icon = "  ",
                        style = "icon",
                    },
                    shape = "rounded",
                    padding = {
                        left = 0,
                        right = 1,
                        top = 0,
                        bottom = 0,
                    },
                    border = {
                        "rounded",
                        { l = " ", r = " " },
                    },
                    virtual_text = true,
                    custom_arround_filetypes = {
                        cpp = { "clangd" },
                        lua = { "null-ls" },
                    },
                    highlight_group = {
                        normal = "BufferLine",
                        buffer_selected = "BufferLine_BufferSelected",
                        buffer_visible = "BufferLine_BufferVisible",
                        buffer_close = "BufferLine_BufferClose",
                        buffer_directory = "Directory",
                        buffer_modified = "Modified",
                        buffer_not_saved = "NonSaved",
                        buffer_insert = "Insert",
                        buffer_visual = "Visual",
                        buffer_leaf = "Leaf",
                        buffer_expand = "Expandable",
                        buffer_collapse = "Collapsible",
                        indicator_selected = "BufferLine_IndicatorSelected",
                        indicator_normal = "BufferLine_IndicatorNormal",
                    },
                },
            })

            vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
            vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {
                desc = "Previous buffer",
                silent = true,
            })
            vim.keymap.set("n", "<leader>bc", "<cmd>bd!<CR>", { desc = "Close buffer", silent = true })

            for i = 1, 9 do
                vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
                    desc = "Go to buffer " .. i,
                    silent = true,
                })
            end
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = {
                char = "┊",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "│", right = "│" },
                    section_separators = { left = "│", right = "│" },
                    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            separator = { left = "│" },
                            right_padding = 3,
                        },
                    },
                    lualine_b = {
                        { "fileformat" },
                        { "filename" },
                        { "branch" },
                        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = { error = "✘ ", warn = "⚠ ", info = "ℹ " },
                        },
                        { "o:encoding", fmt = string.upper },
                        { "filetype" },
                        { "progress" },
                    },
                    lualine_z = {
                        {
                            "location",
                            separator = { right = "│" },
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
                extensions = { "quickfix" },
            })
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup({
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                },
            })
        end,
    },
    {
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
    },
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("virt-column").setup({
                char = "│",
                virtcolumn = "120",
            })
        end,
    },
}
