local gs = require("gitsigns")
gs.setup()

vim.keymap.set("n", "<leader>gbl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git blame on current line." })
