vim.g.mapleader = " "
vim.g.maplocalleader = ","

local utils = require("extras.utils")

local function next_diagnostic()
    vim.diagnostic.jump({ count = 1 })
end

local function prev_diagnostic()
    vim.diagnostic.jump({ count = -1 })
end

utils.keymap("n", "<leader>w", ":w<CR>", "Save buffer")
utils.keymap("n", "<leader>/", ":nohlsearch<CR>", "Reset search highlights")
utils.keymap("n", "<C-d>", "<C-d>zz", "Scroll down, centered")
utils.keymap("n", "<C-u>", "<C-u>zz", "Scroll up, centered")
utils.keymap("n", "n", "nzzzv", "Next search match, centered")
utils.keymap("n", "N", "Nzzzv", "Previous search match, centered")
utils.keymap("n", "<leader>+", "<C-a>", "which_key_ignore")
utils.keymap("n", "<leader>-", "<C-x>", "which_key_ignore")
utils.keymap("n", "]d", next_diagnostic, "Next diagnostic")
utils.keymap("n", "[d", prev_diagnostic, "Previous diagnostic")
utils.keymap("n", "<A-j>", ":m .+1<CR>==", "Move line down")
utils.keymap("n", "<A-k>", ":m .-2<CR>==", "Move line up")
utils.keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
utils.keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
utils.keymap("v", "<", "<gv", "Indent left, keep selection")
utils.keymap("v", ">", ">gv", "Indent right, keep selection")
utils.keymap("n", "Y", "y$", "Yank to end of line")
utils.keymap("x", "<leader>p", [["_dP]], "Paste without overwriting register")
utils.keymap("i", "jj", "<Esc>", "Escape")
