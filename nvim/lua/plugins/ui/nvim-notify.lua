-- notifications

return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader>nd",
            ":lua vim.notify('', vim.log.levels.DEBUG, { title = 'Dismiss', timeout = 0 })<CR>",
            desc = "Dismiss all notifications",
        },
        {
            "<leader>nh",
            ":Telescope notify<CR>",
            desc = "Notifications history",
        },
    },
    opts = {
        stages = "fade_in_slide_out",
        animate = true,
        render = "compact",
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
    },
    init = function()
        vim.notify = require("notify")
    end,
}
