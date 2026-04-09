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
    command = [[%s/\s\+$//e]],
})

vim.cmd([[highlight IblScope guifg=#ff0000]])
