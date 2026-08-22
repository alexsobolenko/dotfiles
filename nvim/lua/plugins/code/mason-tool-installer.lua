-- keeps LSP servers up to date and provides a blocking install command
-- (`:MasonToolsInstallSync`) usable from install.sh in headless mode

return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        require("mason-tool-installer").setup({
            -- lspconfig names, translated to mason package names via mason-lspconfig
            ensure_installed = {
                "intelephense",
                "lua_ls",
                "jsonls",
                "yamlls",
                "ts_ls",
                "vue_ls",
                "dockerls",
                "docker_compose_language_service",
            },
        })
    end,
}
