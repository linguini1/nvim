return {
    "lervag/vimtex",
    ft = { "latex", "tex" },
    config = function()
        vim.cmd("filetype plugin indent on")
        vim.g.vimtex_compiler_method = "pdflatex"
        vim.g.vimtex_quickfix_enabled = 0
    end,
}
