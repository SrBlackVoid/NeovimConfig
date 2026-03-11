--[[ Set up a local.lua file in the same dir as this file with same overall format
	 Setting paths specific to the local workstation
--]]
return {
	-- Set paths you want to exclude from project.nvim
	project_exclude = { 'e:/Code Repos/', 'c:/Users/srayb' },

	-- Set paths you want to include in Telescope broad 'Search Files', e.g. root workspace dir
	root_search_dirs = 'e:/Code Repos/'
}
