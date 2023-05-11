local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.black.with({"python"}),
    null_ls.builtins.formatting.isort.with({"python"}),
    null_ls.builtins.formatting.prettierd.with({
        "html", "css", "json", "markdown",
    }),
    null_ls.builtins.formatting.lua_format,
}

null_ls.setup({
    sources = sources,
})
