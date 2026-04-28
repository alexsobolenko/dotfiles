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
        local keymap = require("extras.utils").keymap
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }

                keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration", opts)
                keymap("n", "gd", vim.lsp.buf.definition, "Go to definition", opts)
                keymap("n", "K", vim.lsp.buf.hover, "LSP hover info", opts)
                keymap("n", "gi", vim.lsp.buf.implementation, "List all implementations", opts)
                keymap("n", "<Leader>lk", vim.lsp.buf.signature_help, "LSP signature help", opts)
                keymap("n", "<Leader>D", vim.lsp.buf.type_definition, "LSP type definition", opts)
                keymap("n", "<Leader>rn", vim.lsp.buf.rename, "LSP rename", opts)
                keymap("n", "<Leader>ca", vim.lsp.buf.code_action, "LSP code actions", opts)
                keymap("n", "<Leader>lf", function()
                    vim.lsp.buf.format({ async = true })
                end, "LSP format", opts)
                keymap("n", "<Leader>lwa", vim.lsp.buf.add_workspace_folder, "Add workspace folder", opts)
                keymap("n", "<Leader>lwr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", opts)
                keymap("n", "<Leader>lwl", function()
                    vim.print(vim.lsp.buf.list_workspace_folders())
                end, "List workspace folders", opts)
                keymap("n", "gr", vim.lsp.buf.references, "LSP list references", opts)
            end,
        })

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
            vim.lsp.enable(server)
        end
    end
}
