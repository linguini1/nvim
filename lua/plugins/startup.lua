return {
    "startup-nvim/startup.nvim",
    enabled = not vim.g.started_by_firenvim,
    config = function()
        local recorded_cc_setting = vim.opt.colorcolumn:get()
        local cc_group = vim.api.nvim_create_augroup("startup-cc", { clear = true })

        -- Remove colorcolumn in startup buffer
        vim.api.nvim_create_autocmd({ "FileType" }, {
            group = cc_group,
            pattern = {},
            callback = function(opts)
                if vim.bo[opts.buf].filetype == "startup" then
                    recorded_cc_setting = vim.opt.colorcolumn:get()
                    vim.opt.colorcolumn = "0"
                end
            end,
        })

        -- Add colorcolumn back when startup is exited
        vim.api.nvim_create_autocmd({ "BufDelete" }, {
            group = cc_group,
            pattern = {},
            callback = function(opts)
                if vim.bo[opts.buf].filetype == "startup" then vim.opt.colorcolumn = recorded_cc_setting end
            end,
        })

        require("startup").setup({ theme = "linguini" })
    end,
}
