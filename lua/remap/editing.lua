-- Saving
vim.keymap.set("i", "<C-s>", "<Esc><Cmd>update<CR>gi", {desc = "Save the current buffer and return the cursor to its place."})
vim.keymap.set("n", "<C-s>", "<Cmd>update<CR>", {desc = "Save the current buffer."})

-- Move highlighted block up and down + autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move line(s) downward with correct indentation."})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move line(s) upward with correct indentation."})
