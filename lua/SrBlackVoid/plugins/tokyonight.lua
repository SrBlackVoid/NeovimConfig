return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "dark",
				floats = "dark",
			},
			dim_inactive = false,
		},
		config = function()
			require("tokyonight").load()
			vim.cmd.colorscheme("tokyonight")

			--Set transparent background
			vim.api.nvim_set_hl(0, "Normal" , { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat" , { bg = "none" })
		end,
	}
}
