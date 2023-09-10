return {
    "jbyuki/nabla.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = function() vim.cmd("TSInstall latex") end,
    lazy = true,
}
