return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() vim.cmd("silent! TSUpdate") end,
        config = function()
            require("nvim-treesitter.install").compilers = { "gcc" }
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "c",
                    "cpp",
                    "make",
                    "python",
                    "vim",
                    "vimdoc",
                    "query",
                    "rust",
                    "javascript",
                    "css",
                    "html",
                    "json",
                    "markdown",
                    "markdown_inline",
                    "comment",
                    "latex",
                    "bash",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                playground = { enable = true },
            })

            -- Custom TO DO highlight
            vim.api.nvim_set_hl(0, "@text.todo", { link = "GruvboxRed" })
        end,
    },
    { "nvim-treesitter/playground" },
}
