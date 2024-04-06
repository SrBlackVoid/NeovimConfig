local builtin = require('telescope.builtin')
-- Telescope shortcuts

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles'})
vim.keymap.set('n', '<leader>sr', builtin.git_files, { desc = '[S]earch [R]epository'})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep'})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps'})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers'})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics'})

vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim Files'}
)

--[[ vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)

	local map = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
	end

	--Search for symbols within current document
	map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

	--Find references for the word under your cursor
	map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

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
}) ]]
