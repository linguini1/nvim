vim.api.nvim_create_user_command("QNXify", function(_)
    vim.cmd('%s/qcc"/aarch64-unknown-nto-qnx7.1.0-gcc",\r\t"-D__QNXNTO__",\r\t"-D__LITTLEENDIAN__"/g')
    vim.cmd('%s/"-V.*$/')
end, { desc = "Modify compile_commands.json to work with qcc." })
