return {
    "lervag/vimtex",
    ft = { "latex", "tex" },
    config = function()
        vim.cmd("filetype plugin indent on")
        if vim.loop.os_uname().sysname == "Linux" then vim.g.vimtex_view_method = "zathura" end
        vim.g.vimtex_compiler_method = "pdflatex"
        vim.g.vimtex_quickfix_enabled = 0
        vim.g.vimtex_view_forward_search_on_start = 0
    end,
}
