return {
    "alexsobolenko/php-tools.nvim",
    ft = "php",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
        { "lumiliet/vim-twig", ft = "twig" },
        { "jwalton512/vim-blade", ft = "blade" },
    },
    config = function()
        require("php-tools").setup({})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "php",
            callback = function(event)
                local function map(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, {
                        buffer = event.buf,
                        desc = desc,
                        noremap = true,
                        silent = true,
                    })
                end

                map("<leader>pb", "<cmd>PhpToolsInsertGetterSetter<cr>", "Insert getter and setter")
                map("<leader>pB", "<cmd>PhpToolsInsertGetterSetterMaster<cr>", "Insert getters and setters (select)")
                map("<leader>pf", "<cmd>PhpToolsGenerateFabric<cr>", "Generate class/interface/trait/enum")
                map("<leader>pd", "<cmd>PhpToolsGeneratePhpDoc<cr>", "Generate PHPDoc")
                map("<leader>pD", "<cmd>PhpToolsGeneratePhpDocMaster<cr>", "Generate PHPDoc (select)")
                map("<leader>pn", "<cmd>PhpToolsGenerateConstructor<cr>", "Generate constructor")
                map("<leader>pc", "<cmd>PhpToolsConvertStringToConcatenation<cr>", "Convert string: concatenation")
                map("<leader>ps", "<cmd>PhpToolsConvertStringToSprintf<cr>", "Convert string: sprintf")
                map("<leader>pi", "<cmd>PhpToolsConvertStringToInterpolation<cr>", "Convert string: interpolation")
                map("<leader>pt", "<cmd>PhpToolsSymfonyGoto<cr>", "Symfony: smart goto")
                map("<leader>py", "<cmd>PhpToolsYii2Goto<cr>", "Yii2: smart goto")
            end,
        })
    end,
}
