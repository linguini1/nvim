local packer = require("packer")

-- Packer bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootsrap = ensure_packer()

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
    use("ellisonleao/gruvbox.nvim")
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")

    -- LSP
    use("neovim/nvim-lspconfig")
    use({ "williamboman/mason.nvim", run = function() pcall(vim.cmd, "MasonUpdate") end })
    use("williamboman/mason-lspconfig.nvim")

    -- Autocompletion
    use("saadparwaiz1/cmp_luasnip") -- Shows lua snippets in completion menu
    use("hrsh7th/cmp-path") -- Shows paths in completion menu
    use("hrsh7th/cmp-nvim-lua") -- Shows nvim api in completion menu
    use("hrsh7th/nvim-cmp") -- Completion
    use("hrsh7th/cmp-nvim-lsp") -- Completion + LSP integration
    use("L3MON4D3/LuaSnip") -- Snippets
    use("windwp/nvim-autopairs")

    -- Misc
    use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
    use("jose-elias-alvarez/null-ls.nvim")
    use("nvim-lualine/lualine.nvim")
    use("startup-nvim/startup.nvim")
    use("chrishrb/gx.nvim")
    use("linguini1/pulse.nvim")

    -- Markdown previewing in browser
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    if packer_bootsrap then packer.sync() end
end)
