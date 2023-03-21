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
  -- event = { 'LspAttach' },
  -- event = { 'BufRead' }
  event = { 'VimEnter' }
}

M.nvim_lspconfig = {
  'neovim/nvim-lspconfig',
  opt = true,
  module = { 'lspconfig' },
  cmd = { "LspInfo", "LspLog" },
  event = { 'BufRead' },
  config = rc.config_nvim_lspconfig,
  requires = {
    {
      'williamboman/mason.nvim',
      commit = '698cd0c4f10480991e665f31977650858d625af1',
      opt = true,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      commit = 'a81503f0019942111fe464209237f8b4e85f4687',
      opt = true,
    },
  },
  wants = {
    'mason.nvim',
    'mason-lspconfig.nvim',
  }
}

M.luasnip = {
  'L3MON4D3/LuaSnip',
  tag = 'v1.2.1',
  opt = true,
  run = "make install_jsregexp",
  module = { 'luasnip' },
  config = rc.config_luasnip,
}

return M
