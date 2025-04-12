return {
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				notify = false,
			})

			--Document existing keychains
			require('which-key').register {
				['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
				['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
				['<leader>dd'] = { name = '[D]ocument [D]iff', _ = 'which_key_ignore' },
				['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
				['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
				['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
				['<leader>g'] = { name = '[g]oto', _ = 'which_key_ignore' },
				['<leader>G'] = { name = '[G]it', _ = 'which_key_ignore' },
				['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' }
			}
		end
	}
}
