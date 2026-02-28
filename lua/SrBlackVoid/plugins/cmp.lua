return {{
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},

		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local cmp = require("cmp")

		-- Important for good completion behavior
		vim.o.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<S-Tab>"] = nil,
				["<C-l>"] = cmp.mapping.confirm({ select = false }),
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			},

			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
					{ name = "buffer" },
				}),
		})

		-- Cmdline completion
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}}
