return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = function() vim.cmd("silent! TSUpdate") end,
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({})
            ts.install({
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
            })

            -- Enable treesitter highlighting on all files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    local ft = vim.bo.filetype
                    if ft and ft ~= "" then pcall(vim.treesitter.start) end
                end,
            })

            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

            -- Custom TO DO highlight
            vim.api.nvim_set_hl(0, "@text.todo", { link = "GruvboxRed" })
        end,
    },
}
