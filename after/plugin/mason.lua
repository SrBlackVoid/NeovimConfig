require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = { "lua_ls"},
	automatic_installation = true,
}
--[[
require'lspconfig'.powershell_es.setup{
	filetypes = { "ps1", "psm1" , "psd1"},
	bundle_path = '~/AppData/Local/nvim-data/mason/packages/powershell-editor-services',
	--cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', '~/AppData/nvim-data/lsp_servers/powershell_es/PowerShellEditorServices/Start-EditorServices.ps1'},
	settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } }
}
]]
