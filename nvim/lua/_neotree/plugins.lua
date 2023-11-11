local M = {}

local f = require 'foundations.plugins'
M.neotree = {
  'nvim-neo-tree/neo-tree.nvim',
  opt = true,
  module = { 'neo-tree' },
  setup = function()
    vim.api.nvim_create_user_command("E", function() require '_neotree.config'.open_filesystem() end, {})
  end,
  config = function()
    require '_neotree.config'.neotree()
  end,
  requires = {
    f.plenary,
    f.nvim_web_devicions,
    f.nui,
  },
  wants = {
    f.plenary.name,
    f.nvim_web_devicions.name,
    f.nui.name,
  },
}
return M
