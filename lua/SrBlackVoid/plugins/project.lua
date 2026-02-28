return {
	{
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
			exclude_dirs = { 'e:/Code Repos', 'c:/Users/srayb' }
			-- NOTE: Fill with root code dirs or other unwanted folders getting picked up (use single forward slashes)
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
			require("telescope").load_extension("projects")
		end,
	}
}
