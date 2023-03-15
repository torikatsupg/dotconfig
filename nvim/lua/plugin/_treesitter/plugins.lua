local M = {}

local foundation = require 'plugin.foundations.foundations'
local rc = require 'plugin._treesitter.rc'

M.nvim_ts_context_commentstring = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  commit = '729d83ecb990dc2b30272833c213cc6d49ed5214',
  opt = true,
  module_pattern = { 'ts_context_commentstring.*' },
  config = rc.config_nvim_ts_context_commentstring,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.nvim_context_vt = {
  'haringsrob/nvim_context_vt',
  commit = 'e592a9142fbfe0878ce886cd0d745963604c61d2',
  opt = true,
  ft = { 'dart', 'lua' },
  config = rc.config_nvim_context_vt,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.nvim_ts_rainbow = {
  'mrjones2014/nvim-ts-rainbow',
  commit = '840039440e012ad798ef31349b93a5d4365023ff',
  opt = true,
  event = { 'BufRead' },
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.hlargs = {
   'm-demare/hlargs.nvim',
   commit = 'a7ad6ed8d6e27ea4dd13fda63fa732e9196ba4ea',
   opt = true,
  event = { 'BufRead' },
    config = rc.config_hlargs,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
  }

M.nvim_ts_autotag = {
  'windwp/nvim-ts-autotag',
  commit = 'fdefe46c6807441460f11f11a167a2baf8e4534b',
  opt = true,
  -- event = { 'BufRead' }, -- need BufRead
  ft = {
    'html',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'svelte',
    'vue',
    'tsx',
    'jsx',
    'rescript',
    'xml',
    'php',
    'markdown',
    'glimmer','handlebars','hbs'
  },

  -- TODO(torikatsu): specify filetype
  config = rc.config_nvim_ts_autotag,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.nvim_autopairs = {
  'windwp/nvim-autopairs',
  commit = 'e755f366721bc9e189ddecd39554559045ac0a18',
  opt = true,
  event = { 'InsertEnter' },
  config = rc.config_nvim_autopairs,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.vim_matchup = {
  'andymass/vim-matchup',
  tag = 'v0.7.2',
  opt = true,
  event = { 'CursorHold' },
  config = rc.config_matchup,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  }
}

M.nightfox =  {
  'EdenEast/nightfox.nvim',
  tag = 'v3.3.0',
  opt = true,
  event = {'VimEnter'},
  config = rc.config_nightfox,
  requires = {
    foundation.treesitter
  },
  wants = {
    'nvim-treesitter'
  },
}

return M
