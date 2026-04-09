local icons = require("extras.icons")
local utils = require("extras.utils")

vim.cmd("syntax on")
vim.g.nvim_theme = utils.setup_theme()

vim.o.title = true
vim.o.titlestring = "neovim - %{fnamemodify(getcwd(), ':t')}"

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/zsh"
vim.opt.termguicolors = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"

-- Fillchars
vim.opt.fillchars = icons.fillchars

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

local signs = {
    Error = icons.diagnostic_signs.error,
    Warn = icons.diagnostic_signs.warn,
    Info = icons.diagnostic_signs.info,
    Hint = icons.diagnostic_signs.hint,
}
for type, icon in pairs(signs) do
    local sign = "DiagnosticSign" .. type
    vim.fn.sign_define(sign, { text = icon, texthl = sign })
end

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])
