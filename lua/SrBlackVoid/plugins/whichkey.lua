return {{
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		notify = false,
		spec = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>dd", group = "[D]ocument [D]iff" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>g", group = "[g]oto" },
			{ "<leader>G", group = "[G]it" },
			{ "<leader>t", group = "[T]erminal" }
		}
	},
}}
