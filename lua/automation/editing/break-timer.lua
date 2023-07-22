-- Module which reminds me to take breaks
local M = {}

local default_options = {
	interval = 45, -- Minutes
	reminder = { "Get your eyes off the screen!", "Be right back!" },
	title = "Break time!",
}

function M.setup(options)
	options = options or default_options

	-- Fill in default options
	for k, v in pairs(default_options) do
		if not options[k] then
			options[k] = v
		end
	end

	-- Convert minutes to ms
	options.interval = options.interval * 60000

	-- Create timer var to be used
	local timer = vim.loop.new_timer()
	local enabled = true

	-- Define timer complete action
	local function on_timer()
		-- Create scratch buffer floating window
		local buf = vim.api.nvim_create_buf(false, true)
		local ui = vim.api.nvim_list_uis()[1]
		local width = 50
		local height = 5
		local window = vim.api.nvim_open_win(buf, false, {
			relative = "editor",
			width = width,
			height = height,
			col = (ui.width / 2) - (width / 2),
			row = (ui.height / 2) - (height / 2),
			style = "minimal",
			border = "single",
			title = options.title,
			title_pos = "center",
		})

		-- Add centered message
		vim.api.nvim_buf_set_text(buf, 0, 0, -1, 0, options.reminder)

		timer:stop() -- Stop timer now that window is displayed
		vim.api.nvim_set_current_win(window) -- Put cursor in popup

		-- Define a way to close screen which restarts timer
		for _, key in ipairs({ "q", "<Esc>" }) do
			vim.keymap.set("n", key, function()
				timer:again()
				vim.api.nvim_command("close")
			end, { silent = true, nowait = true, noremap = true, buffer = buf })
		end
	end

	-- User commands for interacting with break timer
	vim.api.nvim_create_user_command("BreakEvery", function(opts)
		options.interval = tonumber(opts.args) * 60000
		local remaining = timer:get_due_in()
		timer:stop()
		timer:start(remaining, options.interval, vim.schedule_wrap(on_timer)) -- Start timer with new time
	end, { desc = "Set the break timer interval in minutes. Will apply to next timer.", nargs = 1 })

	vim.api.nvim_create_user_command("BreakWhen", function()
		if enabled then
			local remaining = math.ceil(timer:get_due_in() / 60000)
			vim.print("Break in " .. remaining .. " minutes.")
		else
			vim.print("Breaks disabled.")
		end
	end, { desc = "Display how long remains until the next break." })

	vim.api.nvim_create_user_command("BreakNow", function()
		if enabled then
			on_timer()
		else
			vim.print("Breaks must be enabled.")
		end
	end, { desc = "Start the next break now." })

	vim.api.nvim_create_user_command("BreakDisable", function()
		if enabled then
			timer:stop()
			vim.notify("Breaks disabled.")
			enabled = false
		else
			vim.notify("Breaks already disabled.")
		end
	end, { desc = "Disable breaks." })

	vim.api.nvim_create_user_command("BreakEnable", function()
		if enabled then
			vim.notify("Breaks already enabled.")
		else
			timer:again()
			vim.notify("Breaks enabled.")
			enabled = true
		end
	end, { desc = "Enable breaks." })

	timer:start(options.interval, options.interval, vim.schedule_wrap(on_timer)) -- Start timer
end

M.setup()
