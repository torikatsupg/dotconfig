local M = {}

local f = require 'foundations.plugins'
M.neotree = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v2.x",
  opt = true,
  module = { 'neo-tree' },
  setup = function()
    vim.g.neo_tree_remove_legacy_commands = true
    vim.api.nvim_create_user_command(
      "E",
      function() require("neo-tree").float() end,
      { bang = true }
    )
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
