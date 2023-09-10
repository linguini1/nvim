return {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    enabled = not vim.g.started_by_firenvim,
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_refresh_slow = 1
    end,
    ft = { "markdown" },
}
