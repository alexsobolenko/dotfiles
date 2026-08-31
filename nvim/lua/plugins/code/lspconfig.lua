--- LSP

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local utils = require("extras.utils")

        local scan = require("plenary.scandir")
        local files = scan.scan_dir(vim.fn.stdpath("config") .. "/lua/extras/lspconfig", {
            depth = 1,
            search_pattern = "%.lua$",
        })

        for _, file in ipairs(files) do
            local server = file:match("([^/]+)%.lua$")
            local config = require("extras.lspconfig." .. server)
            config.capabilities = capabilities
            vim.lsp.config(server, config)
        end

        utils.keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        utils.keymap("n", "K", vim.lsp.buf.hover, "LSP hover info")
        utils.keymap("n", "gi", vim.lsp.buf.implementation, "List all implementations")
        utils.keymap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "LSP signature help")

        -- force intelephense clear cache
        local function clear_intelephense_cache()
            for _, client in ipairs(vim.lsp.get_clients({ name = "intelephense" })) do
                client:stop(true)
            end
            vim.fn.delete(vim.fn.expand("~/.config/intelephense"), "rf")
            vim.notify("Intelephense cache cleared, restarting...", vim.log.levels.INFO)
            vim.defer_fn(function()
                vim.cmd("edit")
            end, 500)
        end

        vim.api.nvim_create_user_command("IntelephenseClearCache", clear_intelephense_cache, {})
        utils.keymap("n", "<leader>ic", clear_intelephense_cache, "Clear intelephense cache")
    end
}

