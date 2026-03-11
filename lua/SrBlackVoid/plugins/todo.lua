return {{
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{'<leader>wt',':TodoTelescope<CR>', desc = "[W]orkspace [T]oDo"}
	},
	opts = {},
}}
