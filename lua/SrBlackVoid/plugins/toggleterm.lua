return {
	{
	    'ryanmsnyder/toggleterm-manager.nvim',
		dependencies = {
		  'akinsho/toggleterm.nvim',
		  'akinsho/nvim-toggleterm.lua',
		  'nvim-telescope/telescope.nvim',
		  'nvim-lua/plenary.nvim',
		},
		version = '*',
		keys = {
			{'<leader>tt',':Telescope toggleterm_manager<CR>', desc = "[T]oggleterm Manager"}
		},
		config = function()
			require("toggleterm").setup{
				hide_numbers = true,
				autochdir = true,
				start_in_insert = true,
				auto_scroll = true,
				size = 15
			}

			vim.keymap.set('v','<leader>r',':ToggleTermSendVisualLines<CR>', { desc = "[R]un selection" })
		end
	}
}
