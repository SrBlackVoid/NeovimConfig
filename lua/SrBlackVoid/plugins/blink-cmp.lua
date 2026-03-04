return {{
	'saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		'fang2hou/blink-copilot',
	},
	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.config
	opts = {
		keymap = {
			['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-l>'] = { 'select_and_accept' },
            ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		},
		sources = {
			default = { 'copilot', 'lsp', 'buffer', 'snippets', 'path' },
			providers = {
				copilot = {
					name = 'copilot',
					module = "blink-copilot",
					async = true,
				},
			}
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			documentation = {
				auto_show = true,
			}
		},
	},
}}
