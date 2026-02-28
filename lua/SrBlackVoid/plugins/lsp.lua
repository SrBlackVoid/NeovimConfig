return {{
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		{ "williamboman/mason.nvim", build = ":MasonUpdate" },
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	opts = {
		servers = require("SrBlackVoid.lsp.servers"),
	},

	config = function(_, opts)
		require("SrBlackVoid.lsp").setup(opts)
	end,
}}
