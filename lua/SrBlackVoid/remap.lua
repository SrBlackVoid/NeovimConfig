vim.g.mapleader = " "

--Open up NetRW
vim.keymap.set("n", "<leader>f", vim.cmd.Ex, { desc = "[F]ile Explorer"})

--Open up NeoTree
-- vim.keymap.set("n", "<C-n>", vim.cmd.Neotree)

-- Move between windows easier
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--Remap word deletion during insert mode (not currently working)
-- vim.keymap.set('i', '<C-BS>', '<C-W>', { desc = 'Full word deletion' })

--Quickly clear highlighting
vim.keymap.set('n', '<leader>h', vim.cmd.noh, { desc = 'Clear [H]ighlighting'})

--Exit terminal mode with Esc
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit Terminal with Esc' } )
