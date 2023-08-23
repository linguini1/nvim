require("gruvbox").setup({
	contrast = "hard",
})

-- For setting colorscheme globally
--- @param colour string | nil
function SetColours(colour)
	colour = colour or "gruvbox"
	vim.cmd.colorscheme(colour)
end

SetColours()
