local M = {}

M.plenary = {
  'nvim-lua/plenary.nvim',
  tag = 'v0.1.3',
  opt = true,
  module_pattern = { 'plenary.*' },
  name = 'plenary.nvim',
}

M.nvim_web_devicions = {
  'nvim-tree/nvim-web-devicons',
  commit = '4af94fec29f508159ceab5413383e5dedd6c24e3',
  opt = true,
  module = { 'nvim-web-devicons' },
  name = 'nvim-web-devicons',
}

M.treesitter = {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.9.1',
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
      commit = '698cd0c4f10480991e665f31977650858d625af1',
      opt = true,
      wants = { 'mason-lspconfig.nvim', 'formatter.nvim' },
      cmd = { "Mason" },
    },
    {
      'williamboman/mason-lspconfig.nvim',
      commit = 'a81503f0019942111fe464209237f8b4e85f4687',
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
  tag = 'v1.2.1',
  opt = true,
  run = "make install_jsregexp",
  module = { 'luasnip' },
  config = function() require 'foundations.config'.luasnip() end,
  name = 'LuaSnip',
}

M.nui = {
  "MunifTanjim/nui.nvim",
  commit = '0dc148c6ec06577fcf06cbab3b7dac96d48ba6be',
  opt = true,
  name = 'nui.nvim',
}

return M
