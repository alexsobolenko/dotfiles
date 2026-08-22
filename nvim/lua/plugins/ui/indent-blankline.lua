-- adds indentation guides

local icons = require("extras.icons")

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = {
            char = icons.indent.blankline,
        },
    },
}
