require("project_nvim").setup ({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
	patterns = { ".git", ".gitignore", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json"},
	exclude_dirs = { 'c:/Users/srayb', 'e:/Code Repos'}
})

vim.keymap.set('n','<leader>gp',':Telescope projects<CR>', { desc = "[G]oto [P]rojects"})
