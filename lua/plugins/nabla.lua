return {
    "jbyuki/nabla.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    build = function() vim.cmd("TSInstall latex") end,
    lazy = true,
}
