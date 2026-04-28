return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local icons = require("extras.icons")
        require("gitsigns").setup({
            signs = {
                add = { text = icons.gitsigns.add },
                change = { text = icons.gitsigns.change },
                delete = { text = icons.gitsigns.delete },
                topdelete = { text = icons.gitsigns.topdelete },
                changedelete = { text = icons.gitsigns.changedelete },
                untracked = { text = icons.gitsigns.untracked },
            },
            signs_staged = {
                add = { text = icons.gitsigns.add },
                change = { text = icons.gitsigns.change },
                delete = { text = icons.gitsigns.delete },
                topdelete = { text = icons.gitsigns.topdelete },
                changedelete = { text = icons.gitsigns.changedelete },
                untracked = { text = icons.gitsigns.untracked },
            },
            current_line_blame = true,
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")
                local keymap = require("extras.utils").keymap
                local opts = { buffer = bufnr }

                keymap("n", "]h", function()
                    gitsigns.nav_hunk("next")
                end, "Next git hunk", opts)
                keymap("n", "[h", function()
                    gitsigns.nav_hunk("prev")
                end, "Previous git hunk", opts)
                keymap("n", "<leader>gS", gitsigns.stage_hunk, "Git stage hunk", opts)
                keymap("n", "<leader>gr", gitsigns.reset_hunk, "Git reset hunk", opts)
                keymap("v", "<leader>gS", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Git stage hunk", opts)
                keymap("v", "<leader>gr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Git reset hunk", opts)
                keymap("n", "<leader>gu", gitsigns.undo_stage_hunk, "Git undo stage hunk", opts)
                keymap("n", "<leader>gh", gitsigns.preview_hunk, "Git preview hunk", opts)
                keymap("n", "<leader>gH", gitsigns.preview_hunk_inline, "Git preview hunk inline", opts)
                keymap("n", "<leader>gl", function()
                    gitsigns.blame_line({ full = true })
                end, "Git blame line", opts)
            end,
        })
    end,
}
