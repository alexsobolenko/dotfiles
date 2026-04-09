return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local icons = require("extras.icons")
        require("gitsigns").setup({
            signs = {
                add = { text = icons.gitsigns.add },
                change = { text = icons.gitsigns.cange },
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
        })
    end,
}
