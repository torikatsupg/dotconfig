local M = {}

local rc = require 'plugin.mason.rc'
local foundations = require 'plugin.foundations.foundations'

M.mason = {
  'williamboman/mason.nvim',
  commit = '698cd0c4f10480991e665f31977650858d625af1',
  opt = true,
  module_pattern = { 'mason.*' },
  setup = rc.setup_mason,
  config = rc.config_mason,
}

M.mason_lspconfig = {
  'williamboman/mason-lspconfig.nvim',
  commit = 'a81503f0019942111fe464209237f8b4e85f4687',
  opt = true,
 	event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = rc.config_mason_lspconfig,
  requires = {
    M.mason,
    foundations.nvim_lspconfig
  },
  wants = {
    'mason.nvim',
    'nvim-lspconfig'
  }
}

return M
