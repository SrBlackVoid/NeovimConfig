local paths = require("SrBlackVoid.config.local")

return {{
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim'
	},
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
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown {}
			}
		},
	},
	keys = {
		{ '<leader>sf', ":Telescope find_files<CR>", desc = '[S]earch [F]iles' },
		{ '<leader>sg', ":Telescope live_grep<CR>", desc = '[S]earch by [G]rep' },
		{ '<leader>sk', ":Telescope keymaps<CR>", desc = '[S]earch [K]eymaps' },
		{ '<leader><leader>', ":Telescope buffers<CR>", desc = '[ ] Find existing buffers' },
		{ '<leader>sh', ":Telescope help_tags<CR>", desc = '[S]earch [H]elp' },
		{ '<leader>st', ":Telescope treesitter<CR>", desc = '[S]earch [T]reesitter' },
		{ '<leader>wi', ":Telescope diagnostics<CR>", desc = '[W]orkplace [I]ssues' },

		{ '<leader>sn', function()
			require("telescope.builtin").find_files { cwd = vim.fn.stdpath 'config' }
		end, desc = '[S]earch [N]eovim Files' },

		{ '<leader>sd', function()
			require("telescope.builtin").find_files { cwd = paths.root_search_dirs }
		end, desc = '[S]earch [D]ev Files' },

		{ '<leader>Gs', ":Telescope git_status<CR>", desc = '[G]it [S]tatus' },

		{ '<leader>di', function()
			require("telescope.builtin").diagnostics({bufnr = 0})
		end, desc = '[D]ocument [I]ssues' },

		{ '<leader>df', function()
			require("telescope.builtin").current_buffer_fuzzy_find()
		end, desc = '[D]ocument [F]ind' },

		{ '<leader>gm', ":Telescope marks<CR>", desc = '[G]oto [M]arks' }
	},
	config = function (_,opts)
		require("telescope").setup(opts)

		require("telescope").load_extension("ui-select")
	end
}}
