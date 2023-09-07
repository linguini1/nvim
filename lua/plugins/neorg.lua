return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "folke/zen-mode.nvim", "jbyuki/nabla.nvim" },
    ft = "norg",
    cmd = "Neorg",
    priority = 30, -- Load after treesitter, with a priority of 50
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
                ["core.ui"] = {},
                ["core.tempus"] = {},
                ["core.ui.calendar"] = {},
                ["core.export.markdown"] = {},
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
                            keybinds.map("norg", "n", "<LocalLeader>l", require("nabla").popup)
                        end,
                    },
                },
            },
        })
    end,
}
