-- manipulage substitutions

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local utils = require("extras.utils")
        local exchange = require("substitute.exchange")
        local substitute = require("substitute")
        substitute.setup()

        utils.keymap("n", "s", substitute.operator, "Substitute with motion")
        utils.keymap("n", "ss", substitute.line, "Substitute line")
        utils.keymap("n", "S", substitute.eol, "Substitute to end of line")
        utils.keymap("x", "s", substitute.visual, "Substitute in visual mode")
        utils.keymap("n", "sx", exchange.operator, "Exchange with motion")
        utils.keymap("n", "sxx", exchange.line, "Exchange line")
        utils.keymap("x", "X", exchange.visual, "Exchange in visual mode")
        utils.keymap("n", "sxc", exchange.cancel, "Cancel exchange")
    end,
}
