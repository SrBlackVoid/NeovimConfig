return {
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		config = function()
			require('Comment').setup()

			local ft = require('Comment.ft')

			ft({'ps1', 'psm1', 'psd1'}, {'#%s', '<#%s#>'})
		end
	}
}
