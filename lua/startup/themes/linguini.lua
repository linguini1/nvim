local settings = {
    header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 3,
        content = require("startup.custom_headers").conway,
        highlight = "@variable",
        oldfiles_amount = 0,
    },
    clock = {
        type = "text",
        content = function()
            local time = "" .. os.date("%H:%M")
            local date = "" .. os.date("%Y-%m-%d")
            return { date, time }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 3,
        highlight = "@variable",
    },
    statistics = {
        type = "text",
        content = function()
            local lazy_stats = require("lazy").stats()
            local nvim_vers = string.match(vim.api.nvim_cmd({ cmd = "version" }, { output = true }), "NVIM v%d%.%d%.%d")
            local os = "OS: " .. vim.loop.os_uname().sysname
            return {
                nvim_vers,
                os,
                string.format("Total plugins: %d", lazy_stats.count),
                string.format("Plugins loaded: %d", lazy_stats.loaded),
                string.format("Startup time: %fms", lazy_stats.startuptime),
            }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 3,
        highlight = "@variable",
    },
    parts = {
        "header",
        "statistics",
        "clock",
    },
}
return settings
