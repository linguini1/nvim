local settings = {
	header = {
		type = "text",
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 3,
		content = require("startup.custom_headers").conway,
		highlight = "GruvboxFg0",
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
		highlight = "GruvboxFg0",
	},
	statistics = {
		type = "text",
		content = function()
			local plugin_count = vim.tbl_count(packer_plugins)
			local nvim_vers = string.match(vim.api.nvim_cmd({ cmd = "version" }, { output = true }), "NVIM v%d%.%d%.%d")
			local os = "OS: " .. vim.loop.os_uname().sysname
			return {
				nvim_vers,
				os,
				string.format("Total plugins: %d", plugin_count),
			}
		end,
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 3,
		highlight = "GruvboxFg0",
	},
	parts = {
		"header",
		"statistics",
		"clock",
	},
}
return settings
