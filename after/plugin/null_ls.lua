local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.black.with({ extra_args = { "--line-length=120" } }),
	formatting.prettierd.with({
		filetypes = { "html", "css", "json", "markdown", "javascriptreact", "javascript" },
	}),
	formatting.stylua,
	formatting.clang_format.with({
		filetypes = { "c", "c++" },
		extra_args = { "-style={IndentWidth: 4, ColumnLimit: 120, AllowShortIfStatementsOnASingleLine: true}" },
	}),
	diagnostics.flake8.with({ extra_args = { "--max-line-length", "120", "--ignore=E203" } }),
	diagnostics.eslint,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
