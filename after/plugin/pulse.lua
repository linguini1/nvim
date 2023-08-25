local pulse = require("pulse")
pulse.setup({ level = vim.log.levels.INFO })

-- Timers
pulse.add("eyes", 30, "Rest your eyes!", true)
pulse.add("drink", 20, "Drink some water!", true)
pulse.add("brain", 50, "Rest your mind.", true)
