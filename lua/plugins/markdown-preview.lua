return {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_refresh_slow = 1
    end,
    ft = { "markdown" },
}
