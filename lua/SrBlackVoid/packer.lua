-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --telescope setup
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --tokyonight color scheme
  use 'folke/tokyonight.nvim'

  -- Treesitter initialization
--[[  use (
	  'nvim-treesitter/nvim-treesitter',
	  {run = ':TSUpdate'}
  )
]]
  -- LSP-Zero
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		   {'williamboman/mason.nvim'},
		   {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
 }

 use {
	 'nvim-treesitter/nvim-treesitter',
	 run = function()
		 local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		 ts_update()
	 end,
 }
  -- UFO auto-fold support
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- WhichKey
  use 'folke/which-key.nvim'

  -- Comment.nvim
  use 'numToStr/Comment.nvim'


  --ToggleTerm
  use {"akinsho/toggleterm.nvim", tag = '*'}

  --ToggleTerm-Manager
  use {
	  'ryanmsnyder/toggleterm-manager.nvim',
	  requires = {
		  'akinsho/nvim-toggleterm.lua',
		  'nvim-telescope/telescope.nvim',
		  'nvim-lua/plenary.nvim',
	  },
	  config = function()
		  require("toggleterm-manager").setup()
	  end
  }

  --AutoPairs
  use {
	  "windwp/nvim-autopairs",
	  event = "InsertEnter",
	  config = function()
		  require("nvim-autopairs").setup {}
	 end
 }

 --GitSigns
  use 'lewis6991/gitsigns.nvim'

  --LazyGit
  use({
	  "kdheepak/lazygit.nvim",
	  requires = {
		  "nvim-lua/plenary.nvim",
		  "nvim-telescope/telescope.nvim",
	  },
	  config = function()
		  require("telescope").load_extension("lazygit")
	  end,
  })

  --LuaLine statusLine
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --Project Manager
  use ({
	  "ahmedkhalf/project.nvim",
	  config = function()
		  require("telescope").load_extension("projects")
	  end,
  })

  --Indent markers
  use 'lukas-reineke/indent-blankline.nvim'


  --Telescope-diff
  use {
    'jemag/telescope-diff.nvim',
	requires = {'nvim-telescope/telescope.nvim' }
  }

end)
