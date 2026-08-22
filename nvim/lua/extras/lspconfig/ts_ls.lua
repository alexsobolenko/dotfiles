-- extra config for lsp ts_ls
-- default cmd/root_dir come from nvim-lspconfig's bundled config.
-- If the project has @vue/typescript-plugin (Volar hybrid mode), wire it in so
-- ts_ls provides TypeScript support inside <script> blocks of .vue files.

local vue_typescript_plugin = vim.fs.find("node_modules/@vue/typescript-plugin", { upward = true })[1]

if not vue_typescript_plugin then
    return {}
end

return {
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
    },
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_typescript_plugin,
                languages = { "vue" },
            },
        },
    },
}
