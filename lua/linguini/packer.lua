vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" } -- Colour
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'saadparwaiz1/cmp_luasnip' }, -- Shows lua snippets in completion menu
            { 'hrsh7th/cmp-path' },         -- Shows paths in completion menu
            { 'hrsh7th/cmp-nvim-lua' },     -- Shows nvim api in completion menu
            { 'hrsh7th/nvim-cmp' },         -- Completion
            { 'hrsh7th/cmp-nvim-lsp' },     -- Completion + LSP integration
            { 'L3MON4D3/LuaSnip' },         -- Snippets
        }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Pretty icons
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        'nvim-lualine/lualine.nvim',
    }
end)
