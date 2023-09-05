return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.completion"] = { config = { engine = "nvim-cmp" } },
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            school = "~/notes/school",
                            personal = "~/notes/personal",
                            projects = "~/notes/projects",
                        },
                    },
                },
            },
        })
    end,
}
