return {
    "ta-tikoma/php.easy.nvim",
    dependencies = {
        { "L3MON4D3/LuaSnip" },
    },
    keys = {
        { "-b", ":PHPEasyDocBlock<CR>", ft = "php", mode = "n", desc = "PHP create empty docblock" },
        { "--i", ":PHPEasyInitInterface<CR>", ft = "php", mode = "n", desc = "PHP init interface" },
        { "--c", ":PHPEasyInitClass<CR>", ft = "php", mode = "n", desc = "PHP init class" },
        { "--ac", ":PHPEasyInitAbstractClass<CR>", ft = "php", mode = "n", desc = "PHP init abstract class" },
        { "--t", ":PHPEasyInitTrait<CR>", ft = "php", mode = "n", desc = "PHP init trait" },
        { "--e", ":PHPEasyInitEnum<CR>", ft = "php", mode = "n", desc = "PHP init enum" },
        { "__", ":PHPEasyAppendConstruct<CR>", ft = "php", mode = "n", desc = "PHP init empty constructor" },
    },
    opts = {
        onAppend = {
            engine = "LuaSnip",
        },
    },
}
