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

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                -- navigation (falls back to native diff-mode navigation inside a diff)
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, "Next git hunk")
                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, "Previous git hunk")

                -- stage / reset
                map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
                map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
                map("v", "<leader>gs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Stage hunk")
                map("v", "<leader>gr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Reset hunk")
                map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
                map("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer")

                -- inspect
                map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
                map("n", "<leader>gb", function()
                    gitsigns.blame_line({ full = true })
                end, "Blame line")
                map("n", "<leader>gd", gitsigns.diffthis, "Diff this file")
            end,
        })
    end,
}
