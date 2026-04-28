-- create annotations

return {
    "danymat/neogen",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        require("neogen").setup({
            enabled = true,
            languages = {
                php = {
                    template = {
                        annotation_convention = "phpdoc",
                        types = true,
                    },
                },
            },
        })

        -- mappings
        local keymap = require("extras.utils").keymap

        keymap("n", "<leader>an", function()
            require("neogen").generate()
        end, "Generate annotation")
        keymap("n", "<leader>af", function()
            require("neogen").generate({ type = "func" })
        end, "Annotate function")
        keymap("n", "<leader>ac", function()
            require("neogen").generate({ type = "class" })
        end, "Annotate class")
        keymap("n", "<leader>at", function()
            require("neogen").generate({ type = "type" })
        end, "Annotate type")
        keymap("n", "<leader>aa", function()
            require("neogen").generate({ type = "file" })
        end, "Annotate file")
    end,
}
