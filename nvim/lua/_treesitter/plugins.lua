local M = {}
local foundation = require 'foundations.plugins'

M.nvim_ts_context_commentstring = {
  'JoosepAlviste/nvim-ts-context-commentstring',
  commit = '7241635869b7a8115893ffa67bab3907756caf4f',
  opt = true,
  module_pattern = 'ts_context_commentstring.*',
  config = function() require '_treesitter.config'.nvim_ts_context_commentstring() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_context_vt = {
  'haringsrob/nvim_context_vt',
  commit = 'a14f9292b4bd68ceed433fc513f287641816dc6d',
  opt = true,
  config = function() require '_treesitter.config'.context_vt() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_ts_rainbow = {
  'HiPhish/nvim-ts-rainbow2',
  tag = 'v2.3.0',
  opt = true,
  event = 'BufRead',
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.hlargs = {
  'm-demare/hlargs.nvim',
  commit = '6218a401824c5733ac50b264991b62d064e85ab2',
  opt = true,
  event = 'BufRead',
  config = function() require '_treesitter.config'.hlargs() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_ts_autotag = {
  'windwp/nvim-ts-autotag',
  commit = '6be1192965df35f94b8ea6d323354f7dc7a557e4',
  opt = true,
  event = 'BufRead',
  config = function() require '_treesitter.config'.ts_autotag() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nvim_autopairs = {
  'windwp/nvim-autopairs',
  commit = 'de4f7138a68d5d5063170f2182fd27faf06b0b54',
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
  commit = '6dbe108230c7dbbf00555b7d4d9f6a891837ef07',
  opt = true,
  event = 'CursorHold',
  config = function() require '_treesitter.config'.matchup() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
}

M.nightfox = {
  'EdenEast/nightfox.nvim',
  tag = 'v3.6.1',
  opt = true,
  event = 'VimEnter',
  config = function() require '_treesitter.config'.nightfox() end,
  requires = foundation.treesitter,
  wants = foundation.treesitter.name,
  name = 'nightfox.nvim',
}

return M
