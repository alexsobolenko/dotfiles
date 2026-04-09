-- breadcrumbs

return {
    "Bekaboo/dropbar.nvim",
    config = function()
        local dropbar_api = require("dropbar.api")

        -- mappings
        vim.keymap.set("n", "<leader>;", dropbar_api.pick, {
            desc = "Pick symbols in winbar",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "[;", dropbar_api.goto_context_start, {
            desc = "Go to start of current context",
            noremap = true,
            silent = true,
        })
        vim.keymap.set("n", "];", dropbar_api.select_next_context, {
            desc = "Select next context",
            noremap = true,
            silent = true,
        })
    end,
}
