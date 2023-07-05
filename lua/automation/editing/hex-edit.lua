local function hex_toggle()
    -- Revert hex if already in hex-edit mode
    if vim.bo.filetype == "xxd" then
        vim.api.nvim_command("%!xxd -r")
        vim.api.nvim_command("filetype detect")
        return
    end

    vim.api.nvim_command("%!xxd")
    vim.api.nvim_command("set ft=xxd") -- Get correct syntax highlighting
end
vim.api.nvim_create_user_command("Hex", hex_toggle, { desc = "Toggle hex editing mode." })
