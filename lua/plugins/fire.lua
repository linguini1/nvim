return {
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    build = ":call firenvim#install(0)",

    config = function()
        -- Don't start firenvim for any website in this list
        local ignored_sites = {
            "https://www\\.keybr\\.com",
            "https://www\\.desmos\\.com",
        }

        -- This object is what gets assigned to localSettings in the firenvim configuration
        local settings = {
            [".*"] = {
                cmdline = "neovim",
                content = "text",
                priority = 0,
                selector = 'textarea:not([readonly], [aria-readonly], [type="search"])',
                takeover = "always",
            },
        }

        -- Add ignored sites to configuration with a higher priority than the firenvim takeover rules
        for _, site in ipairs(ignored_sites) do
            settings[site] = {
                takeover = "never",
                priority = 1,
            }
        end

        -- Set configuration
        vim.g.firenvim_config = {
            globalSettings = { alt = "all" },
            localSettings = settings,
        }

        if vim.g.started_by_firenvim then
            -- Set certain website entry boxes to be markdown
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                pattern = { "github.com_*.txt", "neovim.discourse.*.txt" },
                command = "set filetype=markdown",
            })
        end
    end,
}
