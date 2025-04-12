-- Turn on line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and NeoVim.
vim.opt.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching unless explicitly defined
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set tab spacing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Minimal # of screen lines to keep above/below the cursor
vim.opt.scrolloff = 10

-- Set highlight on search
vim.opt.hlsearch = true

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--Set default terminal to PowerShell
vim.g.terminal_emulator='pwsh'

--Set shell to PowerShell 7
vim.o.shell = 'pwsh'
local powershell_options = {
	shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}

for option, value in pairs(powershell_options) do
	vim.opt[option] = value
end

vim.opt.colorcolumn = '80'
