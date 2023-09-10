return {
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    build = function() vim.fn["firenvim#install"](0) end,
    config = function()
        vim.g.firenvim_config = {
            globalSettings = { alt = "all" },
            localSettings = {
                [".*"] = {
                    cmdline = "neovim",
                    content = "text",
                    priority = 0,
                    selector = 'textarea:not([readonly], [aria-readonly], [type="search"])',
                    takeover = "always",
                },
            },
        }

        -- Set GitHub entry boxes to be markdown
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = { "github.com_*.txt", "neovim.discourse.*.txt" },
            command = "set filetype=markdown",
        })
    end,
}
