-- manipulage substitutions

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        local keymap = require("extras.utils").keymap
        substitute.setup()

        -- mappings
        keymap("n", "s", substitute.operator, "Substitute with motion")
        keymap("n", "ss", substitute.line, "Substitute line")
        keymap("n", "S", substitute.eol, "Substitute to end of line")
        keymap("x", "s", substitute.visual, "Substitute in visual mode")
    end,
}
