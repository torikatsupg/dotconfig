local M = {}

local foundations = require 'foundations.plugins'

M.cmp = {
  'hrsh7th/nvim-cmp',
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
  opt = true,
  event = { 'InsertEnter', 'CmdlineEnter' },
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.buffer() end,
}

M.dictionary = {
  'uga-rosa/cmp-dictionary',
  opt = true,
  run = 'brew install wordnet',
  event = 'InsertEnter',
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.dictionary() end
}


M.path = {
  'hrsh7th/cmp-path',
  opt = true,
  event = { 'InsertEnter', 'CmdlineEnter' },
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.path() end,
  name = 'cmp-path',
}

M.emoji = {
  'hrsh7th/cmp-emoji',
  opt = true,
  event = 'InsertEnter',
  requires = M.cmp,
  wants = M.cmp.name,
  config = function() require '_cmp.config'.emoji() end,
}

M.luasnip = {
  'saadparwaiz1/cmp_luasnip',
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
  opt = true,
  event = 'InsertEnter',
  config = function() require '_cmp.config'.lsp_signature_help() end,
  requires = M.cmp,
  wants = M.cmp.name,
}

M.cmp_cmdline = {
  'hrsh7th/cmp-cmdline',
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
  cmd = 'Copilot',
  event = 'InsertEnter',
  run = 'Copilot auth',
  config = function() require '_cmp.config'.copilot() end,
  requires = {
    M.cmp,
    "zbirenbaum/copilot.lua",
    opt = true,
  },
  wants = {
    M.cmp.name,
    'copilot.lua',
  }
}

M.cmdline_history = {
  'dmitmel/cmp-cmdline-history',
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
