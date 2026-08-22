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
        if vim.bo.filetype ~= "markdown" then
            vim.cmd([[%s/\s\+$//e]])
        end
    end,
})

vim.cmd([[highlight IblScope guifg=#ff0000]])

vim.filetype.add({
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
    },
    pattern = {
        ["docker%-compose%..*%.ya?ml"] = "yaml.docker-compose",
        ["compose%..*%.ya?ml"] = "yaml.docker-compose",
    },
})
