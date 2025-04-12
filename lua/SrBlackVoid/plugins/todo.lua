return {
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		--[[ keys = {
			{'<leader>wt',':TodoTelescope<CR>', desc = "[W]orkspace [T]oDo"}
		}, ]]
		opts = {},
		init = function()
			vim.keymap.set('n', '<leader>wt',':TodoTelescope<CR>', { desc = "[W]orkspace [T]oDo" })
		end
	}
}
