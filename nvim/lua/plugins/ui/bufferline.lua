-- tab navigations for buffers

return {
    "akinsho/bufferline.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local icons = require("extras.icons")
        local utils = require("extras.utils")

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

        local switch_neotree_focus = function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd("wincmd p")
            else
                vim.cmd("Neotree focus")
            end
        end

        local function close_buffer_at(index)
            if index == nil then
                close_buffer(vim.api.nvim_get_current_buf())
                return
            end
            require("bufferline").exec(index, function(element)
                close_buffer(element.id)
            end)
        end

        utils.keymap("n", "<Tab>", switch_neotree_focus, "Toggle focus: neo-tree")
        utils.keymap("n", "<leader>bc", function() close_buffer_at(nil) end, "Close buffer")
        for i = 1, 9 do
            utils.keymap("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", "which_key_ignore")
            utils.keymap("n", "<leader>b" .. i, function() close_buffer_at(i) end, "which_key_ignore")
        end
    end,
}
