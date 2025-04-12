return {
	{
		"ahmedkhalf/project.nvim",
		--[[ keys = {
		  {
			  "<leader>gp",
			  -- ":Telescope projects<CR>",
			  vim.schedule_wrap(function()
				  require("telescope").extensions.projects.projects({})
			  end),
			  desc = "[G]oto [P]rojects"
		  }
	  }, ]]
		config = function()
			require("telescope").load_extension("projects")

			require("project_nvim").setup ({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true
				},
				patterns = { ".git", ".gitignore", "_drcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".exercism"},
				exclude_dirs = { '' }
				-- NOTE: Fill with root code dirs or other unwanted folders getting picked up (use single forward slashes)
			})

			vim.keymap.set('n', "<leader>gp", ":Telescope projects<CR>", { desc = "[G]oto [P]rojects" })
		end,
	}
}
