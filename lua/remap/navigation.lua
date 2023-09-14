-- Quick window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Jump to left adjacent window." })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Jump to bottom adjacent window." })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Jump to top adjacent window." })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Jump to right adjacent window." })

-- Center scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up with cursor centered." })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down with cursor centered." })
