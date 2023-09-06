return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "norg",
    cmd = "Neorg",
    priority = 30, -- Load after treesitter, with a priority of 50
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.completion"] = { config = { engine = "nvim-cmp" } },
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            school = "~/notes/school",
                            personal = "~/notes/personal",
                            projects = "~/notes/projects",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        })
    end,
}
