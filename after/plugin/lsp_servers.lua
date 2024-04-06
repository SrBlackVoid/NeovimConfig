
--[[ require'lspconfig'.powershell_es.setup{
    bundle_path = 'c:/Users/srayb/AppData/Local/nvim-data/mason/packages/powershell-editor-services',
    settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } }
} ]]

--[[ require'lspconfig'.omnisharp.setup{
	cmd = { "dotnet", 'c:/Users/srayb/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll'}
} ]]

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {}
  },
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
}
