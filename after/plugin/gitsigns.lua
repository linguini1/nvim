local gs = require("gitsigns")
gs.setup({
    word_diff = true,
})

vim.keymap.set("n", "<leader>gbl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git blame on current line." })
