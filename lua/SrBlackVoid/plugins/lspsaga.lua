return {{
	'nvimdev/lspsaga.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	pin  = true,
	opts = {
		outline = {
			win_width = 40,
			key = {
				toggle_or_jump = { 'o', '<CR>' }
			}
		},
		ui = {
			enable = false
		},
	},
	init = function()
		vim.keymap.set('n','<leader>k',':Lspsaga peek_definition<CR>', {desc = "Peek Definition" })
		vim.keymap.set('n','<leader>O',':Lspsaga outline<CR>', {desc = "Get Scope [O]utline" })
	end
}}
