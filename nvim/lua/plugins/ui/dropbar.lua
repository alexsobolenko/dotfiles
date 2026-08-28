-- breadcrumbs

return {
    "Bekaboo/dropbar.nvim",
    config = function()
        local utils = require("extras.utils")
        local dropbar_api = require("dropbar.api")

        utils.keymap("n", "<leader>;", dropbar_api.pick, "Pick symbols in winbar")
        utils.keymap("n", "[;", dropbar_api.goto_context_start, "Go to start of current context")
        utils.keymap("n", "];", dropbar_api.select_next_context, "Select next context")
    end,
}
