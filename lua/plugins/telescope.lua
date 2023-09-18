return {
    "nvim-telescope/telescope.nvim",
    enabled = not vim.g.started_by_firenvim,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>ff", "<leader>fh", "<leader>fg", "<leader>fk", "<leader>fc" },
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "^node_modules/",
                    "^venv/",
                    "^./.git/",
                    ".idea",
                    "*.synctex.gz",
                    "*.fls",
                    "*.fdb_latexmk",
                },
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files using Telescope." })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help menu using Telescope." })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git file using Telescope." })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find key maps using Telescope." })
        vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Find git commits using Telescope." })
        vim.keymap.set(
            "n",
            "<leader>fb",
            function() return builtin.git_branches({ show_remote_tracking_branches = false }) end,
            { desc = "Find git branches using Telescope." }
        )
        vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols using Telescope." })
        vim.keymap.set(
            "n",
            "<leader>lg",
            builtin.live_grep,
            { desc = "Find search term using live grep in Telescope." }
        )
        vim.keymap.set("n", "z=", builtin.spell_suggest, { desc = "Show spelling suggestions for word under cursor." })

        -- Hacky workaround to have Neorg highlights in the preview
        local hl_group = vim.api.nvim_create_augroup("norg-telescope-hl", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = hl_group,
            pattern = "TelescopePreviewerLoaded",
            callback = function(args)
                if args.data.filetype == "norg" then
                    vim.bo.filetype = "norg"
                    vim.api.nvim_del_augroup_by_id(hl_group) -- Clear up once Neorg is loaded properly
                end
            end,
        })
    end,
}
