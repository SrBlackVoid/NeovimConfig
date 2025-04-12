return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

	--WARN: Something is cranking load times, may need some optimizing

    config = function()
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                powershell_es = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.powershell_es.setup({
                        settings = {powershell = { codeFormatting = { Preset = 'OTBS'} } }
                    })
                end,

				require('lspconfig').lua_ls.setup {
					settings = {
						Lua = {}
					},
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
							return
						end

						client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
							runtime {
								-- Tell the language server which version of Lua you're using
								-- (most likely JuaJIT in the case of Neovim)
								version = 'LuaJIT'
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME
									-- Depending on the usage, you might want to add additional paths here.
									-- "${3rd}/luv/library",
									-- "S{3rd}/busted/library",
								}
								-- or pull in all of 'runtiomepath'. NOTE this is a lot slower
								-- library = vim.api.nvim_get_runtime_file("", true)
							}
						})
					end,
				}
            }
        })

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Replace }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = {
				-- `Enter` key to confirm completion
				--['<CR>'] = cmp.mapping.confirm({select = false}),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),

				-- Navigate between snippet placeholder
				-- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
				-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

				-- Remap Shift-Tab
				['<S-Tab>'] = nil,

				-- Navigate through auto-completion
				['<C-l>'] = cmp.mapping.confirm({select = false}),
				['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
				['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

		vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
				callback = function(event)
					local opts = {buffer = event.buf}
					--Loading defaults from Lsp-Zero
					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					--Search for symbols within current document
					map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

					--Find references for the word under your cursor
					map('gr', function()
						require('telescope.builtin').lsp_references { trim_text = true }
					end, '[G]oto [R]eferences')

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI'}, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end

				end,
			})
    end
}
