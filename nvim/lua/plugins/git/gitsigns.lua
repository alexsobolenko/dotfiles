return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local icons = require("extras.icons")
        local utils = require("extras.utils")
        local gitsigns = require("gitsigns")

        gitsigns.setup({
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
                local function next_hunk()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end

                local function prev_hunk()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end

                local function stage_hunk_visual()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end

                local function reset_hunk_visual()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end

                local function blame_line_full()
                    gitsigns.blame_line({ full = true })
                end

                utils.keymap("n", "]c", next_hunk, "Next git hunk", {}, bufnr)
                utils.keymap("n", "[c", prev_hunk, "Previous git hunk", {}, bufnr)
                utils.keymap("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk", {}, bufnr)
                utils.keymap("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk", {}, bufnr)
                utils.keymap("v", "<leader>gs", stage_hunk_visual, "Stage hunk", {}, bufnr)
                utils.keymap("v", "<leader>gr", reset_hunk_visual, "Reset hunk", {}, bufnr)
                utils.keymap("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer", {}, bufnr)
                utils.keymap("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer", {}, bufnr)
                utils.keymap("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk", {}, bufnr)
                utils.keymap("n", "<leader>gb", blame_line_full, "Blame line", {}, bufnr)
                utils.keymap("n", "<leader>gd", gitsigns.diffthis, "Diff this file", {}, bufnr)
            end,
        })
    end,
}
