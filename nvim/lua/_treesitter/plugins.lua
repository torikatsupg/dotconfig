local M = {}
local foundation = require 'foundations.plugins'

M.nvim_ts_context_commentstring = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  opt = true,
  module_pattern = 'ts_context_commentstring.*',
  config = function() require '_treesitter.config'.nvim_ts_context_commentstring() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_context_vt = {
  'haringsrob/nvim_context_vt',
  opt = true,
  config = function() require '_treesitter.config'.context_vt() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_ts_rainbow = {
  'HiPhish/nvim-ts-rainbow2',
  opt = true,
  event = 'BufRead',
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.hlargs = {
  'm-demare/hlargs.nvim',
  opt = true,
  event = 'BufRead',
  config = function() require '_treesitter.config'.hlargs() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_ts_autotag = {
  'windwp/nvim-ts-autotag',
  opt = true,
  event = 'BufRead',
  config = function() require '_treesitter.config'.ts_autotag() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_autopairs = {
  'windwp/nvim-autopairs',
  opt = true,
  event = 'InsertEnter',
  config = function() require '_treesitter.config'.autopairs() end,
  requires = {
    foundation.treesitter,
    require '_cmp.plugins'.cmp,
  },
  wants = {
    foundation.treesitter.name,
    require '_cmp.plugins'.cmp.name,
  }
}

M.vim_matchup = {
  'andymass/vim-matchup',
  opt = true,
  event = 'CursorHold',
  config = function() require '_treesitter.config'.matchup() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nightfox = {
  'EdenEast/nightfox.nvim',
  opt = true,
  event = 'VimEnter',
  config = function() require '_treesitter.config'.nightfox() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
  name = 'nightfox.nvim',
}

return M
