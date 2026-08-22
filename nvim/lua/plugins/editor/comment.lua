-- comments tools

return {
    "numToStr/Comment.nvim",
    dependencies = {
        -- picks the right commentstring by cursor position, e.g. in .vue files
        -- (<template>/<script>/<style> each use different comment syntax) and tsx/jsx
        { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    config = function()
        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
}
