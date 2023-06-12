-- Custom component for current scope
local valid_scopes =
	{ "function_definition", "class_definition", "function_declaration", "jsx_element", "jsx_self_closing_element" }
local function is_valid_scope(node_type)
	for _, value in ipairs(valid_scopes) do
		if node_type == value then
			return true
		end
	end
	return false
end

-- TODO: Make this work for lua functions.
local function current_scope()
	local current_node = vim.treesitter.get_node()

	if not current_node then
		return ""
	end

	local expr = current_node

	while expr do
		if is_valid_scope(expr:type()) then
			break
		end
		expr = expr:parent()
	end

	if not expr then
		return ""
	end

	return vim.treesitter.get_node_text(expr:child(1), 0)
end

-- Setup
require("lualine").setup({
	options = {
		theme = "auto",
	},
	sections = {
		lualine_c = { { "filename", path = 1 }, current_scope },
		lualine_y = { "os.date('%Y-%m-%d')", "progress" },
	},
})
