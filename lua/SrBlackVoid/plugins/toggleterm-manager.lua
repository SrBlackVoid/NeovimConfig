return {{
	'ryanmsnyder/toggleterm-manager.nvim',
	dependencies = {
		'akinsho/toggleterm.nvim',
		'nvim-telescope/telescope.nvim',
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{'<leader>tt',':Telescope toggleterm_manager<CR>', desc = "[T]oggleterm Manager"},
	},
	opts = {},
}}
