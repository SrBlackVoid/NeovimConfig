local paths = require("SrBlackVoid.config.local")

return {{
	"rmagatti/auto-session",
	event = { "BufReadPre", "BufNewFile" },

	--enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	keys = {
		{ '<leader>Sf', ':AutoSession search<CR>', desc = "[S]ession [F]ind" },
	},
	opts = {
		auto_restore = false,
		suppressed_dirs = paths.project_exclude,
		git_use_branch_name = true,
	},
	init = function ()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end
}}
