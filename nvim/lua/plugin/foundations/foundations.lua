local M = {}

local rc = require 'plugin.foundations.rc'
M.plenary = {
  'nvim-lua/plenary.nvim',
  tag = 'v0.1.3',
  opt = true,
  module_pattern = { 'plenary.*' },
}

M.nvim_web_devicions = {
  'nvim-tree/nvim-web-devicons',
  commit = '4af94fec29f508159ceab5413383e5dedd6c24e3',
  opt = true,
  module = { 'nvim-web-devicons' },
}

M.treesitter = {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.8.5.2',
  opt = true,
  module_pattern = { 'nvim-treesitter.*' },
  run = ':TSUpdate',
  config = rc.config_treesitter,
}

M.nvim_lspconfig = {
  'neovim/nvim-lspconfig',
  tag = 'v0.1.6',
  opt = true,
  event = { "BufReadPre" },
  config = require 'plugin.foundations.nvim-lspconfig_rc',
}

M.luasnip = {
  'L3MON4D3/LuaSnip',
  commit = '009887b76f15d16f69ae1341f86a7862f61cf2a1',
  opt = true,
  module = { 'luasnip' },
  config = rc.config_luasnip,
}

return M
