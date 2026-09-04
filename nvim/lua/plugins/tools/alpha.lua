-- dashboard

return {
    "goolord/alpha-nvim",
    event = { "VimEnter" },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "echasnovski/mini.icons" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local d = require("extras.dashboard")
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = d.header()
        dashboard.section.buttons.val = d.buttons()
        dashboard.section.footer.val = d.footer()

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

        vim.api.nvim_create_autocmd("BufDelete", {
            callback = function(args)
                local closing_buf = args.buf

                if vim.api.nvim_buf_get_name(closing_buf) == "" then
                    return
                end

                if vim.bo[closing_buf].buftype ~= "" then
                    return
                end

                local buffers = vim.api.nvim_list_bufs()
                local other_valid_buffers = 0

                for _, bufnr in ipairs(buffers) do
                    if bufnr ~= closing_buf and vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == "" then
                        if vim.api.nvim_buf_get_name(bufnr) ~= "" then
                            other_valid_buffers = other_valid_buffers + 1
                        end
                    end
                end

                if other_valid_buffers == 0 then
                    vim.cmd("Alpha")
                end
            end,
        })
    end,
}
