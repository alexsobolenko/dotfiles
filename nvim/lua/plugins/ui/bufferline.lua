-- tab navigations for buffers

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local icons = require("extras.icons")
        require("bufferline").setup({
            options = {
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                buffer_close_icon = icons.bufferline.close,
                numbers = "ordinal",
                show_close_icons = true,
                offsets = {
                    { rhs = 1, min = 0, max = 12 },
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        separator = true,
                        padding = 0,
                    },
                },
                mode = "buffers",
                diagnostics = "nvim_lsp",
                indicator = {
                    icon = icons.bufferline.diagnostics,
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

        -- mappings
        vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {
            desc = "Next buffer",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {
            desc = "Previous buffer",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>bc", ":bd!<CR>", {
            desc = "Close buffer",
            noremap = true,
            silent = true,
        })

        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", {
                desc = "Go to buffer " .. i,
                noremap = true,
                silent = true,
            })
        end
    end,
}
