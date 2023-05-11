local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "venv",
            ".git",
            ".idea",
        }
    }
}

vim.keymap.set('n', '<C-f>', builtin.find_files, {}) -- Find files
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- Find git files

-- Search strings
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") });
end)
