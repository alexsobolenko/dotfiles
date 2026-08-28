-- tab navigations for buffers

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local icons = require("extras.icons")

        local function close_buffer(bufnr)
            local alternatives = vim.fn.getbufinfo({ buflisted = 1 })
            for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
                for _, buf in ipairs(alternatives) do
                    if buf.bufnr ~= bufnr then
                        vim.api.nvim_win_set_buf(win, buf.bufnr)
                        break
                    end
                end
            end
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end

        require("bufferline").setup({
            options = {
                close_command = close_buffer,
                right_mouse_command = close_buffer,
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
        vim.keymap.set("n", "<Tab>", function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd("wincmd p")
            else
                vim.cmd("Neotree focus")
            end
        end, { desc = "Toggle focus: neo-tree", noremap = true, silent = true })
        vim.keymap.set("n", "<leader>bc", function()
            close_buffer(vim.api.nvim_get_current_buf())
        end, {
            desc = "Close buffer",
            noremap = true,
            silent = true,
        })

        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", {
                desc = "which_key_ignore",
                noremap = true,
                silent = true,
            })
        end
    end,
}
