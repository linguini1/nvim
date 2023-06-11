require("lualine").setup({
	options = {
		theme = "auto",
	},
	sections = {
		lualine_c = { { "filename", path = 1 } },
	},
})
