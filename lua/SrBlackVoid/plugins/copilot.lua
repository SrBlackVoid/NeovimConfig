return {{
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
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
				enabled = false,
				auto_trigger = false,
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
		})

		--[[ vim.keymap.set("n", "<leader>c", function()
			require("copilot.suggestion").toggle_auto_trigger()
		end, { desc = "Toggle Copilot auto trigger" }) ]]
	end,
}}
