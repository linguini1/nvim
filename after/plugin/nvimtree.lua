-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
    hijack_cursor = true, -- Cursor on first letter of fname during nav
})

-- Tree commands
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tff", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>")
