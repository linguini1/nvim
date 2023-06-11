vim.g.mapleader = " " -- Leader key

local options = {
    nu = true,   -- Line numbers
    rnu = true,  -- Relative line numbers
    tabstop = 4, -- 4 space indents
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,   -- auto-indent
    wrap = false,         -- No line wrapping
    incsearch = true,     -- Allows for incremental search (allows stuff like vim.* for lots of matching)
    hlsearch = true,      -- Search highlighting
    termguicolors = true, -- Change terminal colours to match GUI
    autowrite = true,     -- File save
    autowriteall = true,
    autoindent = true,
    fillchars = {
        eob = " ",
    },
    scrolloff = 10,
    colorcolumn = "120",
    foldmethod = "expr",
    foldlevel = 99,
    foldexpr = "nvim_treesitter#foldexpr()",
    syntax = "false",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
})
