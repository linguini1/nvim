vim.g.mapleader = " " -- Leader key

vim.opt.nu = true -- Line numbers
vim.opt.rnu = true -- Relative line numbers
vim.opt.tabstop = 4 -- 4 space indents
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true -- auto-indent
vim.opt.wrap = false -- No line wrapping
vim.opt.incsearch = true -- Allows for incremental search (allows stuff like vim.* for lots of matching)
vim.opt.hlsearch = true -- Search highlighting
vim.opt.termguicolors = true -- Change terminal colours to match GUI
vim.opt.background = "dark"
vim.opt.autowrite = true -- File save
vim.opt.autowriteall = true
vim.opt.autoindent = true
vim.opt.fillchars = {
    eob = " ",
}
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "120"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.syntax = "false"
vim.opt.titlestring = '%{expand("%:p")}'
vim.opt.spell = true
vim.opt.spelllang = "en_ca"
vim.opt.spellsuggest = "5"

-- Use Powershell as the terminal emulator on Windows by default
if vim.loop.os_uname().sysname == "Windows_NT" then vim.opt.shell = "powershell.exe" end
