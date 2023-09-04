return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")
        gs.setup()

        vim.keymap.set("n", "<C-b>", gs.blame_line, { desc = "Git blame on current line." })
        vim.opt.signcolumn = "yes"
    end,
}
