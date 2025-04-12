return {
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = { --Only if lazy-loading (non-telescope) 
			{
				'<leader>Gg', ':LazyGit<CR>', desc = "Lazy[G]it"
			},
			{
				'<leader>Gc', ':LazyGitCurrentFile<CR>', desc = "Lazy[G]it: [C]urrent File Repo"
			},
			{
				'<leader>Gf', ':LazyGitFilterCurrentFile<CR>', desc = "Lazy[G]it: [F]ilter by current file"
			}
		},
		dependencies = {
			-- "nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- require("telescope").load_extension("lazygit")
			vim.g.lazygit_floating_window_use_plenary = 1
			vim.g.lazygit_floating_window_winblend = 1
		end
  }
}
