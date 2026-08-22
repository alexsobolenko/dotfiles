-- manipulage substitutions

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        substitute.setup()

        -- mappings
        vim.keymap.set("n", "s", substitute.operator, {
            desc = "Substitute with motion",
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

        -- exchange: mark two pieces of text (with the same mapping) to swap them
        local exchange = require("substitute.exchange")
        vim.keymap.set("n", "sx", exchange.operator, {
            desc = "Exchange with motion",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "sxx", exchange.line, {
            desc = "Exchange line",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("x", "X", exchange.visual, {
            desc = "Exchange in visual mode",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "sxc", exchange.cancel, {
            desc = "Cancel exchange",
            noremap = true,
            silent = true,
        })
    end,
}
