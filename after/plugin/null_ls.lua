local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
    formatting.black.with({ extra_args = { "--line-length=120" } }),
    formatting.prettierd.with({
        filetypes = { "html", "css", "json", "markdown", }
    }),
}

null_ls.setup({
    debug = true,
    sources = sources,
})

vim.keymap.set("n", "gq", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", {desc = "Format the current buffer."})
