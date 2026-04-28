return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "intelephense",
                "lua_ls",
                "jsonls",
                "yamlls",
            },
            automatic_enable = false,
        })
    end
}
