local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function() require("gruvbox").setup({ contrast = "hard" }) end,
    },
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    { "nvim-treesitter/nvim-treesitter", config = function() vim.cmd("TSUpdate") end },
    { "nvim-treesitter/playground" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = function() pcall(vim.cmd, "MasonUpdate") end },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" }, -- Shows lua snippets in completion menu
    { "hrsh7th/cmp-path", event = "InsertEnter" }, -- Shows paths in completion menu
    { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" }, -- Shows nvim api in completion menu
    { "hrsh7th/nvim-cmp", event = "InsertEnter" }, -- Completion
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" }, -- Completion + LSP integration
    { "L3MON4D3/LuaSnip", event = "InsertEnter" }, -- Snippets
    { "windwp/nvim-autopairs", event = "InsertEnter" }, -- Automatic pairs

    -- Misc
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "startup-nvim/startup.nvim" },
    {
        "chrishrb/gx.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = { "gx" },
        config = function() require("gx").setup({ handler_options = { search_engine = "google" } }) end,
    },
    { "linguini1/pulse.nvim" },

    -- Markdown previewing in browser
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
    },
})
