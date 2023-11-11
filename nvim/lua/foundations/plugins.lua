local M = {}

M.plenary = {
  'nvim-lua/plenary.nvim',
  opt = true,
  module_pattern = { 'plenary.*' },
  name = 'plenary.nvim',
}

M.nvim_web_devicions = {
  'nvim-tree/nvim-web-devicons',
  opt = true,
  module = { 'nvim-web-devicons' },
  name = 'nvim-web-devicons',
}

M.treesitter = {
  'nvim-treesitter/nvim-treesitter',
  opt = true,
  module_pattern = { 'nvim-treesitter.*' },
  run = ':TSUpdate',
  config = function() require 'foundations.config'.treesitter() end,
  event = { 'VimEnter' },
  name = 'nvim-treesitter',
}

M.nvim_lspconfig = {
  'neovim/nvim-lspconfig',
  opt = true,
  module = { 'lspconfig' },
  cmd = { "LspInfo", "LspLog" },
  event = { 'BufRead' },
  config = function() require 'foundations.config'.lspconfig() end,
  requires = {
    {
      'williamboman/mason.nvim',
      opt = true,
      wants = { 'mason-lspconfig.nvim', 'formatter.nvim' },
      cmd = { "Mason" },
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opt = true,
    },
    {
      'mhartington/formatter.nvim',
      opt = true,
    },
  },
  wants = {
    'mason.nvim',
    'mason-lspconfig.nvim',
  },
  name = 'nvim-lspconfig',
}

M.luasnip = {
  'L3MON4D3/LuaSnip',
  opt = true,
  run = "make install_jsregexp",
  module = { 'luasnip' },
  config = function() require 'foundations.config'.luasnip() end,
  name = 'LuaSnip',
}

M.nui = {
  "MunifTanjim/nui.nvim",
  opt = true,
  name = 'nui.nvim',
}

return M
