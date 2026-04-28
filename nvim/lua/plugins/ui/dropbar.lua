-- breadcrumbs

return {
    "Bekaboo/dropbar.nvim",
    config = function()
        local dropbar_api = require("dropbar.api")
        local keymap = require("extras.utils").keymap

        -- mappings
        keymap("n", "<leader>;", dropbar_api.pick, "Pick symbols in winbar")
        keymap("n", "[;", dropbar_api.goto_context_start, "Go to start of current context")
        keymap("n", "];", dropbar_api.select_next_context, "Select next context")
    end,
}
