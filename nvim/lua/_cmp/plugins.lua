local M = {}

local foundations = require 'foundations.plugins'

M.cmp = {
  'hrsh7th/nvim-cmp',
  tag = 'v0.0.1',
  opt = true,
  module = { 'cmp' },
  config = function() require '_cmp.config'.cmp() end,
  requires = {
    "onsails/lspkind.nvim",
    config = function() require '_cmp.config'.lspkind() end,
    opts = true,
  },
  wants = {
    "lspkind.nvim",
  },
  name = 'nvim-cmp',
}

M.buffer = {
  'hrsh7th/cmp-buffer',
  commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  opt = true,
  event = { 'InsertEnter', 'CmdlineEnter' },
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.buffer() end,
}

M.dictionary = {
  'uga-rosa/cmp-dictionary',
  tag = 'v2.0.0',
  opt = true,
  run = 'brew install wordnet',
  event = 'InsertEnter',
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.dictionary() end
}


M.path = {
  'hrsh7th/cmp-path',
  commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
  opt = true,
  event = { 'InsertEnter', 'CmdlineEnter' },
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.path() end,
  name = 'cmp-path',
}

M.emoji = {
  'hrsh7th/cmp-emoji',
  commit = '19075c36d5820253d32e2478b6aaf3734aeaafa0',
  opt = true,
  event = 'InsertEnter',
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.emoji() end,
}

M.luasnip = {
  'saadparwaiz1/cmp_luasnip',
  commit = '18095520391186d634a0045dacaa346291096566',
  opt = true,
  module = 'cmp_luasnip',
  event = 'InsertEnter',
  config = function() require '_cmp.config'.luasnip() end,
  requires = {
    M.cmp,
    foundations.luasnip,
  },
  wants = {
    M.cmp.name,
    foundations.luasnip.name,
  }
}

M.nvim_lsp = {
  'hrsh7th/cmp-nvim-lsp',
  commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
  opt = true,
  event = 'InsertEnter',
  config = function() require '_cmp.config'.lsp() end,
  requires = {
    M.cmp,
    foundations.nvim_lspconfig,
    M.luasnip,
  },
  wants = {
    M.cmp.name,
    foundations.nvim_lspconfig.name,
    foundations.luasnip.name,
  },
}

M.nvim_lsp_signature_help = {
  'hrsh7th/cmp-nvim-lsp-signature-help',
  commit = '3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1',
  opt = true,
  event = 'InsertEnter',
  config = function() require '_cmp.config'.lsp_signature_help() end,
  requires = M.cmp,
  wants = M.cmp.name,
}

M.cmp_cmdline = {
  'hrsh7th/cmp-cmdline',
  commit = '8fcc934a52af96120fe26358985c10c035984b53',
  opt = true,
  event = 'CmdlineEnter',
  config = function() require '_cmp.config'.cmdline() end,
  requires = {
    M.cmp,
    M.path
  },
  wants = {
    M.cmp.name,
    M.path.name
  }
}

M.cmp_copilot = {
  'zbirenbaum/copilot-cmp',
  opt = true,
  commit = '92535dfd9c430b49ca7d9a7da336c5db65826b65',
  cmd = 'Copilot',
  event = 'InsertEnter',
  run = 'Copilot auth',
  config = function() require '_cmp.config'.copilot() end,
  requires = {
    M.cmp,
    "zbirenbaum/copilot.lua",
    opt = true,
    commit = 'db62371b6eac73954c194f3c8faee36cffee8135',
  },
  wants = {
    M.cmp.name,
    'copilot.lua',
  }
}

M.cmdline_history = {
  'dmitmel/cmp-cmdline-history',
  commit = '003573b72d4635ce636234a826fa8c4ba2895ffe',
  opt = true,
  event = 'CmdlineEnter',
  config = function() require '_cmp.config'.cmdline_history() end,
  requires = {
    M.cmp,
  },
  wants = {
    M.cmp.name,
  }
}

return M
