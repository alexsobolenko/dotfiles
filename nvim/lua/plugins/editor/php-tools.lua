return {
    "alexsobolenko/php-tools.nvim",
    ft = "php",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
        { "lumiliet/vim-twig", ft = "twig" },
        { "jwalton512/vim-blade", ft = "blade" },
    },
    config = function()
        local utils = require("extras.utils")
        require("php-tools").setup()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "php",
            callback = function(event)
                utils.keymap("n", "<leader>pb", "<cmd>PhpToolsInsertGetterSetter<cr>", "Insert getter and setter", {}, event.buf)
                utils.keymap("n", "<leader>pB", "<cmd>PhpToolsInsertGetterSetterMaster<cr>", "Insert getters and setters (select)", {}, event.buf)
                utils.keymap("n", "<leader>pf", "<cmd>PhpToolsGenerateFabric<cr>", "Generate class/interface/trait/enum", {}, event.buf)
                utils.keymap("n", "<leader>pd", "<cmd>PhpToolsGeneratePhpDoc<cr>", "Generate PHPDoc", {}, event.buf)
                utils.keymap("n", "<leader>pD", "<cmd>PhpToolsGeneratePhpDocMaster<cr>", "Generate PHPDoc (select)", {}, event.buf)
                utils.keymap("n", "<leader>pn", "<cmd>PhpToolsGenerateConstructor<cr>", "Generate constructor", {}, event.buf)
                utils.keymap("n", "<leader>pc", "<cmd>PhpToolsConvertStringToConcatenation<cr>", "Convert string: concatenation", {}, event.buf)
                utils.keymap("n", "<leader>ps", "<cmd>PhpToolsConvertStringToSprintf<cr>", "Convert string: sprintf", {}, event.buf)
                utils.keymap("n", "<leader>pi", "<cmd>PhpToolsConvertStringToInterpolation<cr>", "Convert string: interpolation", {}, event.buf)
                utils.keymap("n", "<leader>pt", "<cmd>PhpToolsSymfonyGoto<cr>", "Symfony: smart goto", {}, event.buf)
                utils.keymap("n", "<leader>py", "<cmd>PhpToolsYii2Goto<cr>", "Yii2: smart goto", {}, event.buf)
            end,
        })
    end,
}
