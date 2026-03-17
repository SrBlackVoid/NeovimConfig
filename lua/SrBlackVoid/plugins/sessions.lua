local paths = require("SrBlackVoid.config.local")

return {{
	"rmagatti/auto-session",
	dependencies = {
		'nvim-telescope/telescope.nvim',
	},
	event = { "BufReadPre", "BufNewFile" },

	--enables autocomplete for opts
	---@module "auto-session"
	---@diagnostic disable-next-line: undefined-doc-name
	---@type AutoSession.Config
	keys = {
		{ '<leader>Sf', ':AutoSession search<CR>', desc = "[S]ession [F]ind" },
		{ '<leader>Ss', function()
			local session_name = vim.fn.input("Session name: ")
			if session_name ~= "" then
				require('auto-session').save_session(session_name)
			end
		end, desc = "[S]ession [S]ave" },
	},
	opts = {
		auto_restore = false,
		suppressed_dirs = paths.project_exclude,
		git_use_branch_name = true,

		---@diagnostic disable-next-line: undefined-doc-name
		---@type SessionLens
		session_lens = {
			picker = "telescope"
		},
	},
	init = function ()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end
}}
