local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.black.with({ extra_args = { "--line-length=120" } }),
    formatting.prettierd.with({
        filetypes = { "html", "css", "json", "markdown", }
    }),
    diagnostics.flake8.with({extra_args = {"--max-line-length", "120", "--ignore=E203"}})
}

null_ls.setup({
    debug = true,
    sources = sources,
})

vim.keymap.set("n", "gq", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", {desc = "Format the current buffer."})
