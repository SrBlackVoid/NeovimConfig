return {{
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	keys = {
		{ "<leader>cf", ":Copilot toggle<CR>", desc = "Toggle Copilot auto trigger" },
	},
	opts = {
		panel = {
			enabled = false,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom",
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<S-tab>",
				accept_word = false,
				accept_line = false,
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<C-]>",
			},
		},
	},
}}
