-- Ctrl + s to save
vim.keymap.set("i", "<C-s>", "<Esc>:update<cr>gi") -- save without exiting insert mode
vim.keymap.set("n", "<C-s>", ":update<cr>") -- save in normal mode

-- Move highlighted block up and down + autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
