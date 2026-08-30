local icons = require("extras.icons")

vim.cmd("syntax on")

vim.o.title = true
vim.o.titlestring = "neovim - %{fnamemodify(getcwd(), ':t')}"
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.did_load_filetypes = 1
vim.opt.formatoptions = "qrn1"
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
vim.opt.mouse = "a"
vim.opt.mousefocus = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("c")
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.fillchars = icons.fillchars
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.langremap = false
vim.opt.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,ё`,Ё~"
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostic_signs.error,
            [vim.diagnostic.severity.WARN] = icons.diagnostic_signs.warn,
            [vim.diagnostic.severity.INFO] = icons.diagnostic_signs.info,
            [vim.diagnostic.severity.HINT] = icons.diagnostic_signs.hint,
        },
    },
})

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])
