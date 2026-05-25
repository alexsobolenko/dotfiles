return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip", },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            luasnip.config.setup({})
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.filetype.add({
                filename = {
                    ["compose.yaml"] = "yaml.docker-compose",
                    ["compose.yml"] = "yaml.docker-compose",
                    ["docker-compose.yaml"] = "yaml.docker-compose",
                    ["docker-compose.yml"] = "yaml.docker-compose",
                    ["nginx.conf"] = "nginx",
                },
                pattern = {
                    [".*/nginx/.*%.conf"] = "nginx",
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
                        buffer = event.buf,
                        desc = "LSP hover info",
                        silent = true,
                    })
                    vim.keymap.set("n", "<Leader>lk", vim.lsp.buf.signature_help, {
                        buffer = event.buf,
                        desc = "LSP signature help",
                        silent = true,
                    })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
                        buffer = event.buf,
                        desc = "LSP list references",
                        silent = true,
                    })
                end,
            })

            local servers = {
                bashls = {},
                docker_compose_language_service = {},
                dockerls = {},
                jsonls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                nginx_language_server = {},
                taplo = {},
                yamlls = {},
            }

            for server, config in pairs(servers) do
                config = vim.tbl_deep_extend("force", config, {
                    capabilities = capabilities,
                })
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "docker_compose_language_service",
                    "dockerls",
                    "jsonls",
                    "lua_ls",
                    "nginx_language_server",
                    "taplo",
                    "yamlls",
                },
                automatic_enable = false,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "csv",
                    "diff",
                    "dockerfile",
                    "editorconfig",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "ini",
                    "json",
                    "json5",
                    "jsonc",
                    "lua",
                    "luadoc",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "nginx",
                    "toml",
                    "vim",
                    "xml",
                    "yaml",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
            })
        end,
    },
}
