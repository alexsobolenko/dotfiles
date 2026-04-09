-- performant lsp progress statuse

return {
    "linrongbin16/lsp-progress.nvim",
    config = function()
        local icons = require("extras.icons")
        require("lsp-progress").setup({
            display_components = {
                "lsp_client_name",
                "spinner",
                "message",
            },
            separators = {
                component = " ",
                progress = " | ",
                percentage = { pre = "", post = "%% " },
                title = { pre = "", post = ": " },
                lsp_client_name = { pre = "[", post = "]" },
                spinner = { pre = "", post = "" },
                message = {
                    commenced = "In Progress",
                    completed = "Completed",
                },
            },
            timer = {
                spinner = 100,
                progress_enddelay = 300,
                progress_debounced = 100,
            },
            spinner_symbols = icons.statusbar.lsp_progress,
        })
    end,
}
