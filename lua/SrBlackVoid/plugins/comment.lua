return {{
	"numToStr/Comment.nvim",
	keys = {
		{ 'gc', mode = { 'n', 'v' } },
		{ 'gb', mode = { 'n', 'v' } },
	},
	config = function()
		require('Comment').setup()

		local ft = require('Comment.ft')
		ft({'ps1', 'psm1', 'psd1'}, {'#%s', '<#%s#>'})
	end
}}
