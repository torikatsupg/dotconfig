local M = {}

M.setup_mason = function()
  local cmd = vim.api.nvim_create_user_command
  cmd("Mason", function() require 'mason.ui'.open() end, { bang = true })
end

M.config_mason = function()
  require 'mason'.setup()
end

M.config_mason_lspconfig = function()
  require "mason-lspconfig".setup({
    ensure_installed = { "lua_ls" },
    automatic_installation = true,
  })
end


return M
