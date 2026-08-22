-- highlight and search for todo comments

return {
    "folke/todo-comments.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufRead" },
}
