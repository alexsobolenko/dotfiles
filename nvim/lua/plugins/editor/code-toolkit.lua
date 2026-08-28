return {
    "alexsobolenko/code-toolkit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local utils = require("extras.utils")
        utils.keymap({ "n", "x" }, "<leader>cc", "<cmd>CodeToolkitToggleCase<cr>", "Toggle case (picker)")
        utils.keymap("n", "<leader>cm", "<cmd>CodeToolkitToggleMultilineExpression<cr>", "Toggle multiline expression")
        utils.keymap({ "n", "x" }, "<M-e>", "<cmd>CodeToolkitFastWrap<cr>", "Fast wrap")
        utils.keymap("n", "<leader>cp", "<cmd>CodeToolkitToggleAutopairs<cr>", "Toggle autopairs")
    end,
}
