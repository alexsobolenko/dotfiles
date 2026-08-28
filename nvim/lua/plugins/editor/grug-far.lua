-- find and replace ui

return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup()

        local utils = require("extras.utils")
        local function find_in_file()
            require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end

        utils.keymap("n", "<leader>fr", find_in_file, "Find and replace in current file")
        utils.keymap("n", "<leader>fR", "<cmd>GrugFar<cr>", "Find and replace in project")
    end,
}
