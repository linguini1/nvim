return {
    "lervag/vimtex",
    config = function ()
        vim.cmd("filetype plugin indent on")
        vim.g.vimtex_compiler_method = "pdflatex"
    end
}
