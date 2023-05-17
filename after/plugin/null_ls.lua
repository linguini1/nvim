local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.black.with({ extra_args = { "--line-length=120" } }),
    null_ls.builtins.formatting.prettierd.with({
        filetypes = { "html", "css", "json", "markdown", }
    }),
}

null_ls.setup({ sources = sources })

vim.keymap.set("n", "<leader>fo", "<Cmd>lua vim.lsp.buf.format({async = True})<CR>", {
    desc = "Format the current buffer."
})
