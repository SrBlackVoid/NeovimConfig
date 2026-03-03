local M = {}

local function make_capabilities()
	local caps = require("cmp_nvim_lsp").default_capabilities()

	-- UFO folding support
	caps.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return caps
end

local function setup_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("srblackvoid-lsp-attach", { clear = true }),
		callback = function(event)
			local buf = event.buf

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
			end

			map("K", vim.lsp.buf.hover, "Hover")
			map("gd", vim.lsp.buf.definition, "Definition")
			map("gD", vim.lsp.buf.declaration, "Declaration")
			map("go", vim.lsp.buf.type_definition, "Type Definition")
			map("gs", vim.lsp.buf.signature_help, "Signature Help")
			map("<F2>", vim.lsp.buf.rename, "Rename")
			map("<F4>", vim.lsp.buf.code_action, "Code Action")

			-- Telescope (lazy-safe)
			map("<leader>ds", function()
				require("telescope.builtin").lsp_document_symbols()
			end, "Document Symbols")

			map("gr", function()
				require("telescope.builtin").lsp_references { trim_text = true }
			end, "[G]oto [R]eferences")

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

function M.setup(opts)
	opts = opts or {}
	local servers = opts.servers or {}

	local capabilities = make_capabilities()

	require("mason").setup()

	require("mason-lspconfig").setup({
		ensure_installed = {},

		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup(
					vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, servers[server_name] or {})
				)
			end,
		},
	})

	setup_attach()
end

return M
