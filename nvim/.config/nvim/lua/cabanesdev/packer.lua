-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Themes
	use 'folke/tokyonight.nvim'
	use 'gruvbox-community/gruvbox' 
	-- Git
	use 'tpope/vim-fugitive'
  use 'APZelos/blamer.nvim'
  -- File searcher
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
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
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'
	use 'nvim-lua/lsp_extensions.nvim'
	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- GO 
	use 'fatih/vim-go'
	--Rust
	use 'rust-lang/rust.vim'
	use 'simrat39/rust-tools.nvim'
end)
