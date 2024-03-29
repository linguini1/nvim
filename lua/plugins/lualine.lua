-- Custom component for current scope
local valid_scopes =
    { "function_definition", "class_definition", "function_declaration", "jsx_element", "jsx_self_closing_element" }

--- @param node_type string
--- @return boolean # Whether the current scope is one that should be displayed on the status line
local function is_valid_scope(node_type)
    for _, value in ipairs(valid_scopes) do
        if node_type == value then return true end
    end
    return false
end

-- TODO: Make this work for lua functions.
--- @return string scope_identifier The name of the current function/class scope the cursor is in
local function current_scope()
    local current_node = vim.treesitter.get_node()
    if not current_node then return "" end
    local expr = current_node

    while expr do
        if is_valid_scope(expr:type()) then break end
        expr = expr:parent()
    end

    if not expr then return "" end
    return vim.treesitter.get_node_text(expr:child(1), 0)
end

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
            },
            sections = {
                lualine_c = { { "filename", path = 1 }, current_scope },
                lualine_y = { "os.date('%Y-%m-%d')", "progress" },
            },
        })
    end,
}
