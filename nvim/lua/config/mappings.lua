vim.g.mapleader = " "

-- save / search
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Reset search highlights" })

-- keep the cursor centered when scrolling half a page or jumping between search matches
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match, centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match, centered" })

-- numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- diagnostics
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

-- move the current line / selection up and down, reindenting as it moves
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- indent visual selection without losing it (default `<`/`>` exit visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left, keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right, keep selection" })

-- yank / paste
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
-- delete the replaced selection into the black hole register so the paste
-- register (what you copied before) survives for the next paste
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
