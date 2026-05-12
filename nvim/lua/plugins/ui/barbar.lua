-- tab navigations for buffers

return {
    "romgrk/barbar.nvim",
    dependencies = {
        { "lewis6991/gitsigns.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        animation = true,
        auto_hide = false,
        tabpages = true,
        clickable = true,
        focus_on_close = 'left',
        hide = {
            extensions = true,
            inactive = false,
        },
        highlight_alternate = false,
        highlight_inactive_file_icons = false,
        highlight_visible = true,
        icons = {
            buffer_index = true,
            buffer_number = false,
            button = '',
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                [vim.diagnostic.severity.WARN] = { enabled = false },
                [vim.diagnostic.severity.INFO] = { enabled = false },
                [vim.diagnostic.severity.HINT] = { enabled = true },
            },
            gitsigns = {
                added = {enabled = true, icon = '+'},
                changed = {enabled = true, icon = '~'},
                deleted = {enabled = true, icon = '-'},
            },
            filetype = {
                custom_colors = false,
                enabled = true,
            },
            separator = {
                left = '▎',
                right = '',
            },
            separator_at_end = true,
            modified = {
                button = '●',
            },
            pinned = {
                button = '',
                filename = true,
            },
            preset = 'default',
            alternate = {
                filetype = {enabled = false},
            },
            current = {
                buffer_index = true,
            },
            inactive = {
                button = '×',
            },
            visible = {
                modified = {buffer_number = false},
            },
        },
        insert_at_end = true,
        insert_at_start = false,
        maximum_padding = 1,
        minimum_padding = 1,
        maximum_length = 30,
        minimum_length = 0,
        semantic_letters = true,
        sidebar_filetypes = {
            NvimTree = true,
            undotree = {
                text = 'undotree',
                align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
            },
            ['neo-tree'] = {event = 'BufWipeout'},
            Outline = {
                event = 'BufWinLeave',
                text = 'symbols-outline',
                align = 'right',
            },
        },
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
        no_name_title = nil,
        sort = {
            ignore_case = true,
        },
    },
    version = '^1.0.0',
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function(_, opts)
        require('barbar').setup(opts)

        local keymap = require('extras.utils').keymap
        local function setup_highlights()
            local current_bg = '#d7d7af'
            local current_fg = '#1c1c1c'
            local inactive_bg = '#1c1c1c'
            local inactive_fg = '#8a8a8a'
            local visible_bg = '#262626'
            local visible_fg = '#bcbcbc'
            local current_groups = {
                'BufferCurrent',
                'BufferCurrentBtn',
                'BufferCurrentIndex',
                'BufferCurrentMod',
                'BufferCurrentModBtn',
                'BufferCurrentNumber',
                'BufferCurrentPin',
                'BufferCurrentPinBtn',
                'BufferCurrentSign',
                'BufferCurrentSignRight',
            }
            local inactive_groups = {
                'BufferInactive',
                'BufferInactiveBtn',
                'BufferInactiveIcon',
                'BufferInactiveIndex',
                'BufferInactiveMod',
                'BufferInactiveModBtn',
                'BufferInactiveNumber',
                'BufferInactivePin',
                'BufferInactivePinBtn',
                'BufferInactiveSign',
                'BufferInactiveSignRight',
            }
            local visible_groups = {
                'BufferVisible',
                'BufferVisibleBtn',
                'BufferVisibleIcon',
                'BufferVisibleIndex',
                'BufferVisibleMod',
                'BufferVisibleModBtn',
                'BufferVisibleNumber',
                'BufferVisiblePin',
                'BufferVisiblePinBtn',
                'BufferVisibleSign',
                'BufferVisibleSignRight',
            }

            for _, group in ipairs(current_groups) do
                vim.api.nvim_set_hl(0, group, { bg = current_bg, fg = current_fg, bold = true })
            end
            for _, group in ipairs(inactive_groups) do
                vim.api.nvim_set_hl(0, group, { bg = inactive_bg, fg = inactive_fg })
            end

            for _, group in ipairs(visible_groups) do
                vim.api.nvim_set_hl(0, group, { bg = visible_bg, fg = visible_fg })
            end
        end

        setup_highlights()
        vim.api.nvim_create_autocmd('ColorScheme', {
            callback = setup_highlights,
        })

        keymap('n', '<Tab>', '<cmd>BufferNext<CR>', 'Next buffer')
        keymap('n', '<S-Tab>', '<cmd>BufferPrevious<CR>', 'Previous buffer')
        keymap('n', '<leader>bc', '<cmd>BufferClose<CR>', 'Close buffer')
        keymap('n', '<leader>bp', '<cmd>BufferPick<CR>', 'Pick buffer')
        keymap('n', '<leader>bP', '<cmd>BufferPin<CR>', 'Pin buffer')
        keymap('n', '<leader>bo', '<cmd>BufferCloseAllButCurrentOrPinned<CR>', 'Close other buffers')
        keymap('n', '<leader>bl', '<cmd>BufferCloseBuffersLeft<CR>', 'Close buffers left')
        keymap('n', '<leader>br', '<cmd>BufferCloseBuffersRight<CR>', 'Close buffers right')
        keymap('n', '<leader>b[', '<cmd>BufferMovePrevious<CR>', 'Move buffer left')
        keymap('n', '<leader>b]', '<cmd>BufferMoveNext<CR>', 'Move buffer right')
        keymap('n', '<leader>bR', '<cmd>BufferRestore<CR>', 'Restore buffer')

        for i = 1, 9 do
            keymap('n', '<leader>' .. i, '<cmd>BufferGoto ' .. i .. '<CR>', 'Go to buffer ' .. i)
        end
    end,
}
