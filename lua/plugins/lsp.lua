return {
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = function() pcall(vim.cmd, "MasonUpdate") end },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip", -- Shows lua snippets in completion menu
            "hrsh7th/cmp-path", -- Shows paths in completion menu
            "hrsh7th/cmp-nvim-lua", -- Shows nvim api in completion menu
            "hrsh7th/cmp-nvim-lsp", -- Completion + LSP integration
            "L3MON4D3/LuaSnip", -- Snippets
            "windwp/nvim-autopairs", -- Automatic pairs
        },
        config = function() require("nvim-autopairs").setup() end,
    },
}
