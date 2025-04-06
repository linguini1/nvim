return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                tex = { "latexindent" },
            },
            formatters = {
                latexindent = {
                    prepend_args = { "-m", "-l" },
                },
                prettier = {
                    prepend_args = { "--print-width", "120" },
                },
                black = {
                    prepend_args = { "--line-length=120" },
                },
            },
        })
    end,
}
