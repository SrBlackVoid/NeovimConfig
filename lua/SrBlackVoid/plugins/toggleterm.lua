return {{
	'akinsho/toggleterm.nvim',
	keys = {
		{ '<leader>r', mode = 'v', '<cmd>ToggleTermSendVisualLines<CR>', desc = '[R]un selection' },
	},
	opts = {
		hide_numbers = true,
		autochdir = true,
		start_in_insert = true,
		auto_scroll = true,
		size = 15
	}
}}
