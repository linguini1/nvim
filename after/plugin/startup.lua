require("startup").setup({ theme = "linguini" })

-- Turn off colour column in startup screen, restore after
--vim.api.nvim_create_autocmd("BufEnter", {
--	group = vim.api.nvim_create_augroup("no_cc_startup", { clear = true }),
--	callback = function(opts)
--		if vim.bo[opts.buf].filetype == "startup" then
--			vim.api.nvim_cmd("set cc=")
--		end
--	end,
--})
--vim.api.nvim_create_autocmd("BufLeave", {
--	group = vim.api.nvim_create_augroup("add_cc_post_startup", { clear = true }),
--	callback = function(opts)
--		if vim.bo[opts.buf].filetype == "startup" then
--			vim.api.nvim_cmd("set cc=120")
--		end
--	end,
--})
