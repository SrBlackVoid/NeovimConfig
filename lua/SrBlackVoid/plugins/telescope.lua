return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim'},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "select_horizontal",
						["<C-l>"] = "select_vertical",
						["<C-X>"] = false,
						["<C-V>"] = false,
					},
					n = {
						["<C-j>"] = "select_horizontal",
						["<C-l>"] = "select_vertical",
						["<C-X>"] = false,
						["<C-V>"] = false,
					},
				}
			}
		},

		init = function()
			--config = function()
			local builtin = require('telescope.builtin')

			-- Telescope shortcuts
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles'})
			vim.keymap.set('n', '<leader>sr', builtin.git_files, { desc = '[S]earch [R]epository'})
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep'})
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps'})
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers'})
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp'})
			vim.keymap.set('n', '<leader>st', builtin.treesitter, { desc = '[S]earch [T]reesitter'})

			vim.keymap.set('n', '<leader>wi', builtin.diagnostics, { desc = '[W]orkplace [I]ssues'})

			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[S]earch [N]eovim Files'})

			vim.keymap.set('n', '<leader>sd', function()
				builtin.find_files { cwd = '' }
				-- NOTE: Fill value with root dev folder (use double backslashes)
			end, { desc = '[S]earch [D]ev Files'})

			vim.keymap.set('n', '<leader>Gs', builtin.git_status, { desc = '[G]it [S]tatus'})

			vim.keymap.set('n', '<leader>di',function()
				builtin.diagnostics({bufnr = 0})
			end, { desc = '[D]ocument [I]ssues'})

			vim.keymap.set('n', '<leader>df', function()
				builtin.current_buffer_fuzzy_find()
			end, { desc = '[D]ocument [F]ind'})

			vim.keymap.set('n', '<leader>gm', builtin.marks, { desc = '[G]oto [M]arks'})
		end,
	}
}
