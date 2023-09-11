return {
    "linguini1/pulse.nvim",
    enabled = not vim.g.started_by_firenvim,
    config = function()
        local pulse = require("pulse")
        pulse.setup({ level = vim.log.levels.INFO })

        -- Timers
        pulse.add("eyes", {
            interval = 30,
            message = "Rest your eyes!",
            enabled = true,
        })
        pulse.add("drink", {
            interval = 20,
            message = "Drink some water!",
            enabled = true,
        })
        pulse.add("brain", {
            interval = 50,
            message = "Rest your mind.",
            enabled = true,
            level = vim.log.levels.WARN,
        })
    end,
}
