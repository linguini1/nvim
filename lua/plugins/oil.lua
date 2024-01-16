return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = not vim.g.started_by_firenvim,
    config = function()
        require("oil").setup({ default_file_explorer = true })
        vim.keymap.set("n", "-", "<Cmd>edit .<CR>", { desc = "Open parent directory" })
    end,
}
