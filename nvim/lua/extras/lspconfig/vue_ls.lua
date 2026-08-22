-- extra config for lsp vue_ls
-- mason-registry already renamed the vue-language-server package's lspconfig
-- id from "volar" to "vue_ls", but nvim-lspconfig doesn't ship a bundled
-- configs/vue_ls.lua yet (checked github.com/neovim/nvim-lspconfig master),
-- so the default_config is defined here in full, copied from lspconfig's own
-- (still-shipped) configs/volar.lua.
-- Runs in hybrid mode (default): vue_ls handles templates/CSS, ts_ls (with the
-- @vue/typescript-plugin, see extras/lspconfig/ts_ls.lua) handles <script> TS.

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
