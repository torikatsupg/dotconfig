return function()
  require'lspconfig'.tsserver.setup {}
  require'lspconfig'.dartls.setup {}
  require 'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', },
        diagnostics = { globals = { 'vim', 'hs' }, },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false, },
      },
    },
  }
end
