-- Quick window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Jump to left adjacent window." })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Jump to bottom adjacent window." })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Jump to top adjacent window." })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Jump to right adjacent window." })

-- Code folds
local function toggle_fold()
   local lnum, col = vim.api.nvim_win_get_cursor(0)
   local cursor_on_fold = vim.fn.foldclosed(lnum)
   if cursor_on_fold == -1 then
       vim.fn.expand("zc")
   else
       vim.fn.expand("zo")
   end
end
vim.keymap.set("n", "<CR>", toggle_fold, {desc = "Toggle fold open/close."})
