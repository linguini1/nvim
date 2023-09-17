return {
    "lervag/vimtex",
    ft = "latex",
    config = function ()
        vim.cmd("filetype plugin indent on")
        vim.g.vimtex_compiler_method = "pdlatex"
    end
}
