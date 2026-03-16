return {{
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"malewicz1337/oil-git.nvim",
			dependencies = { "stevearc/oil.nvim" },
			opts = {},
		},
		{
			"JezerM/oil-lsp-diagnostics.nvim",
			dependencies = { "stevearc/oil.nvim" },
			opts = {},
		},
	},
	lazy = false,
	keys = {
		{ "<leader>f", ":Oil<CR>", desc = "[F]ile Explorer" }
	},
	opts = {
		default_file_explorer = true,
		columns = { "icon" },
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-h>"] = false,
			["<C-j>"] = false,
			["<C-k>"] = false,
			["<C-l>"] = false,
		}
	},
}}
