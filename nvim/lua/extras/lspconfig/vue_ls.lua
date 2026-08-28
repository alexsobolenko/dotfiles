-- extra config for lsp vue_ls

local util = require("lspconfig.util")

return {
    cmd = { "vue-language-server", "--stdio" },
    filetypes = { "vue" },
    root_dir = util.root_pattern("package.json"),
    init_options = {
        typescript = {
            tsdk = "",
        },
    },
    on_new_config = function(new_config, new_root_dir)
        if
            new_config.init_options
            and new_config.init_options.typescript
            and new_config.init_options.typescript.tsdk == ""
        then
            new_config.init_options.typescript.tsdk = util.get_typescript_server_path(new_root_dir)
        end
    end,
}
