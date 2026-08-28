-- extra config for lsp ts_ls

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
