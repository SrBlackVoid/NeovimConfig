return {{
	"kdheepak/lazygit.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = { --Only if lazy-loading (non-telescope) 
		{ '<leader>Gg', ':LazyGit<CR>', desc = "Lazy[G]it" },
		{ '<leader>Gc', ':LazyGitCurrentFile<CR>', desc = "Lazy[G]it: [C]urrent File Repo" },
		{ '<leader>Gf', ':LazyGitFilterCurrentFile<CR>', desc = "Lazy[G]it: [F]ilter by current file" }
	},
	init = function()
		-- Set globals at startup, before plugin loads
		vim.g.lazygit_floating_window_use_plenary = 1
		vim.g.lazygit_floating_window_winblend = 1
	end,
}}
