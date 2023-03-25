local M = {}
local rc = require 'cmp.rc'

local foundations = require 'foundations.foundations'

local cmp = {
  'hrsh7th/nvim-cmp',
  tag = 'v0.0.1',
  opt = true,
  module = { 'cmp' },
  config = rc.config_cmp,
  requires = {
    {
      "onsails/lspkind.nvim",
      opts = true,
    }
  },
  wants = {
    "lspkind.nvim",
    opts = true,
  },
}

M.buffer = {
  'hrsh7th/cmp-buffer',
  commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  opt = true,
  event = { 'InsertEnter', 'CmdlineEnter' },
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
  event = { 'InsertEnter', 'CmdlineEnter' },
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
    M.luasnip,
  },
  wants = {
    'nvim-cmp',
    'nvim-lspconfig',
    'cmp_luasnip',
  },
} -- depend on built-in lsp

M.nvim_lsp_signature_help = {
  'nvim_lsp_signature_help',
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

M.cmp_cmdline = {
  'hrsh7th/cmp-cmdline',
  commit = '8fcc934a52af96120fe26358985c10c035984b53',
  opt = true,
  event = { 'CmdlineEnter' },
  config = rc.config_cmp_cmdline,
  requires = {
    cmp,
    M.path
  },
  wants = {
    'nvim-cmp',
    'cmp-path'
  }
}

M.cmp_copilot = {
  'zbirenbaum/copilot-cmp',
  opt = true,
  commit = '92535dfd9c430b49ca7d9a7da336c5db65826b65',
  cmd = { 'Copilot' },
  event = { 'InsertEnter' },
  run = 'Copilot auth',
  config = rc.config_cmp_copilot,
  requires = {
    cmp,
    "zbirenbaum/copilot.lua",
    opt = true,
    commit = 'db62371b6eac73954c194f3c8faee36cffee8135',
  },
  wants = {
    'nvim-cmp',
    'copilot.lua',
  }
}

return M
