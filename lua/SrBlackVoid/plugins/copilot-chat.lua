return {{
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{"<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "[C]opilotChat - [E]xplain code" },
		{"<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "[C]opilotChat - Generate [T]ests" },
		{"<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "[C]opilotChat - [R]eview code" },
		{"<leader>ca", "<cmd>CopilotChatReview<cr>", desc = "[C]opilotChat - [R]eview code" },
		{"<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "[C]opilot [C]hat" },
	},
	opts = {
		debug = false,
		model = 'claude-sonnet-4.5',
	}
}}
