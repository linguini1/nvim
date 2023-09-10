return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = not vim.g.started_by_firenvim,
    config = function()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true

        -- Cursor on first letter of file name during navigation
        require("nvim-tree").setup({ hijack_cursor = true })

        -- Tree commands
        vim.keymap.set("n", "<leader>tt", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree." })
        vim.keymap.set("n", "<leader>tf", "<Cmd>NvimTreeFocus<CR>", { desc = "Bring cursor to file tree." })
        vim.keymap.set("n", "<leader>tr", "<Cmd>NvimTreeRefresh<CR>", { desc = "Refresh the file tree." })
    end,
}
