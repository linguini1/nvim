local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "venv",
            ".git",
            ".idea",
        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files using Telescope." })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find git file using Telescope." })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find keymaps using Telescope." })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = "Find git commits using Telescope." })
vim.keymap.set('n', '<leader>fb', builtin.git_branches, { desc = "Find git branches using Telescope." })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Find symbols using Telescope." })
vim.keymap.set('n', '<leader>fp', builtin.live_grep, { desc = "Find token using live grep in Telescope." })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Show references in a Telescope window." })
