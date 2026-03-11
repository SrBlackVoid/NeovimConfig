return {{
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ ']h', ':Gitsigns nav_hunk next<CR>', desc = "Next hunk" },
		{ '[h', ':Gitsigns nav_hunk prev<CR>', desc = "Previous hunk" },
		{ '<leader>Gr', ':Gitsigns reset_hunk<CR>', desc = "[H]unk [R]eset" },
		{ '<leader>Gb', ':Gitsigns blame<CR>', desc = "[G]it [B]lame" },
		{ '<leader>Gtw', ':Gitsigns toggle_word_diff<CR>', desc = "[G]it [T]oggle [W]ordDiff" },
		{ '<leader>Gtb', ':Gitsigns toggle_current_line_blame<CR>', desc = "[G]it [T]oggle [B]lame on current line" },
	},
	opts = {
		current_line_blame = true,
		word_diff = true,
		numhl = true,
	}
}}
