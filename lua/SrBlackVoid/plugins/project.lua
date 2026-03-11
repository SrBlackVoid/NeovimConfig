local paths = require("SrBlackVoid.config.local")

return {{
	"ahmedkhalf/project.nvim",
	lazy = false,
	keys = {
		{ "<leader>gp", ":Telescope projects<CR>", desc = "[G]oto [P]rojects" }
	},
	opts = {
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true
		},
		patterns = { ".git", ".gitignore", "_drcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".exercism"},
		exclude_dirs = paths.project_exclude
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
		require("telescope").load_extension("projects")
	end,
}}
