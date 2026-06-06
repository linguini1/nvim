local function cpp_to_c_comment(_)
    local comment_query =
        vim.treesitter.query.parse("c", [[(comment) @comment]])

    local tree = vim.treesitter.get_parser():parse()[1]
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1] - 1

    -- Get first comment under cursor
    local comment = nil
    for _, node, _ in comment_query:iter_captures(tree:root(), 0, cursor_row) do
        comment = node
        break
    end

    -- Check if comment is C++ style
    if vim.treesitter.get_node_text(comment, 0):find("^//") == nil then
        return
    end

    -- Check all adjacent previous nodes and add them to the capture range
    local prev_node = comment
    local start_row = nil

    while prev_node:type() == "comment" do
        start_row, _, _ = prev_node:start()
        if prev_node:prev_sibling() == nil then break end
        prev_node = prev_node:prev_sibling()

        -- Break at non-C++
        if vim.treesitter.get_node_text(prev_node, 0):find("^//") == nil then
            break
        end
    end

    -- Check all adjacent next nodes and add them to the capture range
    local next_node = comment
    local end_row = nil

    while next_node:type() == "comment" do
        end_row, _, _ = next_node:end_()
        if next_node:next_sibling() == nil then break end
        next_node = next_node:next_sibling()

        -- Break at non-C++
        if vim.treesitter.get_node_text(next_node, 0):find("^//") == nil then
            break
        end
    end

    -- Convert C++ comment to block-comment
    local comment_text =
        vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, true)

    -- If we have just one single line, do a simple replace

    if #comment_text == 1 then
        comment_text[1] = string.gsub(comment_text[1], "//", "/*")
        comment_text[1] = comment_text[1] .. " */"
        vim.api.nvim_buf_set_lines(
            0,
            start_row,
            end_row + 1,
            true,
            comment_text
        )
        return
    end

    -- Otherwise, do something more complicated with a trailing closing line

    local indent = ""
    for i = 1, #comment_text do
        -- Get the indent size from the highest of spaces
        local start, _end = string.find(comment_text[i], "^[%s]+")
        if start then indent = string.sub(comment_text[i], start, _end) end

        -- First line gets opening
        if i == 1 then
            comment_text[i] = string.gsub(comment_text[i], "//", "/*")
        else
            -- All other lines get regular " *"
            comment_text[i] = string.gsub(comment_text[i], "//", " *")
        end
    end

    -- Closing comment delimiter
    table.insert(comment_text, indent .. " */")

    -- Replace text
    vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, true, comment_text)
end

vim.api.nvim_create_augroup("nuttx-keymaps", { clear = true })

-- Register NuttX keymaps
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.c", "*.h" },
    group = "nuttx-keymaps",
    callback = function()
        vim.keymap.set(
            "n",
            "<leader>c",
            cpp_to_c_comment,
            { desc = "Convert C++ style comments to C style" }
        )
    end,
})

-- Remove NuttX keymaps
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = { "*.c", "*.h" },
    group = "nuttx-keymaps",
    callback = function() vim.keymap.del("n", "<leader>c") end,
})

vim.api.nvim_create_user_command("CPP2C", cpp_to_c_comment, {
    desc = "Convert C++ style comments to C style",
    nargs = 0,
})
