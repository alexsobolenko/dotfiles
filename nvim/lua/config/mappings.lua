vim.g.mapleader = " "

local keymap = require("extras.utils").keymap

keymap("n", "<c-k>", "<cmd>wincmd k<CR>", "Move up")
keymap("n", "<c-j>", "<cmd>wincmd j<CR>", "Move down")
keymap("n", "<c-h>", "<cmd>wincmd h<CR>", "Move left")
keymap("n", "<c-l>", "<cmd>wincmd l<CR>", "Move right")
keymap("n", "|", "<cmd>vsplit<CR>", "Split vertical")
keymap("n", "\\", "<cmd>split<CR>", "Split horizontal")
keymap("n", "<leader>w", "<cmd>w<CR>", "Save buffer")
keymap("i", "jj", "<Esc>", "Escape")
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", "Reset search highlights")
keymap("n", "<leader>+", "<C-a>", "Increment number")
keymap("n", "<leader>-", "<C-x>", "Decrement number")

keymap("n", "<leader>do", vim.diagnostic.open_float, "Show diagnostic")
keymap("n", "<leader>dl", vim.diagnostic.setloclist, "Diagnostics location list")
keymap("n", "<leader>dq", vim.diagnostic.setqflist, "Diagnostics quickfix")
keymap("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, "Next diagnostic")
keymap("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, "Previous diagnostic")

keymap("n", "<leader>li", "<cmd>LspInfo<CR>", "LSP info")
keymap("n", "<leader>ll", "<cmd>LspStart<CR>", "LSP start")
keymap("n", "<leader>lR", "<cmd>LspRestart<CR>", "LSP restart")
keymap("n", "<leader>lx", "<cmd>LspStop<CR>", "LSP stop")
