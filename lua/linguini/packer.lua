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
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("ellisonleao/gruvbox.nvim") -- Colour scheme
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "saadparwaiz1/cmp_luasnip" }, -- Shows lua snippets in completion menu
			{ "hrsh7th/cmp-path" }, -- Shows paths in completion menu
			{ "hrsh7th/cmp-nvim-lua" }, -- Shows nvim api in completion menu
			{ "hrsh7th/nvim-cmp" }, -- Completion
			{ "hrsh7th/cmp-nvim-lsp" }, -- Completion + LSP integration
			{ "L3MON4D3/LuaSnip" }, -- Snippets
		},
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- Pretty icons
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("nvim-lualine/lualine.nvim")
	use("eandrju/cellular-automaton.nvim")
	if packer_bootsrap then
		packer.sync()
	end
end)
