return {
    "alexsobolenko/code-toolkit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- mappings
        vim.keymap.set({ "n", "x" }, "<leader>cc", "<cmd>CodeToolkitToggleCase<cr>", {
            desc = "Toggle case (picker)",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "<leader>cm", "<cmd>CodeToolkitToggleMultilineExpression<cr>", {
            desc = "Toggle multiline expression",
            noremap = true,
            silent = true
        })
    end,
}
