local M = {}
local rc = require 'plugin.cmp.rc'

local foundations = require 'plugin.foundations.foundations'
local mason  = require 'plugin.mason.plugins'

local cmp = {
  'hrsh7th/nvim-cmp',
  tag = 'v0.0.1',
  opt = true,
  module = { 'cmp' },
  config = rc.config_cmp,
}

M.buffer = {
  'hrsh7th/cmp-buffer',
  commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  opt = true,
  event = { 'InsertEnter' },
  requires = { cmp },
  wants = { 'nvim-cmp' },
  config = rc.config_buffer
}

M.dictionary = {
  'uga-rosa/cmp-dictionary',
  tag = 'v2.0.0',
  opt = true,
  run = 'brew install wordnet',
  event = { 'InsertEnter' },
  requires = { cmp },
  wants = { 'nvim-cmp' },
  config = rc.config_cmp_dictionary,
}


M.path = {
  'hrsh7th/cmp-path',
  commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
  opt = true,
  event = { 'InsertEnter' },
  requires = { cmp },
  wants = { 'nvim-cmp' },
  config = rc.config_cmp_path,
}

M.emoji = {
  'hrsh7th/cmp-emoji',
  commit = '19075c36d5820253d32e2478b6aaf3734aeaafa0',
  opt = true,
  event = { 'InsertEnter' },
  requires = { cmp },
  wants = { 'nvim-cmp' },
  config = rc.config_cmp_emoji,
}

M.luasnip = {
  'saadparwaiz1/cmp_luasnip',
  commit = '18095520391186d634a0045dacaa346291096566',
  opt = true,
  module = { 'cmp_luasnip' },
  event = { 'InsertEnter' },
  config = rc.config_cmp_luasnip,
  requires = {
    cmp,
    foundations.luasnip,
  },
  wants = {
    'nvim-cmp',
    'LuaSnip',
  }
}

M.nvim_lsp = {
  'hrsh7th/cmp-nvim-lsp',
  commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
  opt = true,
  event = { 'InsertEnter' },
  config = rc.config_cmp_nvim_lsp,
  requires = {
    cmp,
    foundations.nvim_lspconfig,
    mason.mason_lspconfig,
    M.luasnip,
  },
  wants = {
    'nvim-cmp',
    'nvim-lspconfig',
    'mason-lspconfig.nvim',
    'cmp_luasnip',
  },
} -- depend on built-in lsp

M.nvim_lsp_signature_help = {
     'nvim_lsp_signature_help' ,
     commit = '3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1',
     opt = true,
     event = { 'LspAttach' },
     config = rc.config_nvim_lsp_signature_help,
     requires = {
      cmp,
     },
     wants = {
      'nvim-cmp',
     },
    }

return M
