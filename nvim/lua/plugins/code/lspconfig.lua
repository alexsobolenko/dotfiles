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

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover info" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "List all implementations" })
        vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
    end
}

