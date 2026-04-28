vim.cmd([[
    augroup CursorHighlight
        autocmd!
        autocmd InsertEnter * set cul
        autocmd InsertLeave * set nocul
    augroup END

    highlight Cursor guifg=NONE guibg=#FAFAFA
]])

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local excluded_filetypes = {
            diff = true,
            gitcommit = true,
            markdown = true,
        }

        if vim.bo.buftype ~= "" or excluded_filetypes[vim.bo.filetype] then
            return
        end

        vim.cmd([[keeppatterns %s/\s\+$//e]])
    end,
})

vim.cmd([[highlight IblScope guifg=#ff0000]])
