local M = {}

M.setup_mason = function()
  local cmd = vim.api.nvim_create_user_command
  cmd("Mason", function() require 'mason.ui'.open() end, { bang = true })
end

M.config_mason = function()
  require 'mason'.setup()
end

M.config_mason_lspconfig = function()
  local mason_lspconfig= require 'mason-lspconfig'
  mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true,
  })
  mason_lspconfig.setup_handlers({
    function (server)
      local opts = {

      }
      if server == 'lua_ls' then
        opts.settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        }
      end
      require 'lspconfig'[server].setup(opts)
    end
  })
end


return M
