-- manipulage substitutions

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        substitute.setup()

        -- mappings
        vim.keymap.set("n", "s", substitute.operator, {
            desc = "Substitute with notion",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "ss", substitute.line, {
            desc = "Substitute line",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "S", substitute.eol, {
            desc = "Substitute to end of line",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("x", "s", substitute.visual, {
            desc = "Substitute in visual mode",
            noremap = true,
            silent = true,
        })
    end,
}
