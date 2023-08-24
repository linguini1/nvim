local pulse = require("pulse")
pulse.setup({ level = vim.log.levels.INFO })

-- Timers
pulse.add("eyes", 45, "Rest your eyes!")
pulse.add("drink", 20, "Drink some water!")
