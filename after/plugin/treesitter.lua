require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "cpp",
        "rust",
        "javascript",
        "css",
        "html",
        "json",
        "markdown",
        "comment",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

-- Custom TO DO highlight
vim.api.nvim_set_hl(0, "@text.todo", { link = "GruvboxRed" })
