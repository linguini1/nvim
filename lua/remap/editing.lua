-- Saving
vim.keymap.set(
    "i",
    "<C-s>",
    "<Esc><Cmd>update<CR>gi",
    { desc = "Save the current buffer and return the cursor to its place." }
)
vim.keymap.set("n", "<leader>w", "<Cmd>update<CR>", { desc = "Update (write) current buffer." })

-- Move highlighted block up and down + autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line(s) downward with correct indentation." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line(s) upward with correct indentation." })

-- Deleting
vim.keymap.set("i", "<C-b>", "<Esc><right>dwgi", { desc = "Delete word in front of cursor." })

-- Formatting
vim.keymap.set(
    "v",
    "<leader>c",
    "<Esc><Cmd>s/\\%V\\<./\\u&/g<CR><Cmd>nohl<CR>gv",
    { desc = "Capitalize the beginning of each selected word." }
)
