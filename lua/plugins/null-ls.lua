local DO_NOT_FORMAT = { "norg", "text" }

--- Determines whether null-ls should format the file
--- @param filetype string The filetype of the current buffer
--- @return boolean format_it True if null-ls should format the file, false otherwise
local function should_be_formatted(filetype)
    for _, ft in ipairs(DO_NOT_FORMAT) do
        if ft == filetype then return false end
    end
    return true
end

return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        local sources = {
            formatting.black.with({ extra_args = { "--line-length=120" } }),
            formatting.prettier.with({
                filetypes = { "html", "css", "javascriptreact", "javascript" },
                extra_filetypes = { "json", "yaml", "markdown" },
                extra_args = { "--print-width", "120" },
            }),
            formatting.stylua.with({ extra_args = { "--indent-type=Spaces" } }),
            formatting.clang_format.with({
                filetypes = { "c", "cpp" },
            }),
            formatting.latexindent.with({
                extra_args = { "-m", "-l" },
            }),
            diagnostics.flake8.with({ extra_args = { "--max-line-length", "120", "--ignore=E203" } }),
            diagnostics.eslint,
            code_actions.gitsigns,
        }

        null_ls.setup({
            debug = true,
            sources = sources,
            should_attach = function() return should_be_formatted(vim.bo.filetype) end,
            on_attach = function()
                vim.keymap.set(
                    "n",
                    "gq",
                    function() vim.lsp.buf.format({ async = true }) end,
                    { buffer = 0, desc = "Format buffer." }
                )
            end,
        })
    end,
}
