require("gruvbox").setup({
	contrast = "hard",
})

-- For setting colorscheme globally
function SetColours(colour)
	colour = colour or "gruvbox"
	vim.cmd.colorscheme(colour)
end

SetColours()
