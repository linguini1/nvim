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
vim.opt.textwidth = 120
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.syntax = "false"
vim.opt.titlestring = '%{expand("%:p")}'
vim.opt.spell = true
vim.opt.spelllang = "en_ca"
vim.opt.spellsuggest = "5"

-- Windows specific settings
if vim.loop.os_uname().sysname == "Windows_NT" then
    -- Use Powershell as the terminal emulator on Windows by default
    vim.opt.shell = "powershell.exe"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
    vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
    vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"

    vim.opt.keywordprg = ":help" -- Never use :Man as the keywordprg on Windows
end

if vim.g.started_by_firenvim then vim.opt.wrap = true end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "kconfig",
    callback = function() vim.opt_local.expandtab = false end,
    desc = "Use tabs instead of spaces in Kconfig files to conform to NuttX standards",
})
