return {
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = function() pcall(vim.cmd, "MasonUpdate") end },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "saadparwaiz1/cmp_luasnip" }, -- Shows lua snippets in completion menu
    { "hrsh7th/cmp-path" }, -- Shows paths in completion menu
    { "hrsh7th/cmp-nvim-lua" }, -- Shows nvim api in completion menu
    { "hrsh7th/nvim-cmp" }, -- Completion
    { "hrsh7th/cmp-nvim-lsp" }, -- Completion + LSP integration
    { "L3MON4D3/LuaSnip" }, -- Snippets
    { "windwp/nvim-autopairs", config = function()
        require("nvim-autopairs").setup()
    end }, -- Automatic pairs
}
