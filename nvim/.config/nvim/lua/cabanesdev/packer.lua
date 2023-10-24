-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Themes
	use 'folke/tokyonight.nvim'
	use 'gruvbox-community/gruvbox' 
  use 'EdenEast/nightfox.nvim'
	-- Git
	use 'tpope/vim-fugitive'
  use 'APZelos/blamer.nvim'
  use 'tpope/vim-surround'
  -- File searcher
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
	-- Harpoon
	use 'ThePrimeagen/harpoon'
	-- Syntax highlight
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'
	-- Visualmulti
	use 'mg979/vim-visual-multi'
	-- Commenter
	use 'tpope/vim-commentary'
	-- Lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
	use 'nvim-lua/lsp_extensions.nvim'
	-- GO 
	use 'fatih/vim-go'
	--Rust
	use 'rust-lang/rust.vim'
	use 'simrat39/rust-tools.nvim'
end)
