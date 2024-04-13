require('telescope').load_extension('diff')

vim.keymap.set('n', '<leader>ddf', function()
  require('telescope').extensions.diff.diff_files({ hidden = true })
end, { desc = '[D]ocument [D]iff [F]ind Files' })
vim.keymap.set('n', '<leader>ddc', function()
  require('telescope').extensions.diff.diff_current({ hidden = true })
end, { desc = '[D]ocument [D]iff [C]urrent' })

