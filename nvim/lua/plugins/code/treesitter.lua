-- syntax highlights

local parsers = {
    "bash",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "editorconfig",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "graphql",
    "html",
    "ini",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "nginx",
    "php",
    "php_only",
    "phpdoc",
    "regex",
    "scss",
    "sql",
    "tsx",
    "typescript",
    "twig",
    "vim",
    "vue",
    "xml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                pcall(vim.treesitter.start)
                pcall(function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end)
            end,
        })
    end,
}
