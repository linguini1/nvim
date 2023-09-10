return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    cmd = "Neorg",
    priority = 30,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neorg/neorg-telescope",
        "folke/zen-mode.nvim",
        "jbyuki/nabla.nvim",
    },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.qol.toc"] = { config = { close_after_use = true } },
                ["core.completion"] = { config = { engine = "nvim-cmp" } },
                ["core.summary"] = {},
                ["core.concealer"] = {},
                ["core.export"] = {},
                ["core.looking-glass"] = {},
                ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
                ["core.integrations.telescope"] = {},
                ["core.integrations.treesitter"] = {},
                ["core.ui"] = {},
                ["core.tempus"] = {},
                ["core.ui.calendar"] = {},
                ["core.export.markdown"] = {},
                ["core.journal"] = {
                    config = {
                        journal_folder = "journo",
                    },
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            junk = "~/notes/junk",
                            school = "~/notes/school",
                            projects = "~/notes/projects",
                            cuinspace = "~/notes/cuinspace",
                        },
                        default_workspace = "junk",
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.remap_event("norg", "n", "<LocalLeader>z", "core.looking-glass.magnify-code-block")
                            keybinds.map("norg", "n", "<LocalLeader>p", "<Cmd>Neorg presenter start<CR>")
                            keybinds.map("norg", "n", "<LocalLeader>v", require("nabla").popup)
                            keybinds.map("norg", "n", "<leader>fnh", "<Cmd>Telescope neorg search_headers<CR>")
                            keybinds.map("norg", "n", "<leader>fnl", "<Cmd>Telescope neorg find_linkable<CR>")
                            keybinds.map("norg", "n", "<LocalLeader>il", "<Cmd>Telescope neorg insert_file_link<CR>")
                        end,
                    },
                },
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "norg",
            callback = function() vim.opt_local.conceallevel = 3 end,
            desc = "Set conceal level to 3 on Neorg files so that links are properly concealed.",
        })
    end,
}
