local M = {}
local foundation = require 'foundations.plugins'

M.nvim_ts_context_commentstring = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  commit = '729d83ecb990dc2b30272833c213cc6d49ed5214',
  opt = true,
  module_pattern = { 'ts_context_commentstring.*' },
  config = function () require'_treesitter.config'.nvim_ts_context_commentstring() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter',
}

M.nvim_context_vt = {
  'haringsrob/nvim_context_vt',
  commit = 'e592a9142fbfe0878ce886cd0d745963604c61d2',
  opt = true,
  config = function () require '_treesitter.config'.context_vt() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter',
}

M.nvim_ts_rainbow = {
  'mrjones2014/nvim-ts-rainbow',
  commit = '840039440e012ad798ef31349b93a5d4365023ff',
  opt = true,
  event = { 'BufRead' },
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
}

M.hlargs = {
   'm-demare/hlargs.nvim',
   commit = 'a7ad6ed8d6e27ea4dd13fda63fa732e9196ba4ea',
   opt = true,
  event = { 'BufRead' },
    config = function () require '_treesitter.config'.hlargs() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
  }

M.nvim_ts_autotag = {
  'windwp/nvim-ts-autotag',
  commit = 'fdefe46c6807441460f11f11a167a2baf8e4534b',
  opt = true,
  event = { 'BufRead' }, -- need BufRead
  config = function () require '_treesitter.config'.ts_autotag() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
}

M.nvim_autopairs = {
  'windwp/nvim-autopairs',
  commit = 'e755f366721bc9e189ddecd39554559045ac0a18',
  opt = true,
  event = { 'InsertEnter' },
  config = function () require '_treesitter.config'.autopairs() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
}

M.vim_matchup = {
  'andymass/vim-matchup',
  tag = 'v0.7.2',
  opt = true,
  event = { 'CursorHold' },
  config = function () require '_treesitter.config'.matchup() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
}

M.nightfox =  {
  'EdenEast/nightfox.nvim',
  tag = 'v3.3.0',
  opt = true,
  event = {'VimEnter'},
  config = function () require '_treesitter.config'.nightfox() end,
  requires = foundation.treesitter,
  wants = 'nvim-treesitter'
}

return M
