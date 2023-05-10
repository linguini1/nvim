function SetColours(colour)
	colour = colour or "gruvbox"
	vim.cmd.colorscheme(colour)
end

SetColours()
