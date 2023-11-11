local M = {}

M.vim_better_whitespace = {
  'ntpeters/vim-better-whitespace',
  opt = true,
  event = { 'BufRead' },
}

M.gitsigns = {
  'lewis6991/gitsigns.nvim',
  config = function() require 'others.config'.gitsigns() end,
  opt = true,
  event = { 'Bufread' },
}

M.which_key_nvim = {
  'folke/which-key.nvim',
  config = function() require 'others.config'.which_key() end,
  opt = true,
  event = { 'CursorHold' },
}

M.vim_auto_save = {
  'vim-scripts/vim-auto-save',
  config = function() require 'others.config'.auto_save() end,
  opt = true,
  event = { 'InsertLeave' },
}

M.nvim_context_commentstring = {
  'suy/vim-context-commentstring',
  opt = true,
  event = { 'BufRead' },
  requires = {
    { 'numToStr/Comment.nvim',
      opt = true,
      config = function() require 'others.config'.comment() end,
    }
  },
}

return M
